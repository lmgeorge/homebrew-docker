
# Notes

`docker-desktop` refers to the Homebrew cask `docker` which installs the `Docker Desktop` app (`Docker.app`)
    -
`docker` referes to formula that install barebones Docker CLI

## Docker core executables

```
com.docker.cli
	-> /Applications/Docker.app/Contents/Resources/bin/com.docker.cli*
    b> docker-desktop

docker
	-> /Applications/Docker.app/Contents/Resources/bin/docker*
    b> docker-desktop | docker

docker-compose
	-> /Applications/Docker.app/Contents/Resources/bin/docker-compose*
    b> docker-desktop | docker-compose

docker-compose-v1
	-> /Applications/Docker.app/Contents/Resources/bin/docker-compose-v1/docker-compose*
    b> docker-desktop

docker-credential-desktop
	-> /Applications/Docker.app/Contents/Resources/bin/docker-credential-desktop*
    b> docker-desktop

docker-credential-ecr-login
	-> /Applications/Docker.app/Contents/Resources/bin/docker-credential-ecr-login*
    b> docker-desktop | docker-credential-helper-ecr

docker-credential-osxkeychain
	-> /Applications/Docker.app/Contents/Resources/bin/docker-credential-osxkeychain*
    b> docker-desktop | docker-credential-helper

docker-index
	-> /Applications/Docker.app/Contents/Resources/bin/docker-index*
    b> docker-desktop

hub-tool
	-> /Applications/Docker.app/Contents/Resources/bin/hub-tool*
    b> docker-desktop

kubectl
	-> /Applications/Docker.app/Contents/Resources/bin/kubectl*
    b> docker-desktop | kubernetes-cli

kubectl.docker
	-> /Applications/Docker.app/Contents/Resources/bin/kubectl*
    b> docker-desktop | kubernetes-cli (symlink)

vpnkit
	-> /Applications/Docker.app/Contents/Resources/bin/com.docker.vpnkit*
    b> docker-desktop
```

## CLI Plugins
All plugins are symlinked in `~/.docker/cli-plugins`. Initialized after running `Docker.app` for the first time.

```
docker-buildx
	-> /Applications/Docker.app/Contents/Resources/cli-plugins/docker-buildx*
    b> docker-desktop | docker-buildx

docker-compose
	-> /Applications/Docker.app/Contents/Resources/cli-plugins/docker-compose*
    b> docker-desktop | docker-compose

docker-dev
	-> /Applications/Docker.app/Contents/Resources/cli-plugins/docker-dev*
    b> docker-desktop

docker-extension
	-> /Applications/Docker.app/Contents/Resources/cli-plugins/docker-extension*
    b> docker-desktop

docker-sbom
	-> /Applications/Docker.app/Contents/Resources/cli-plugins/docker-sbom*
    b> docker-desktop

docker-scan
	-> /Applications/Docker.app/Contents/Resources/cli-plugins/docker-scan*
    b> docker-desktop
```

