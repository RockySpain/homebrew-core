class Xonsh < Formula
  include Language::Python::Virtualenv

  desc "Python-powered, cross-platform, Unix-gazing shell language and command prompt"
  homepage "https://xon.sh/"
  url "https://files.pythonhosted.org/packages/33/f7/56ce182e31011161bcd5362f4dc73192f7f1b0f622b930e05ebce1da9915/xonsh-0.18.1.tar.gz"
  sha256 "b3063ae7606c7b7177a0135e0850fb1dca6ed234401401aa22dc10529b2d2cb8"
  license "BSD-2-Clause-Views"
  head "https://github.com/xonsh/xonsh.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "6d695b8f834f5189b2bb016c68bfc0bcb212cd5c3d647d4c84e48a4354df4b14"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "617177a4c5c56377fbec63088810af636e8779fdc078af5da43eb769aed99dec"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "6e148d0f672e11ec4fc2e5c5167098cafb61e8a8500780c68d37ea1f0474306d"
    sha256 cellar: :any_skip_relocation, sonoma:         "96048294481fee5fb8cdde2bec5f21647e1217986f3f9161c06af8a8f0592773"
    sha256 cellar: :any_skip_relocation, ventura:        "8268e85d6c1dae21bae6d29836d6ae6d3575ba2bef532bef74bd63645c5d75bf"
    sha256 cellar: :any_skip_relocation, monterey:       "abdd8649a2bab224ab00e232de6cf3dc936d81fa9e7fe50c9146caf153623d84"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "5ed28db2b877dee67901f2201f8ae9cc26fe9c188936b47a83c8eae2dd3d8678"
  end

  depends_on "python@3.12"

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/47/6d/0279b119dafc74c1220420028d490c4399b790fc1256998666e3a341879f/prompt_toolkit-3.0.47.tar.gz"
    sha256 "1e1b29cb58080b1e69f207c893a1a7bf16d127a5c30c9d17a25a5d77792e5360"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/8e/62/8336eff65bcbc8e4cb5d05b55faf041285951b6e80f33e2bff2024788f31/pygments-2.18.0.tar.gz"
    sha256 "786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199"
  end

  resource "pyperclip" do
    url "https://files.pythonhosted.org/packages/30/23/2f0a3efc4d6a32f3b63cdff36cd398d9701d26cda58e3ab97ac79fb5e60d/pyperclip-1.9.0.tar.gz"
    sha256 "b7de0142ddc81bfc5c7507eea19da920b92252b548b96186caf94a5e2527d310"
  end

  resource "setproctitle" do
    url "https://files.pythonhosted.org/packages/ff/e1/b16b16a1aa12174349d15b73fd4b87e641a8ae3fb1163e80938dbbf6ae98/setproctitle-1.3.3.tar.gz"
    sha256 "c913e151e7ea01567837ff037a23ca8740192880198b7fbb90b16d181607caae"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/6c/63/53559446a878410fc5a5974feb13d31d78d752eb18aeba59c7fef1af7598/wcwidth-0.2.13.tar.gz"
    sha256 "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "4", shell_output("#{bin}/xonsh -c 2+2")
  end
end
