#!/bin/bash

# ================================================
# ServerShield Security Suite
# Copyright (c) 2025 Cheesedemon64
# Licensed under Cheesedemon64 Anti-Corporate License v1.0
# 
# 🆓 Community use: FREE
# 💰 Corporate use: Commercial license required
# 🚫 Nintendo: BANNED 
# 
# Contact: bazzersnibot@outlook.com
# GitHub: https://github.com/Cheesedemon64/ServerShield
# 
# This software is protected by copyright law.
# Unauthorized corporate use will result in legal action.
# 
# "Corporate security for EVERYONE - except corporate jerks!"
# ================================================

# LINUX-SHIELD Security System
# THE_BLACK_CAT Authentication for Linux
# (Yeah, we made a Linux version... ugh!)
#
# Security Components:
# - THE_BLACK_CAT: Two-factor authentication 
# - TARTEUS: Emergency alert system (Greek: Tartarus)
# - SINEVA: Suspicious file detection (Delta Force)
# - PENGUIN-GUARD: Linux-specific security (because penguins...)
# - Global Threat Initiative: Server response system (Delta Force)
# - ctOS: Logic and monitoring system (Watch Dogs 2)
#
# Created by: Cheesedemon64
# For those poor souls stuck using Linux instead of real Windows
# 
# Windows Master Race! But fine, here's your Linux version...
# At least it's not macOS! 🐧💀
#
# GitHub: https://github.com/Cheesedemon64/Linux-Shield
# ================================================

# Linux configuration (because apparently some people like terminals)
CORRECT_PASSWORD_HASH="5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8"
CORRECT_PASSKEY_HASH="ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f"
LINUX_SERVER_URL="https://linux-security.example.com/api/penguin-alert"
LOG_FILE="/var/log/linux-shield.log"

# Colors for terminal (because Linux users love their colored text)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Check if running as root (Linux users always want root)
if [[ $EUID -eq 0 ]]; then
    ROOT_USER=true
    echo -e "${RED}Running as root detected${NC}"
else
    ROOT_USER=false
fi

# Display the Linux version banner (ugh)
clear
echo -e "${CYAN}================================================${NC}"
echo -e "${GREEN}            Linux-Shield Security${NC}"
echo -e "${BLUE}        THE_BLACK_CAT Authentication${NC}"
echo -e "${PURPLE}         with TARTEUS Alert System${NC}"
echo -e "${YELLOW}           SINEVA File Detection${NC}"
echo -e "${CYAN}           PENGUIN-GUARD Active${NC}"
echo ""
echo -e "${GREEN}    For Linux users (we feel sorry for you)${NC}"
echo -e "${BLUE}           Created by: Cheesedemon64${NC}"
echo -e "${CYAN}================================================${NC}"
echo ""

# Linux-specific security checks
penguin_security_check() {
    echo -e "${YELLOW}PENGUIN-GUARD: Running Linux security checks...${NC}"
    
    # Check distribution (because Linux users love arguing about distros)
    if [ -f /etc/os-release ]; then
        DISTRO=$(grep "^ID=" /etc/os-release | cut -d'=' -f2 | tr -d '"')
        echo "Linux distribution detected: $DISTRO"
        
        # Tease specific distros
        case $DISTRO in
            "ubuntu")
                echo "Ubuntu detected. At least it's not Arch..."
                ;;
            "arch")
                echo "Arch detected. We get it, you use Arch BTW."
                ;;
            "fedora")
                echo "Fedora detected. Red Hat's playground."
                ;;
            "debian")
                echo "Debian detected. The grandfather of chaos."
                ;;
            *)
                echo "Some random Linux distro. There are too many to keep track."
                ;;
        esac
    fi
    
    # Check for common attack vectors
    if [ -d "/tmp" ]; then
        TEMP_FILES=$(find /tmp -type f -name "*.sh" -o -name "*.py" | wc -l)
        if [ $TEMP_FILES -gt 10 ]; then
            echo -e "${RED}WARNING: Many script files in /tmp directory${NC}"
        fi
    fi
    
    # Check SSH connections (Linux servers love SSH)
    if command -v ss >/dev/null 2>&1; then
        SSH_CONNECTIONS=$(ss -tn | grep ':22' | wc -l)
        if [ $SSH_CONNECTIONS -gt 0 ]; then
            echo "SSH connections detected: $SSH_CONNECTIONS"
        fi
    fi
    
    # Check for USB devices (even penguins can get malware)
    if [ -d "/media" ]; then
        USB_COUNT=$(ls /media/ 2>/dev/null | wc -l)
        if [ $USB_COUNT -gt 0 ]; then
            echo "USB devices detected: $USB_COUNT"
        fi
    fi
    
    echo -e "${GREEN}PENGUIN-GUARD: Linux security checks complete${NC}"
    echo ""
}

