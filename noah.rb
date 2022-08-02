class Noah < Formula
  desc "Darwin subsystem for Linux (Bash on macOS)"
  homepage "https://github.com/linux-noah/noah"
  url "https://github.com/linux-noah/noah/archive/0.5.1.tar.gz"
  sha256 "452c00b1baeafca73e6566b552c9d63dc304504be95296f6568274cd74073660"
  head "https://github.com/linux-noah/noah.git"

  depends_on "noahstrap"
  depends_on "cmake" => :build

  depends_on :macos => :sierra # needs clock_gettime

  def install
    mkdir "bulid" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "#{bin}/noah", "--version"
    assert_match /Usage/, shell_output("#{bin}/noah --help", 1)
  end
end
