#Ceator: https://github.com/olleja-b/
#!/bin/bash

# Automatically detect the logged-in user
CURRENT_USER=$(stat -f "%Su" /dev/console)
USER_HOME="/Users/$CURRENT_USER"

echo "========================================================="
echo "SwitchResX Complete Removal Script for macOS"
echo "Logged-in user: $CURRENT_USER"
echo "========================================================="
read -p "Are you sure you want to proceed with full removal? (y/N): " confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
  echo "Aborted by user."
  exit 1
fi

echo "➡ Starting cleanup..."

# Define paths to remove (wildcards allowed)
TARGETS=(
  "/Library/Preferences/.fr.madrau.switchresx.daemon.plist"
  "/Library/ColorSync/Profiles/SwitchResX.icc"
  "/System/Volumes/Data/Library/Preferences/.fr.madrau.switchresx.daemon.plist"
  "/System/Volumes/Data/private/var/folders/*/*/C/fr.madrau.switchresx.*"
  "$USER_HOME/Library/Saved Application State/fr.madrau.switchresx.app.savedState"
  "$USER_HOME/Library/WebKit/fr.madrau.switchresx.*"
  "$USER_HOME/Library/Preferences/fr.madrau.switchresx.*"
  "$USER_HOME/Library/HTTPStorages/fr.madrau.switchresx.*"
  "$USER_HOME/Library/Caches/fr.madrau.switchresx.*"
  "$USER_HOME/Documents/github/*/switchresX.sh"
  "$USER_HOME/Downloads/SwitchResX*"
)

# Delete targets
for path in "${TARGETS[@]}"; do
  sudo rm -rf $path 2>/dev/null
done

# Refresh system preference cache
sudo killall -HUP cfprefsd

echo "✅ File deletion complete."

# Post-cleanup check
echo "🔍 Verifying that all SwitchResX files are removed..."

LEFTOVERS=$(sudo find / -iname "*switchresx*" 2>/dev/null)

if [[ -z "$LEFTOVERS" ]]; then
  echo "✅ No remaining SwitchResX files found."
else
  echo "⚠️ Some SwitchResX-related files may still exist:"
  echo "$LEFTOVERS"
  echo "You may review and delete them manually if necessary."
fi

# Optional reboot prompt
read -p "Would you like to reboot now to complete the cleanup? (y/N): " reboot_now

if [[ "$reboot_now" == "y" || "$reboot_now" == "Y" ]]; then
  echo "🔄 Rebooting..."
  sudo reboot
else
  echo "⚠️ Please reboot your Mac manually to ensure all changes take effect."
fi
