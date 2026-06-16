class ApiProbe < Formula
  desc "Configure AI skills for api-probe in your project"
  homepage "https://github.com/hemantobora/api-probe"
  version "0.1.0"
  license "MIT"

  url "https://github.com/hemantobora/api-probe/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3eb3c9d10881e5c173eb5eade1251d2ffa931f4da95e9b82a25427464044c98d"

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