All Relevant executables in `Docker.app/Contents/`:
```
Library/LaunchServices/com.docker.vmnetd
Library/LoginItems/DockerHelper.app/Contents/MacOS/DockerHelper
MacOS/com.docker.admin
MacOS/com.docker.backend
MacOS/com.docker.dev-envs
MacOS/com.docker.diagnose
MacOS/com.docker.driver.amd64-linux
MacOS/com.docker.extensions
MacOS/com.docker.osxfs
MacOS/com.docker.socket
MacOS/com.docker.url-handler
MacOS/com.docker.virtualization
MacOS/Docker
MacOS/Docker Desktop.app/Contents/MacOS/Docker Desktop
MacOS/install
MacOS/qcow-tool
MacOS/qemu-system-aarch64
MacOS/uninstall
MacOS/vpnkit-bridge
Resources/bin/com.docker.cli
Resources/bin/com.docker.vpnkit
Resources/bin/docker
Resources/bin/docker-compose
Resources/bin/docker-compose-v1/docker-compose
Resources/bin/docker-compose-v1/Python
Resources/bin/docker-credential-desktop
Resources/bin/docker-credential-ecr-login
Resources/bin/docker-credential-osxkeychain
Resources/bin/docker-index
Resources/bin/hub-tool
Resources/bin/kubectl
Resources/cli-plugins/docker-buildx
Resources/cli-plugins/docker-compose
Resources/cli-plugins/docker-dev
Resources/cli-plugins/docker-extension
Resources/cli-plugins/docker-sbom
Resources/cli-plugins/docker-scan
Resources/etc/docker-compose.bash-completion
Resources/etc/docker.bash-completion
Resources/snyk/docker/bin/snyk
Resources/snyk/docker/node-release/bin/corepack
Resources/snyk/docker/node-release/bin/node
Resources/snyk/docker/node-release/bin/npm
Resources/snyk/docker/node-release/bin/npx
Resources/snyk/docker/snyk-mac.sh
```

# Successful install

```shell
$ brew install --verbose docker-desktop
==> Downloading https://desktop.docker.com/mac/main/arm64/95567/Docker.dmg
Already downloaded: /Users/lmg/Library/Caches/Homebrew/downloads/5beda2600c604e3e8dad39b2bc6153b927b9fe0dff84b08978da901841cc76d7--Docker.dmg
==> Verifying checksum for cask 'docker-desktop'
==> Installing Cask docker-desktop
hdiutil attach -plist -nobrowse -readonly -mountrandom /private/tmp/d20230124-67060-e4vqjb /Users/lmg/Library/Caches/Homebrew/downloads/5beda2600c604e3e8dad39b2bc6153b927b9fe0dff84b08978da901841cc76d7--Docker.dmg
mkbom -s -i /private/tmp/20230124-67060-gq47vr.list -- /private/tmp/20230124-67060-1ejjl3t.bom
ditto --bom /private/tmp/20230124-67060-1ejjl3t.bom -- /private/tmp/d20230124-67060-e4vqjb/dmg.uXOujg /private/tmp/d20230124-67060-pn3jkz
diskutil info -plist /private/tmp/d20230124-67060-e4vqjb/dmg.uXOujg
diskutil eject /private/tmp/d20230124-67060-e4vqjb/dmg.uXOujg
cp -pR /private/tmp/d20230124-67060-pn3jkz/Docker.app/. /opt/homebrew/Caskroom/docker-desktop/4.16.1,95567/Docker.app
chmod -Rf +w /private/tmp/d20230124-67060-pn3jkz
==> Moving App 'Docker.app' to '/Applications/Docker.app'
==> Linking Binary 'docker-compose' to '/opt/homebrew/bin/docker-compose'
==> Linking Binary 'docker-compose' to '/opt/homebrew/bin/docker-compose-v1'
==> Linking Binary 'docker.bash-completion' to '/opt/homebrew/etc/bash_completion.d/docker'
==> Linking Binary 'docker-compose.bash-completion' to '/opt/homebrew/etc/bash_completion.d/docker-compose'
==> Linking Binary 'docker-compose.zsh-completion' to '/opt/homebrew/share/zsh/site-functions/_docker_compose'
==> Linking Binary 'docker.fish-completion' to '/opt/homebrew/share/fish/vendor_completions.d/docker.fish'
==> Linking Binary 'docker-compose.fish-completion' to '/opt/homebrew/share/fish/vendor_completions.d/docker-compose.fish'
==> Linking Binary 'docker.zsh-completion' to '/opt/homebrew/share/zsh/site-functions/_docker'
==> Linking Binary 'docker' to '/opt/homebrew/bin/docker'
/usr/bin/sudo -E -- /Applications/Docker.app/Contents/MacOS/install --accept-license --user=lmg
🍺  docker-desktop was successfully installed!
```