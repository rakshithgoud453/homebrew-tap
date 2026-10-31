class Converze < Formula
  desc "Anonymous voice practice terminal client for Converze Club (powered by TermCall)"
  homepage "https://converze.org"
  url "https://github.com/rakshithgoud453/converze-matchmaker/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"
  head "https://github.com/rakshithgoud453/converze-matchmaker.git", branch: "master"

  depends_on "go" => :build
  depends_on "pkg-config" => :build
  depends_on "opus"
  depends_on "opusfile"

  def install
    system "go", "build", "-trimpath",
           "-ldflags", "-s -w -X main.Version=#{version} -X main.DefaultServer=wss://match.converze.org/ws",
           "-o", bin/"converze", "./cmd/converze"
  end

  test do
    assert_match "converze version", shell_output("#{bin}/converze --version")
  end
end
