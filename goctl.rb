class Goctl < Formula
  desc "goctl can be read as go control. goctl means not to be controlled by code, instead, we control it"
  homepage "https://go-zero.dev"
  url "https://github.com/zeromicro/go-zero/archive/refs/tags/tools/goctl/v1.3.5.tar.gz"
  sha256 "cbb131ba03fd26e4871ce9543cf8aa64fa1547d6db5c10390f512e72d095a722"
  license "MIT"

  depends_on "go" => :build

  def install
    chdir "tools/goctl" do
      system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"goctl"), "goctl.go"
    end
  end

  test do
    assert_match "goctl version #{version}", shell_output("#{bin}/goctl --version")
  end
end
