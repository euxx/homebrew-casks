cask "volume-grid" do
  version "1.0.0"
  sha256 "6b1a906577c9fe4e3fec9b6a3d9f8ef16a9622acfeeb884d33f8eec2d27afb78"

  url "https://github.com/euxx/volume-grid/releases/download/v#{version}/VolumeGrid-v#{version}.dmg"
  name "Volume Grid"
  desc "Bringing back the classic volume HUD for macOS Tahoe 26 with more."
  homepage "https://github.com/euxx/volume-grid"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Volume Grid.app"

  uninstall quit: "one.eux.volumegrid"

  zap trash: [
    "~/Library/Preferences/one.eux.volumegrid.plist",
    "~/Library/Application Support/VolumeGrid",
    "~/Library/Caches/one.eux.volumegrid",
    "~/Library/Logs/VolumeGrid",
    "~/Library/Saved Application State/one.eux.volumegrid.savedState",
  ]
end
