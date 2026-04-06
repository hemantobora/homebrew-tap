class ApiProbe < Formula
  desc "Configure AI skills for api-probe in your project"
  homepage "https://github.com/hemantobora/api-probe"
  version "0.0.1"
  license "MIT"

  url "https://github.com/hemantobora/api-probe/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "5f83d30dcad35949c2c3c95d6e1a6950cb5b2710280b0b8a92d738dcfb2bbdac"

  depends_on "python3"

  def install
    libexec.install "skills"

    (bin/"api-probe").write <<~SH
      #!/bin/sh
      if [ "$1" = "init" ]; then
        exec python3 "#{libexec}/skills/install.py"
      else
        echo "Usage: api-probe init"
        echo "  Configures AI skills (GitHub Copilot, Claude Code) for api-probe in your project."
        exit 1
      fi
    SH
  end

  test do
    assert_predicate bin/"api-probe", :executable?
  end
end