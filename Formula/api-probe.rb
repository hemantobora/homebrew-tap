class ApiProbe < Formula
  desc "Configure AI skills for api-probe in your project"
  homepage "https://github.com/hemantobora/api-probe"
  version "0.0.5"
  license "MIT"

  url "https://github.com/hemantobora/api-probe/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "b67d9cfb7f98353236c78fb6e3c84693cfbb000ee8f67da84b394e4ce0683624"

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
