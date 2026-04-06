class ApiProbe < Formula
  desc "Configure AI skills for api-probe in your project"
  homepage "https://github.com/hemantobora/api-probe"
  version "0.0.1"
  license "MIT"

  url "https://github.com/hemantobora/api-probe/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "083dc9e00c9bb8537abddfdc92fc2e59189a88426edd3b9678db8c7d8eb27a30"

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