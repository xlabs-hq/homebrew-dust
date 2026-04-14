class Dust < Formula
  desc "An open-source, DB-backed, reactive map for when you want to share something reliably between applications"
  homepage "https://dustlayer.io"
  url "https://github.com/xlabs-hq/dust/archive/refs/tags/cli-v0.2.0.tar.gz"
  sha256 "ffec9edb021f866e799b0a992a767a4036a1b0820cf08be9a0871466465158aa"
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
