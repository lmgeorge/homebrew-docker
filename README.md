# homebrew-docker

A better way to install Docker Desktop app (Docker.app) on macOS using Homebrew.

## Usage


| Note: You need administrative privileges to install this cask! |
| --------------------------------------------------------------- |


First, add this tap to your Brew. This will to clone the tap repository and symlink all its formulae.

```shell
$ brew tap lmgeorge/docker
```

Next, install the cask:

```shell
$ brew install --cask docker-desktop
```

## Tips

1. If you want to purge Docker from your machine, you are better off using Homebrew to remove the app instead (`brew remove --zap`). Docker's uninstall process via the app leaves a lot of artifacts behind that can mess with reinstallation later.

