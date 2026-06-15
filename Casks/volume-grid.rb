cask "volume-grid" do
  version "1.2.3"
  sha256 "03372060fe9bc423c3e4fb361c18295ac97f71f7278f0ff8fb24779880d155b0"

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
