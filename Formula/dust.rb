class Dust < Formula
  desc "An open-source, DB-backed, reactive map for when you want to share something reliably between applications"
  homepage "https://dustlayer.io"
  url "https://github.com/xlabs-hq/dust/archive/refs/tags/cli-v0.2.0.tar.gz"
  sha256 "dca087f920a688b33e29320a5f642edd4820ac76393fd1b6e4b5ad1f2ca08f3d"
  license "MIT"
  version "0.2.0"

  depends_on "crystal" => :build

  def install
    cd "cli" do
      system "shards", "build", "--release", "--no-debug", "--production"
      bin.install "bin/dust"
    end
  end

  test do
    assert_predicate bin/"dust", :exist?
  end
end
