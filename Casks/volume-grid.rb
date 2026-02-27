cask "volume-grid" do
  version "1.1.1"
  sha256 "a354fd849ec217761fee2bbce26ca135eed1274b8b117ae3e10d3ee633b792ca"

  url "https://github.com/euxx/volume-grid/releases/download/v#{version}/VolumeGrid-v#{version}.dmg"
  name "Volume Grid"
  desc "Bringing back the classic volume HUD for macOS Tahoe 26 with more."
  homepage "https://github.com/euxx/volume-grid"

  auto_updates true
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
