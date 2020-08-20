VERSION=$(shell yq -r '.version' < repositories.yaml)

TAG_NAME=v${VERSION}

.PHONY: publish

publish: repositories.yaml
	git tag -f "${TAG_NAME}"
	ghr -replace "${TAG_NAME}" repositories.yaml
