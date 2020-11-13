VERSION=$(shell yq read repositories.yaml 'version'))

TAG_NAME=v${VERSION}

.PHONY: publish

publish: repositories.yaml
	git tag -f "${TAG_NAME}"
	ghr -replace "${TAG_NAME}" repositories.yaml
