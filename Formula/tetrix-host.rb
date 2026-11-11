# Written by scripts/formula.sh in the tetrix-host repository. Do not edit.
class TetrixHost < Formula
  desc "Run the models behind your Tetrix apps on a machine you own"
  homepage "https://github.com/Tetrix-Technologies/tetrix-host"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/Tetrix-Technologies/tetrix-host/releases/download/v0.1.0/tetrix-host_darwin_arm64.tar.gz"
      sha256 "dcaa0aa97864e325a9ea05f5e619d465d22a5d538806d9b192d8cd371e1ae43f"
    end
    on_intel do
      url "https://github.com/Tetrix-Technologies/tetrix-host/releases/download/v0.1.0/tetrix-host_darwin_amd64.tar.gz"
      sha256 "6e73696763653099244aafdef1afbd6b8339188d9d0696e4055af0abfc0ee698"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tetrix-Technologies/tetrix-host/releases/download/v0.1.0/tetrix-host_linux_arm64.tar.gz"
      sha256 "84962f59bcd499f27beb3d3f7a24b160066529adfdf8dde323b94dbfc9ef660d"
    end
    on_intel do
      url "https://github.com/Tetrix-Technologies/tetrix-host/releases/download/v0.1.0/tetrix-host_linux_amd64.tar.gz"
      sha256 "127f7a05cc48b96fd1b5d866785b587ff25ee5617dc5205f86443f47314e2b9d"
    end
  end

  def install
    bin.install "tetrix-host"
  end

  def caveats
    <<~EOS
      To run the host in the background, from login:
        tetrix-host service install

      After an upgrade, run that command again to restart the host on the
      new version.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tetrix-host version")
  end
end
