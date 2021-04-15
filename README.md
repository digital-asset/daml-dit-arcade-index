daml-dit-arcade-index
====

This repository defines a list of packages that are included in the [Daml Hub](https://projectdabl.com/) Arcade. It consists of both **Sample Apps** and **Integrations**, whose locations are declared in the `repositories.yaml` index within this project.

# Adding a Sample App

Do you have a fully-fledged Daml application that runs on Daml Hub with a DAR model, triggers, custom UI, and other artifacts? Want to see it included as a one-click deployable Sample App? Read on.

All Sample Apps (and Integrations) are consumed by Daml Hub in the form of [DIT files](https://github.com/digital-asset/daml-dit-api). In short, a DIT file is a single package that contains the metadata and deployable entities that make up your application.

There are 5 straightforward tasks to getting your application ready and published on Daml Hub's arcade:

1. [Configure](#Configure)
2. [Build](#Build)
3. [Release](#Release)
4. [List](#List)
5. [Update](#Update)

> _Note_: Digital Asset reserves the right to make the ultimate determination of officially including your application in the arcade. However, an application DIT file can still be manually uploaded by any user to a Daml Hub ledger -- outside of the arcade -- so it may still prove a useful way of packaging, testing, and/or distributing non-official Daml Hub apps, depending on your use case.

## Configure

DIT packages are configured with a `dabl-meta.yaml` file in the root directory of your application.

At a minimum, this file needs a top-level `catalog` key with the following items:

```yaml
catalog:
    name: dabl-chat               # Machine-readable name
    version: 0.2.2                # Semver version tag
    short_description: DABL Chat  # Human readable name
    description: A straightforward web chat app.
    author: Digital Asset (Switzerland) GmbH
    url: https://github.com/digital-asset/dablchat  # Link to source code
    license: Apache-2.0
    tags: [dabl-sample-app, application]  # These tags tell Daml Hub whether this package is an app or an integration
    icon_file: dabl-chat.png      # File name for app icon
```

The icon file name is resolved relative to a `pkg/` directory that must be in the root of your project. Make sure to create that directory and place your app icon in there, for `ddit` to find and bundle.

We strongly urge versioning your application with [semver](semver.org), as Daml Hub will default to providing the latest available version.

## Build

The command line tool `ddit` can help with building your DIT. [See here](https://github.com/digital-asset/daml-dit-ddit) for detailed instructions on installing and using the CLI.

The tool can be easily integrated into existing build processes, e.g., `make` targets. See existing sample apps for example Makefiles.

## Release

Once you've built a DIT file, you'll want to publish it by uploading it to the GitHub Releases page of your project's repository. This can be done in any manner convenient to you, either manually or through a CI process.

Don't forget to include the built DIT as a binary file with the Release.

## List

After the DIT is uploaded to your repository's Releases page, submit a PR to this repo for inclusion! Add an entry to `repositories.yaml` for your application in the form of

```
  - type: github-release
    owner: USERNAME
    repository: REPONAME
```

and, after approval & merging, should soon begin showing up shortly.

Daml Hub subscribes to all of the Release pages specified in the index, and when it detects a new release that contains a DIT file, will make it available for deployment from the [Console](https://projectdabl.com/docs/quickstart/#sample-apps).

## Update

After publishing your Daml Hub app, pushing updates to the arcade is easy and automatic. Simply increment your app's version tag in `dabl-meta.yaml`, and publish a new GH Release with an updated DIT file containing the new code.

The new version will become deployable from Daml Hub sometime within 30 minutes to an hour of the release.
