class DockerDocs < Formula
  desc "Man documentation for Docker CLI"
  homepage "https://www.docker.com/"
  url "https://github.com/docker/cli.git",
      tag:      "v20.10.23",
      revision: "715524332ff91d0f9ec5ab2ec95f051456ed1dba"
  license "Apache-2.0"
  head "https://github.com/docker/cli.git", branch: "master"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)(?:[._-]ce)?$/i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "9bcc4a84f15f5e4687ab3a71d56b16eb1df2dfbe60b95a01354dac453deee5f2"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "b090ad3e7ceb500d47d0976394052f3f1ffe0243eda761fb12f2cc6d01ddb18b"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "791ad699199a0f94d46ec95b63ae995ebba8746fbf86ce6f43a87d002390a4c7"
    sha256 cellar: :any_skip_relocation, ventura:        "e87bb5bef233971853bcc432b215dfbd9811f0fd62a35a35770a9a2ef173dc41"
    sha256 cellar: :any_skip_relocation, monterey:       "01d0a50fe3cdeb4228f755857a050d7574257a49f8a404b009d76311cef07230"
    sha256 cellar: :any_skip_relocation, big_sur:        "c4b177fef2af2337a16df09580e5bcec4d942873bacd2d151787a9e8c20b48f8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "67b771f3313c5beee27a69c476a62f6a37c75708f272c227f613c8c8e7d1d4f9"
  end

  depends_on "go" => :build
  depends_on "go-md2man" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "auto"
    dir = buildpath/"src/github.com/docker/cli"
    dir.install (buildpath/"").children
    cd dir do
      ldflags = ["-X \"github.com/docker/cli/cli/version.BuildTime=#{time.iso8601}\"",
                 "-X github.com/docker/cli/cli/version.GitCommit=#{Utils.git_short_head}",
                 "-X github.com/docker/cli/cli/version.Version=#{version}",
                 "-X \"github.com/docker/cli/cli/version.PlatformName=Docker Engine - Community\""]
      # system "go", "build", *std_go_args(ldflags: ldflags), "github.com/docker/cli/cmd/docker"

      Pathname.glob("man/*.[1-8].md") do |md|
        section = md.to_s[/\.(\d+)\.md\Z/, 1]
        (man/"man#{section}").mkpath
        system_command "go-md2man",
                        args: ["-in=#{md}", "-out=#{man/"man#{section}"/md.stem}"]
      end
    end
  end

  test do
    assert_match "Docker version #{version}", shell_output("#{bin}/docker --version")

    expected = if OS.mac?
      "ERROR: Cannot connect to the Docker daemon"
    else
      "ERROR: Got permission denied while trying to connect to the Docker daemon socket"
    end
    assert_match expected, shell_output("#{bin}/docker info", 1)
  end
end
