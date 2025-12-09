cask "volume-grid" do
  version "1.0.0"
  sha256 "2fc64b61ec963fcd233520159aae70bddec5bc431e2ad6553dac83f17f6c08c0"

  url "https://github.com/euxx/volume-grid/releases/download/v#{version}/VolumeGrid-v#{version}.dmg"
  name "Volume Grid"
  desc "Bringing back the classic volume HUD for macOS Tahoe 26 with more."
  homepage "https://github.com/euxx/volume-grid"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Volume Grid.app"

  caveats do
    <<~EOS
      To remove the quarantine attribute after installation, run:
        xattr -rd com.apple.quarantine /Applications/Volume\\ Grid.app
    EOS
  end

  uninstall quit: "one.eux.volumegrid"

  zap trash: [
    "~/Library/Preferences/one.eux.volumegrid.plist",
    "~/Library/Application Support/VolumeGrid",
    "~/Library/Caches/one.eux.volumegrid",
    "~/Library/Logs/VolumeGrid",
    "~/Library/Saved Application State/one.eux.volumegrid.savedState",
  ]
end