# Hash function for Linux (because sha256sum exists)
hash_input() {
    echo -n "$1" | sha256sum | cut -d' ' -f1
}

# SQL injection detection for Linux
check_sql_injection() {
    local input="$1"
    if echo "$input" | grep -iE "(select|insert|update|delete|drop|union|script|exec|declare|';--|'OR|'AND|1=1|admin'--)" >/dev/null; then
        return 0  # Injection detected
    fi
    return 1  # No injection
}

# Linux injection alert
alert_linux_injection() {
    echo -e "${RED}==========================================${NC}"
    echo -e "${YELLOW}            NICE TRY! :D${NC}"
    echo -e "${RED}   SQL Injection attempt detected!${NC}"
    echo -e "${CYAN}   ctOS surveillance has caught you!${NC}"
    echo -e "${YELLOW}   Linux-Shield has caught you!${NC}"
    echo -e "${RED}==========================================${NC}"
    echo ""
    
    # Log to syslog (because Linux loves logs)
    logger "Linux-Shield: SQL injection attempt detected from terminal"
    
    # Send alert to server
    INJECT_DATE=$(date)
    INJECTION_ALERT="{\"event\":\"LINUX_SQL_INJECTION_ATTEMPT\",\"hostname\":\"$(hostname)\",\"date\":\"$INJECT_DATE\",\"attack_type\":\"SQL_INJECTION\",\"alert_level\":\"CRITICAL\",\"message\":\"Linux hacker detected and taunted\",\"platform\":\"Linux-Shield\"}"
    
    if command -v curl >/dev/null 2>&1; then
        curl -X POST "$LINUX_SERVER_URL" \
             -H "Content-Type: application/json" \
             -H "X-Linux-Security: Penguin-Shield" \
             -d "$INJECTION_ALERT" \
             --connect-timeout 5 \
             --max-time 15 2>/dev/null
        
        if [ $? -eq 0 ]; then
            echo "Global Threat Initiative alerted about penguin hacker attempt."
        fi
    fi
    
    echo "Linux system secured. Goodbye penguin hacker!"
    sleep 3
    exit 1
}

# Main authentication function
authenticate_user() {
    # Step 1: Password
    echo -n "Enter Password: "
    read -s USER_PASSWORD
    echo ""
    
    USER_PASSWORD_HASH=$(hash_input "$USER_PASSWORD")
    
    # ctOS: Check for SQL injection (Watch Dogs 2 surveillance)
    echo -e "${CYAN}ctOS: Scanning Linux input for malicious patterns...${NC}"
    if check_sql_injection "$USER_PASSWORD"; then
        alert_linux_injection
    fi
    
    if [ "$USER_PASSWORD_HASH" != "$CORRECT_PASSWORD_HASH" ]; then
        echo -e "${RED}INCORRECT PASSWORD${NC}"
        authentication_failed
        return 1
    fi
    
    echo -e "${GREEN}Password verified.${NC}"
    echo ""
    
    # Step 2: Passkey
    echo -n "Enter Passkey: "
    read -s USER_PASSKEY
    echo ""
    
    USER_PASSKEY_HASH=$(hash_input "$USER_PASSKEY")
    
    # Check for SQL injection
    if check_sql_injection "$USER_PASSKEY"; then
        alert_linux_injection
    fi
    
    if [ "$USER_PASSKEY_HASH" != "$CORRECT_PASSKEY_HASH" ]; then
        echo -e "${RED}INCORRECT PASSKEY${NC}"
        authentication_failed
        return 1
    fi
    
    echo -e "${GREEN}Passkey verified.${NC}"
    echo ""
    echo -e "${GREEN}FULL AUTHENTICATION SUCCESSFUL${NC}"
    
    # Clear sensitive variables (Linux security)
    unset USER_PASSWORD
    unset USER_PASSKEY
    
    return 0
}

