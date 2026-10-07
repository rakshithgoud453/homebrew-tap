class Myvault < Formula
  desc "Local-first, CLI-first secret manager for developers"
  homepage "https://github.com/rakshithgoud453/myvault"
  url "https://github.com/rakshithgoud453/myvault/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "sha256:9b6a7f9db9858b9a0ea2c8dbb9a0aedc4c2cc76e775dd2adc9e40ff6d47a891d"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X github.com/rakshithgoud453/myvault/internal/cli.Version=#{version} -w -s", "-o", bin/"myvault", "./cmd/myvault"
  end

  test do
    assert_match "myvault version", shell_output("#{bin}/myvault version")
  end
end
