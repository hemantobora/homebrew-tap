class ApiProbe < Formula
  desc "Configure AI skills for api-probe in your project"
  homepage "https://github.com/hemantobora/api-probe"
  version "0.1.1"
  license "MIT"

  url "https://github.com/hemantobora/api-probe/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "8314fbc697f4f83efb5e445886c312bda72f20e72353b2bc67ee7b893443707d"

  depends_on "python3"

  def install
    libexec.install "skills"

    (bin/"api-probe").write <<~SH
      #!/bin/sh
      case "$1" in
        init)
          exec python3 "#{libexec}/skills/install.py" init
          ;;
        update)
          exec python3 "#{libexec}/skills/install.py" update
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
          echo "  update      Re-sync installed skills with this version"
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
