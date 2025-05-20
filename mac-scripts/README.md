# 🧹 Completely Removing SwitchResX from macOS

**SwitchResX** is a powerful utility for managing custom display resolutions on macOS. However, simply deleting the application does not completely remove its system-level configurations and background services.

I initially installed SwitchResX to resolve a display issue with a 5220x1440 monitor (which turned out to be cable-related). After uninstalling the app, SwitchResX settings continued to appear when reconnecting the monitor — indicating leftover configurations.

This script was created to automate the full removal of SwitchResX components.

---

## 🚀 Quick Start

### 1. Download the Script

Save the file `remove_switchresx.sh` to your Mac (e.g., Desktop).

### 2. Run the Cleanup Script

Open **Terminal**, navigate to the download location, and execute:

```bash
cd ~/Desktop   # or path where you saved the script
chmod +x remove_switchresx.sh
./remove_switchresx.sh

⚠️ You may be prompted for your administrator password to remove protected system files.

## 🧾 What the Script Removes

Launch agents and daemons

System and user preferences

Cached and saved application states

Files located in the following paths:

/Library/Preferences/

/Library/LaunchAgents/

/private/var/folders/...

~/Library/Preferences/

~/Library/Saved Application State/

~/Library/WebKit/

## ✅ Tested On

macOS Catalina

macOS Big Sur

macOS Monterey

macOS Ventura

macOS Sequoia (Version 15.5)

## 📌 Disclaimer

This script is provided as-is. It has been tested on several macOS versions, but future OS updates or changes to SwitchResX installation paths may require modifications.

Use at your own discretion.

## 🤝 Contributions

If you have suggestions, fixes, or additional compatibility notes, feel free to open a pull request or submit an issue.