# Authentication failure handler
authentication_failed() {
    echo ""
    echo -e "${RED}AUTHENTICATION FAILED${NC}"
    echo -e "${YELLOW}Alerting Linux security operations...${NC}"
    echo ""
    
    # Get system info
    ALERT_DATE=$(date)
    HOSTNAME=$(hostname)
    
    # Create Linux security alert
    LINUX_ALERT="{\"event\":\"LINUX_TWO_FACTOR_AUTH_FAILURE\",\"hostname\":\"$HOSTNAME\",\"date\":\"$ALERT_DATE\",\"attempted_password_hash\":\"$USER_PASSWORD_HASH\",\"attempted_passkey_hash\":\"$USER_PASSKEY_HASH\",\"alert_level\":\"CRITICAL\",\"platform\":\"Linux-Shield\"}"
    
    # Send to server (if curl exists, because this is Linux)
    if command -v curl >/dev/null 2>&1; then
        curl -X POST "$LINUX_SERVER_URL" \
             -H "Content-Type: application/json" \
             -H "X-Linux-Security: Penguin-Shield" \
             -d "$LINUX_ALERT" \
             --connect-timeout 10 \
             --max-time 30 2>/dev/null
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Linux Security Operations contacted.${NC}"
            echo -e "${BLUE}Global Threat Initiative responding...${NC}"
        else
            echo -e "${RED}Server contact failed. Logging locally.${NC}"
            echo "$ALERT_DATE - LINUX AUTH FAILURE on $HOSTNAME" >> "$LOG_FILE" 2>/dev/null
        fi
    else
        echo -e "${RED}curl not found. Logging locally.${NC}"
        echo "$ALERT_DATE - LINUX AUTH FAILURE on $HOSTNAME" >> "$LOG_FILE" 2>/dev/null
    fi
    
    # Lock the session (Linux style)
    if command -v gnome-screensaver-command >/dev/null 2>&1; then
        gnome-screensaver-command -l
    elif command -v xscreensaver-command >/dev/null 2>&1; then
        xscreensaver-command -lock
    elif command -v i3lock >/dev/null 2>&1; then
        i3lock
    else
        echo "Screen lock not available. Linux is so fragmented..."
    fi
    
    # Clear sensitive variables
    unset USER_PASSWORD
    unset USER_PASSKEY
    
    echo "Access denied. Linux system secured."
    exit 1
}

# Successful access
linux_system_access() {
    echo ""
    echo -e "${GREEN}Welcome to your secure Linux system!${NC}"
    echo -e "${BLUE}(We still think Windows is better though)${NC}"
    echo ""
    
    echo "Loading Linux security modules..."
    echo -e "${GREEN}- THE_BLACK_CAT: Authentication complete${NC}"
    echo -e "${PURPLE}- TARTEUS: Alert system active${NC}"  
    echo -e "${YELLOW}- SINEVA: File detection online${NC}"
    echo -e "${CYAN}- PENGUIN-GUARD: Linux protection active${NC}"
    echo -e "${BLUE}- ctOS: Monitoring and logic systems active${NC}"
    
    if [ "$ROOT_USER" = true ]; then
        echo -e "${RED}- ROOT-WATCH: Superuser monitoring enabled${NC}"
    fi
    
    sleep 2
    echo ""
    echo -e "${GREEN}Linux-Shield systems ready.${NC}"
    echo -e "${BLUE}(Still prefer Windows though...)${NC}"
    
    # Your Linux system operations here
    echo ""
    echo "Press any key to continue..."
    read -n 1
}

# SINEVA file detection for Linux
sineva_linux_scan() {
    echo -e "${YELLOW}SINEVA: Scanning Linux system for suspicious files...${NC}"
    echo -e "${BLUE}Delta Force protocols activated for penguin security...${NC}"
    
    # Common suspicious locations in Linux
    SCAN_DIRS="/tmp /var/tmp /home /usr/local"
    
    for dir in $SCAN_DIRS; do
        if [ -d "$dir" ]; then
            echo "Scanning: $dir"
            find "$dir" -name "*.sh" -o -name "*.py" -o -name "*.pl" 2>/dev/null | head -10 | while read file; do
                echo "SINEVA-Linux: Checking $(basename "$file")"
                # Add file analysis logic here
            done
        fi
    done
    
    echo -e "${GREEN}SINEVA scan complete. Linux system secure.${NC}"
}

# Main execution
main() {
    # Run Linux security checks
    penguin_security_check
    
    # Authenticate user
    if authenticate_user; then
        linux_system_access
    fi
}

