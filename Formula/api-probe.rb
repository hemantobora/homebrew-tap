class ApiProbe < Formula
  desc "Configure AI skills for api-probe in your project"
  homepage "https://github.com/hemantobora/api-probe"
  version "0.0.3"
  license "MIT"

  url "https://github.com/hemantobora/api-probe/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "91411507fa8613c0ac64ab0b451f73526d74ea7b9b413793c94b2d07907322de"

  depends_on "python3"

  def install
    libexec.install "skills"

    (bin/"api-probe").write <<~SH
      #!/bin/sh
      case "$1" in
        init)
          exec python3 "#{libexec}/skills/install.py"
          ;;
        -v|--version)
          echo "api-probe #{version}"
          ;;
        *)
          echo "Usage: api-probe <command>"
          echo ""
          echo "Commands:"
          echo "  init        Configure AI skills for this project"
          echo ""
          echo "Options:"
          echo "  -v, --version   Print version"
          exit 1
          ;;
      esac
    SH
  end

  test do
    assert_predicate bin/"api-probe", :executable?
  end
end
