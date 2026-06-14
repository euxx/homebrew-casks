cask "volume-grid" do
  version "1.2.2"
  sha256 "c5203dacdddd6dc584308e78d9a3297bb931e8a82875af8e019da8eafdbd5bf3"

  url "https://github.com/euxx/volume-grid/releases/download/v#{version}/VolumeGrid-v#{version}.dmg"
  name "Volume Grid"
  desc "Bringing back the classic volume HUD with more"
  homepage "https://github.com/euxx/volume-grid"

  auto_updates false
  depends_on macos: :tahoe

  app "Volume Grid.app"

  postflight do
    system "xattr -d com.apple.quarantine #{appdir}/Volume\\ Grid.app"
  end

  uninstall quit: "one.eux.volumegrid"

  zap trash: [
    "~/Library/Application Support/VolumeGrid",
    "~/Library/Caches/one.eux.volumegrid",
    "~/Library/Logs/VolumeGrid",
    "~/Library/Preferences/one.eux.volumegrid.plist",
    "~/Library/Saved Application State/one.eux.volumegrid.savedState",
  ]
end
