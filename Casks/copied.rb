cask "copied" do
  version "0.1.0"
  sha256 "816a8c774f4c15f2d5d8f191614873a52b2deaa8f12f9a1dd1160398de17755e"

  url "https://github.com/euxx/copied/releases/download/v#{version}/Copied-v#{version}.dmg"
  name "Copied"
  desc "Shows visual feedback when the clipboard changes"
  homepage "https://github.com/euxx/copied"

  auto_updates false
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Copied.app"

  postflight do
    system "xattr", "-dr", "com.apple.quarantine", "#{appdir}/Copied.app"
  end

  uninstall quit: "one.eux.copied"

  zap trash: [
    "~/Library/Caches/one.eux.copied",
    "~/Library/Preferences/one.eux.copied.plist",
    "~/Library/Saved Application State/one.eux.copied.savedState",
  ]
end
