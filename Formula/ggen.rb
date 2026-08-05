class Ggen < Formula
  desc "Deterministic, language-agnostic code generation framework"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.8.6"
  license "MIT"
  head "https://github.com/seanchatmangpt/ggen.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.8.6/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "90f536673fe2f3d94af2ffea4789bc06d7a45fce1f4cd43a602c911098b3bb92"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.8.6/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "fcc2dbfdd8a1cd675383513955a5be2f2ab9cee7f315fd715b7a88481f9745d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.8.6/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "080b93c75802f34a608d99a3f0a7c44299476f35411b9564e5515d45de29b6b5"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.8.6/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a8e957858423ae88e50278442c8c6bf5d44d24f8061774a911185cfe74ee469"
    end
  end

  def install
    bin.install "ggen"
  end

  test do
    assert_match "ggen 26.8.6", shell_output("#{bin}/ggen --version")
  end
end
