class ApiProbe < Formula
  desc "Configure AI skills for api-probe in your project"
  homepage "https://github.com/hemantobora/api-probe"
  version "0.0.1"
  license "MIT"

  url "https://github.com/hemantobora/api-probe/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "5d6244cda652f007a6eaa7cd425ec5a40d68f4428c70f563e0901d28e2dce0ed"

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