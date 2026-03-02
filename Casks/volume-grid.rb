cask "volume-grid" do
  version "1.2.0"
  sha256 "e60fd396b7fb6e88979d7716cb88dfaae74fcb6071beed7eb25d9cf731f66fe4"

  url "https://github.com/euxx/volume-grid/releases/download/v#{version}/VolumeGrid-v#{version}.dmg"
  name "Volume Grid"
  desc "Bringing back the classic volume HUD for macOS Tahoe 26 with more."
  homepage "https://github.com/euxx/volume-grid"

  auto_updates false
  depends_on macos: ">= :sonoma"

  app "Volume Grid.app"

  postflight do
    system "xattr -d com.apple.quarantine #{appdir}/Volume\\ Grid.app"
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
