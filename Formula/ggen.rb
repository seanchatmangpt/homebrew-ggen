class Ggen < Formula
  desc "Deterministic, language-agnostic code generation framework"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.5.19"
  license "MIT"
  head "https://github.com/seanchatmangpt/ggen.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.5.19/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "963749ce6562f85c3f10f0208d6b3096de3b64420384df18bbd4157a3ef719fd"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.5.19/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "b195751be3bc5845b2b9fed6ec7a8cb0d553e879cba4ba3565ec86fc39b26009"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.5.19/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a136f845777f79058c09912a0ce0007ab3fb563c353639d7077ad73d73bcb94e"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.5.19/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8110d5b384a99524e51bd606088789efd8fb6c52124d1d82a9e4f2a0043f30be"
    end
  end

  def install
    bin.install "ggen"
  end

  test do
    # Test basic functionality
    assert_match "ggen 26.5.19", shell_output("#{bin}/ggen --version")
  end
end