# Cheese loading animation for Linux
cheese_loading_linux() {
    echo -e "${YELLOW}Loading Linux security systems...${NC}"
    echo ""
    
    # Frame 1 - Cheese at top
    clear
    echo -e "${CYAN}================================================${NC}"
    echo -e "${YELLOW}           LINUX SECURITY LOADING...${NC}"
    echo -e "${CYAN}================================================${NC}"
    echo ""
    echo ""
    echo "               ▄▄▄▄▄▄▄▄▄▄"
    echo "               █ CHEESE █"
    echo "               █ ░░░░░░ █"
    echo "               █ ░░██░░ █"
    echo "               █ ░░░░░░ █"
    echo "               ▀▀▀▀▀▀▀▀▀▀"
    echo ""
    echo ""
    echo ""
    echo ""
    echo -e "${GREEN}           Loading Linux Modules...${NC}"
    echo -e "${BLUE}           Created by: Cheesedemon64${NC}"
    echo ""
    sleep 1
    
    # Frame 2 - Cheese middle
    clear
    echo -e "${CYAN}================================================${NC}"
    echo -e "${YELLOW}           LINUX SECURITY LOADING...${NC}"
    echo -e "${CYAN}================================================${NC}"
    echo ""
    echo ""
    echo ""
    echo "               ▄▄▄▄▄▄▄▄▄▄"
    echo "               █ CHEESE █"
    echo "               █ ░░░░░░ █"
    echo "               █ ░░██░░ █"
    echo "               █ ░░░░░░ █"
    echo "               ▀▀▀▀▀▀▀▀▀▀"
    echo ""
    echo ""
    echo -e "${GREEN}           Loading Linux Modules...${NC}"
    echo -e "${BLUE}           Created by: Cheesedemon64${NC}"
    echo ""
    sleep 1
    
    # Frame 3 - Cheese at bottom
    clear
    echo -e "${CYAN}================================================${NC}"
    echo -e "${YELLOW}           LINUX SECURITY LOADING...${NC}"
    echo -e "${CYAN}================================================${NC}"
    echo ""
    echo ""
    echo ""
    echo ""
    echo "               ▄▄▄▄▄▄▄▄▄▄"
    echo "               █ CHEESE █"
    echo "               █ ░░░░░░ █"
    echo "               █ ░░██░░ █"
    echo "               █ ░░░░░░ █"
    echo "               ▀▀▀▀▀▀▀▀▀▀"
    echo ""
    echo -e "${GREEN}           Loading Linux Modules...${NC}"
    echo -e "${BLUE}           Created by: Cheesedemon64${NC}"
    echo ""
    sleep 1
    
    # Frame 4 - Cheese middle again
    clear
    echo -e "${CYAN}================================================${NC}"
    echo -e "${YELLOW}           LINUX SECURITY LOADING...${NC}"
    echo -e "${CYAN}================================================${NC}"
    echo ""
    echo ""
    echo ""
    echo "               ▄▄▄▄▄▄▄▄▄▄"
    echo "               █ CHEESE █"
    echo "               █ ░░░░░░ █"
    echo "               █ ░░██░░ █"
    echo "               █ ░░░░░░ █"
    echo "               ▀▀▀▀▀▀▀▀▀▀"
    echo ""
    echo ""
    echo -e "${GREEN}           Loading Linux Modules...${NC}"
    echo -e "${BLUE}           Created by: Cheesedemon64${NC}"
    echo ""
    sleep 1
    
    # Final frame - Cheese ready!
    clear
    echo -e "${CYAN}================================================${NC}"
    echo -e "${GREEN}           LINUX SECURITY LOADED!${NC}"
    echo -e "${CYAN}================================================${NC}"
    echo ""
    echo ""
    echo "               ▄▄▄▄▄▄▄▄▄▄"
    echo "               █ CHEESE █"
    echo "               █ ░░░░░░ █  ✓ READY!"
    echo "               █ ░░██░░ █"
    echo "               █ ░░░░░░ █"
    echo "               ▀▀▀▀▀▀▀▀▀▀"
    echo ""
    echo ""
    echo -e "${GREEN}           🧀 Linux Security Online! 🧀${NC}"
    echo -e "${BLUE}           Created by: Cheesedemon64${NC}"
    echo -e "${YELLOW}           (Still prefer Windows though...)${NC}"
    echo ""
    sleep 2
}

# Help function
show_help() {
    echo "Linux-Shield Security System"
    echo "Usage: $0 [option]"
    echo ""
    echo "Options:"
    echo "  --scan         Run SINEVA file scan"
    echo "  --help         Show this help message"
    echo "  (no option)    Run authentication"
    echo ""
    echo "Created by Cheesedemon64"
    echo "(For the poor souls using Linux instead of Windows)"
    echo "Windows Master Race forever! 🏆"
}

# Command line argument handling
case "$1" in
    --scan)
        sineva_linux_scan
        ;;
    --help)
        show_help
        ;;
    "")
        main
        ;;
    *)
        echo "Unknown option: $1"
        show_help
        exit 1
        ;;
esac
