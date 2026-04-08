class ApiProbe < Formula
  desc "Configure AI skills for api-probe in your project"
  homepage "https://github.com/hemantobora/api-probe"
  version "0.0.2"
  license "MIT"

  url "https://github.com/hemantobora/api-probe/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "f0a8337a451a3c268c85431c8f1b58742f0a613cfb3fbff128701b56c6956874"

  depends_on "python3"

  def install
    libexec.install "skills"

    (bin/"api-probe").write <<~SH
      #!/bin/sh
      case "$1" in
        init)
          exec python3 "#{libexec}/skills/install.py" init
          ;;
        destroy)
          exec python3 "#{libexec}/skills/install.py" destroy
          ;;
        -v|--version)
          echo "api-probe #{version}"
          ;;
        *)
          echo "Usage: api-probe <command>"
          echo ""
          echo "Commands:"
          echo "  init        Install AI skills for this project"
          echo "  destroy     Remove AI skills installed by init"
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
