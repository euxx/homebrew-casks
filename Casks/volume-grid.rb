cask "volume-grid" do
  version "1.2.4"
  sha256 "fc34168d161a2a9c898738e168bb30f528643585b034a74ac06acac5a0bde54b"

  url "https://github.com/euxx/volume-grid/releases/download/v#{version}/VolumeGrid-v#{version}.dmg"
  name "Volume Grid"
  desc "Bringing back the classic volume HUD with more"
  homepage "https://github.com/euxx/volume-grid"

  auto_updates false
  depends_on macos: :tahoe

  app "Volume Grid.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Volume Grid.app"]
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
