class Dust < Formula
  desc "An open-source, DB-backed, reactive map for when you want to share something reliably between applications"
  homepage "https://dustlayer.io"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xlabs-hq/dust/releases/download/cli-v0.2.0/dust-cli-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "093129e392600770c53e238eabb597e6689ed965e920a31f147f63e3b15aa537"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xlabs-hq/dust/releases/download/cli-v0.2.0/dust-cli-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dff69ca6b79b7b45367e0967530f65a096377caedc6861e80c6b6a196d6fb3eb"
    end

    on_intel do
      url "https://github.com/xlabs-hq/dust/releases/download/cli-v0.2.0/dust-cli-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "269bb7b4837801591d6ff58fb6c5c057b060fb90861a84ab9db4d2894f4bb3a2"
    end
  end

  def install
    binary = buildpath.glob("**/dust").reject(&:directory?).first
    raise "binary `dust` not found in extracted release asset" if binary.nil?
    bin.install binary => "dust"
  end

  test do
    assert_predicate bin/"dust", :exist?
  end
end
