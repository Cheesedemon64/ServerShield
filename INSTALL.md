# ServerShield Installation & Usage Guide

```
# ================================================
# ServerShield Security Suite
# Copyright (c) 2025 Cheesedemon64
# Licensed under Cheesedemon64 Anti-Corporate License v1.0
# 
# 🆓 Community use: FREE
# 💰 Corporate use: Commercial license required
# 🚫 Nintendo: BANNED (they're jerks)
# 
# Contact: OTYTbuisness@outlook.com
# GitHub: https://github.com/Cheesedemon64/ServerShield
# 
# This software is protected by copyright law.
# Unauthorized corporate use will result in legal action.
# 
# "Corporate security for EVERYONE - except corporate jerks!"
# ================================================
```

## 🛡️ Quick Start

### Windows Users (The Master Race)
1. Download `servershield.bat` for desktop security
2. Download `port-a-shield.bat` for laptop security
3. Set your password hashes (see below)
4. Run the script
5. Enjoy enterprise-grade security!

### Linux Users (Poor Souls)
1. Download `penguin-shield.sh` 
2. Make it executable: `chmod +x penguin-shield.sh`
3. Set your password hashes (see below)
4. Run: `./penguin-shield.sh`
5. Suffer through the terminal experience

## 🔐 Password Configuration

### Step 1: Generate Your Password Hashes

**Windows:**
```cmd
echo hello | certutil -hashfile - SHA256
```

**Linux:**
```bash
echo -n "hello" | sha256sum
```

### Step 2: Update Configuration

Open your `.bat` or `.sh` file and replace these lines:

```bash
# Replace these example hashes with YOUR hashes
CORRECT_PASSWORD_HASH="your_password_hash_here"
CORRECT_PASSKEY_HASH="your_passkey_hash_here"
```

**⚠️ SECURITY NOTE:** Use strong passwords! Don't use "hello" or "password123"

## 🌐 Server Configuration

### Alert Server Setup (Optional)

Update the server URL in your script:

**Windows:**
```cmd
set SERVER_URL=https://your-server.com/api/emergency-alert
```

**Linux:**
```bash
LINUX_SERVER_URL="https://your-server.com/api/penguin-alert"
```

If you don't have a server, the scripts will log locally (which is fine for most users).

## 📋 Features Overview

### 🐱 THE_BLACK_CAT Authentication
- Two-factor password + passkey verification
- SHA256 hash protection (no plaintext storage)
- SQL injection detection and taunting

### 🔥 TARTEUS Emergency Alert System
- Automatic security breach alerts
- Server notifications (if configured)
- Local incident logging

### 🔍 SINEVA File Detection
- Suspicious file scanning
- Delta Force reference
- Real-time threat monitoring

### 💻 Platform-Specific Features

**Windows (Superior):**
- Desktop and laptop variants
- Battery monitoring (laptops)
- WiFi security checking
- USB device monitoring
- System lockdown on failure

**Linux (Functional):**
- Distribution detection and teasing
- SSH connection monitoring
- Root user detection
- Terminal-based interface
- Multiple screen lock options

## 🚀 Usage Examples

### Basic Authentication
```cmd
# Windows
servershield.bat

# Linux  
./penguin-shield.sh
```

### File Scanning Only
```bash
# Linux only
./penguin-shield.sh --scan
```

### Help
```bash
# Linux only
./penguin-shield.sh --help
```

## 🛠️ Troubleshooting

### Common Issues

**"certutil is not recognized" (Windows)**
- You're probably on Windows XP or older
- Upgrade to a real version of Windows

**"sha256sum not found" (Linux)**
- Install coreutils: `sudo apt install coreutils`
- Or use your distro's package manager

**"curl not found"**
- Windows: Install curl or disable server alerts
- Linux: `sudo apt install curl` (or equivalent)

**"Screen lock not available" (Linux)**
- Install a screen locker: `sudo apt install i3lock`
- Or use GNOME/KDE built-in lockers

### Hash Generation Issues

If your hashes don't match:
1. Make sure there are no extra spaces
2. Use the exact same commands shown above
3. Copy the hash WITHOUT the filename part
4. Linux users: use `echo -n` (no newline)

## 🔧 Advanced Configuration

### Custom Alert Messages

Edit the JSON alert templates in the scripts:

```json
{
  "event": "TWO_FACTOR_AUTH_FAILURE",
  "hostname": "YOUR_COMPUTER",
  "alert_level": "CRITICAL"
}
```

### Log File Locations

**Windows:**
- `security_incidents.log`
- `hacker_attempts.log`
- `mobile_security.log`

**Linux:**
- `/var/log/linux-shield.log`
- System logs via `logger`

## 📞 Support

### Community Support (FREE)
- GitHub Issues: https://github.cbazzersnibot@outom/Cheesedemon64/ServerShield/issues
- Email: OTYTbuisness@outlook.com
### Commercial Support (PAID)
- Priority support for licensed corporations
- Custom deployment assistance
- Enterprise integration help

## ⚖️ License Compliance

### Free Usage Requirements
- ✅ Keep copyright notices
- ✅ Credit Cheesedemon64
- ✅ Share improvements
- ✅ Don't sublicense to banned entities

### Prohibited Users
- 🚫 Nintendo (permanently banned)
- 🚫 McAfee, Norton, Symantec
- 🚫 Apple, Microsoft, Google
- 🚫 Any company >$10M revenue

**Big corps:** Pay up or get out! Contact OTYTbuisness@outlook.com

## 🎮 Special Notes

### Why Nintendo is Banned
Nintendo destroys fan projects, attacks emulation, sends frivolous DMCA takedowns, and shows general hostility toward the gaming community. They made their bed with anti-community behavior - now they can lie in it. 🖕🎮

### Why Linux Gets Roasted
Windows is simply superior. But we made a Linux version anyway because we're nice people. You're welcome, penguin users. 🐧

---

**"Corporate security for EVERYONE - except the corporate jerks!"** 🧀⚖️

*Created by Cheesedemon64 with ❤️ for the community (and shade for corporations)*
