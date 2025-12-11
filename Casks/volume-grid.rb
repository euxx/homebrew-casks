cask "volume-grid" do
  version "1.1.0"
  sha256 "c573d612c48b40c67c70c3c346af47900c7115e24960bc9a89d03943af081331"

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
