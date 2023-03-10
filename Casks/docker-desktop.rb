cask "docker-desktop" do
    arch  arm: "arm64",
          intel: "amd64"

    version "4.16.1,95567"
    sha256  arm:   "327725664ac86d34ee3b311b09eace0075492f7ff3e0e384015171769f75bff4",
            intel: "b6d8720e2ceb64a6102c5efba53e2adf441c60508457aeb8cc1fd7c30cd7b28f"

    url "https://desktop.docker.com/mac/main/#{arch}/#{version.after_comma}/Docker.dmg"
    name "Docker Desktop"
    name "Docker Community Edition"
    name "Docker CE"
    desc "Build and share containerized applications and microservices"
    homepage "https://www.docker.com/products/docker-desktop"

    livecheck do
      url "https://desktop.docker.com/mac/main/#{arch}/appcast.xml"
      strategy :sparkle
    end

    auto_updates true
    conflicts_with formula: %w[
      docker
      docker-completion
      docker-compose
      docker-compose-completion
      docker-credential-helper-ecr
      hyperkit
      kubernetes-cli
    ]
    depends_on macos: ">= :catalina"

    app "Docker.app", target: "#{appdir}/Docker.app"
    binary  "Docker.app/Contents/Resources/bin/docker"
    binary  "Docker.app/Contents/Resources/bin/docker-compose"
    binary  "Docker.app/Contents/Resources/bin/docker-compose-v1/docker-compose",
            target: "#{HOMEBREW_PREFIX}/bin/docker-compose-v1"
    # binary  "Docker.app/Contents/Resources/bin/com.docker.cli"
    # binary  "Docker.app/Contents/Resources/bin/docker-buildx"
    # binary  "Docker.app/Contents/Resources/bin/docker-credential-desktop"
    # binary  "Docker.app/Contents/Resources/bin/docker-credential-ecr-login"
    # binary  "Docker.app/Contents/Resources/bin/docker-credential-osxkeychain"
    # binary  "Docker.app/Contents/Resources/bin/hub-tool"
    # binary  "Docker.app/Contents/Resources/bin/hyperkit"
    # binary  "Docker.app/Contents/Resources/bin/kubectl"
    # binary  "Docker.app/Contents/Resources/bin/kubectl",
    #         target: "#{HOMEBREW_PREFIX}/bin/kubectl.docker"
    # binary  "Docker.app/Contents/Resources/bin/vpnkit"

    # CLI Plugins
    binary  "Docker.app/Contents/Resources/cli-plugins/docker-buildx",
            target:  "~/.docker/cli-plugins/docker-buildx"
    binary  "Docker.app/Contents/Resources/cli-plugins/docker-compose",
            target:  "~/.docker/cli-plugins/docker-compose"
    binary  "Docker.app/Contents/Resources/cli-plugins/docker-dev",
            target:  "~/.docker/cli-plugins/docker-dev"
    binary  "Docker.app/Contents/Resources/cli-plugins/docker-extension",
            target:  "~/.docker/cli-plugins/docker-extension"
    binary  "Docker.app/Contents/Resources/cli-plugins/docker-sbom",
            target:  "~/.docker/cli-plugins/docker-sbom"
    binary  "Docker.app/Contents/Resources/cli-plugins/docker-scan",
            target:  "~/.docker/cli-plugins/docker-scan"

    # Completions
    binary  "Docker.app/Contents/Resources/etc/docker.bash-completion",
            target: "#{HOMEBREW_PREFIX}/etc/bash_completion.d/docker"
    binary  "Docker.app/Contents/Resources/etc/docker-compose.bash-completion",
            target: "#{HOMEBREW_PREFIX}/etc/bash_completion.d/docker-compose"
    binary  "Docker.app/Contents/Resources/etc/docker.zsh-completion",
            target: "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_docker"
    binary  "Docker.app/Contents/Resources/etc/docker-compose.zsh-completion",
            target: "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_docker_compose"
    binary  "Docker.app/Contents/Resources/etc/docker.fish-completion",
            target: "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/docker.fish"
    binary  "Docker.app/Contents/Resources/etc/docker-compose.fish-completion",
            target: "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/docker-compose.fish"

    postflight do
      system_command  "#{appdir}/Docker.app/Contents/MacOS/install",
                      args: ["--accept-license", "--user=#{ENV['USER']}"],
                      sudo: true,
                      verbose: true
    end

    uninstall delete: [
              "/Library/PrivilegedHelperTools/com.docker.vmnetd",
              "/usr/local/bin/com.docker.cli",
              "/usr/local/bin/docker-compose-v1",
              "/usr/local/bin/docker-compose",
              "/usr/local/bin/docker-credential-desktop",
              "/usr/local/bin/docker-credential-ecr-login",
              "/usr/local/bin/docker-credential-osxkeychain",
              "/usr/local/bin/docker",
              "/usr/local/bin/docker-index",
              "/usr/local/bin/hub-tool",
              "/usr/local/bin/hyperkit",
              "/usr/local/bin/kubectl",
              "/usr/local/bin/kubectl.docker",
              "/usr/local/bin/vpnkit",
              "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_docker",
              "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_docker_compose",
              "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/docker.fish",
              "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/docker-compose.fish",
              "#{HOMEBREW_PREFIX}/etc/bash_completion.d/docker",
              "#{HOMEBREW_PREFIX}/etc/bash_completion.d/docker-compose",
            ],
            launchctl: [
              "com.docker.helper",
              "com.docker.vmnetd",
            ],
            quit: "com.docker.docker"

    zap trash: [
          "/usr/local/bin/docker-compose.backup",
          "/usr/local/bin/docker.backup",
          "~/.docker",
          "~/Library/Application Scripts/com.docker.helper",
          "~/Library/Application Support/com.bugsnag.Bugsnag/com.docker.docker",
          "~/Library/Application Support/Docker Desktop",
          "~/Library/Caches/com.docker.docker",
          "~/Library/Caches/com.plausiblelabs.crashreporter.data/com.docker.docker",
          "~/Library/Caches/KSCrashReports/Docker",
          "~/Library/Containers/com.docker.docker",
          "~/Library/Containers/com.docker.helper",
          "~/Library/Group Containers/group.com.docker",
          "~/Library/HTTPStorages/com.docker.docker.binarycookies",
          "~/Library/Logs/Docker Desktop",
          "~/Library/Preferences/com.docker.docker.plist",
          "~/Library/Preferences/com.electron.docker-frontend.plist",
          "~/Library/Preferences/com.electron.dockerdesktop.plist",
          "~/Library/Saved Application State/com.electron.docker-frontend.savedState",
          "~/Library/Saved Application State/com.electron.dockerdesktop.savedState",
        ],
        rmdir: [
          "~/Library/Caches/com.plausiblelabs.crashreporter.data",
          "~/Library/Caches/KSCrashReports",
        ]
    caveats do
      files_in_usr_local true
    end
    caveats "You must run the Docker.app at least once to finish installation."
    caveats "Restart your terminal for completions to take effect."
end
