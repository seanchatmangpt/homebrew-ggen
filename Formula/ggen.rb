class Ggen < Formula
  desc "Deterministic, language-agnostic code generation framework"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "5.0.0"
  license "MIT"
  head "https://github.com/seanchatmangpt/ggen.git", branch: "master"

  on_macos do
    on_arm do
      url "https://github.com/seanchatmangpt/ggen/releases/download/v5.0.0/ggen-5.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "ce20eb8bf8bd9a95a37f8a5458a44e2fde30b9a9398e114d173cbf5d22768e19"
    end

    on_intel do
      # Fallback to source build for x86_64
      url "https://github.com/seanchatmangpt/ggen/archive/refs/tags/v5.0.0.tar.gz"
      sha256 "b950e2e816918e0c92c6d7aad9dcf12c14a34031074bd2a450b64a609426d397"
    end
  end

  # Linux fallback to source build
  on_linux do
    url "https://github.com/seanchatmangpt/ggen/archive/refs/tags/v5.0.0.tar.gz"
    sha256 "b950e2e816918e0c92c6d7aad9dcf12c14a34031074bd2a450b64a609426d397"
  end

  depends_on "rust" => :build if build.head? || !Hardware::CPU.arm?

  def install
    if Hardware::CPU.arm? && !build.head?
      # Binary install for arm64 macOS
      bin.install "ggen"
    else
      # Source build for other platforms or HEAD
      system "cargo", "install", *std_cargo_args(path: "crates/ggen-cli")
    end
  end

  test do
    # Test basic functionality
    assert_match "ggen", shell_output("#{bin}/ggen --version")
  end
end
