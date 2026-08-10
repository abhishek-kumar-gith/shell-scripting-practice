# 🐚 Shell Scripting Practice

A collection of practical Bash shell scripts created while learning
Linux, Shell Scripting, and DevOps fundamentals.

This repository contains scripts for system monitoring, process
management, command-line arguments, and Linux automation.

---

## 📂 Scripts

### 01 - Log Analyzer

Analyzes log files and counts different types of log messages.

**Concepts Used:**
- grep
- wc
- Variables
- Command substitution
- printf

---

### 02 - Memory Health Checker

Checks system memory usage and determines the health status based
on memory utilization.

**Concepts Used:**
- free
- awk
- Arithmetic operations
- if / elif / else
- printf
- Variables

**Example Output:**

    TOTAL MEMORY : 3687636 MB
    USED MEMORY  : 537408 MB
    MEMORY USAGE : 14%
    STATUS       : HEALTHY
    ACTION       : No action required

---

### 03 - Process Checker

Checks whether a specified process is currently running on the system.

The process name can be provided using a command-line argument.

**Concepts Used:**
- ps
- grep
- Command-line arguments
- $1
- read
- if / else
- printf

**Example:**

    ./process_checker.sh vim

---

### 04 - Command-Line Arguments

A simple script created to understand and practice command-line
arguments in Bash.

**Concepts Used:**
- $1
- $2
- $3
- $#
- Argument validation
- read
- exit

**Example:**

    ./argument_test.sh abhishek kundan kumar


---
### 05. Disk Usage Monitor

- Monitors disk usage of the Linux root filesystem.
- Displays total, used, and available disk space.
- Calculates disk usage percentage.
- Checks disk health based on usage percentage.
- Displays recommended action.

**Commands/Concepts Used:**
- `df`
- `awk`
- `tr`
- `printf`
- Variables
- Command substitution `$()`
- `if / elif / else`

**Example:**


./disk_usage_checker.sh

====================================
        DISK USAGE MONITOR
====================================
FILESYSTEM  : /dev/sdd
TOTAL       : 1007G
USED        : 2.6G
AVAILABLE   : 954G
USAGE       : 1%
STATUS      : Healthy
ACTION      : No action required
====================================

---

## 🧠 Concepts Learned

- Bash scripting basics
- Variables
- Command substitution
- User input
- Command-line arguments
- Conditional statements
- Numeric comparisons
- grep
- awk
- ps
- free
- printf
- Pipes
- Linux process monitoring
- Basic system monitoring

---

## 🚀 Upcoming Scripts

- [ ] CPU Usage Monitor
- [ ] File and Directory Checker
- [ ] Backup Automation Script
- [ ] Service Monitor
- [ ] Network Connectivity Checker
- [ ] Port Checker
- [ ] Log Monitoring System
- [ ] System Health Monitor
- [ ] Cron Automation
- [ ] Docker Automation
- [ ] Deployment Script

---

## 🎯 Goal

The goal of this repository is to build practical Shell Scripting
skills for Linux administration, DevOps, automation, and system
monitoring.

New scripts and improvements will be added as I continue learning.

---

## 🛠️ Environment

- Linux / WSL
- Bash
- Git
- GitHub

---

## 📈 Learning Progress

| Topic | Status |
|---|---|
| Bash Basics | ✅ |
| Variables | ✅ |
| Command Substitution | ✅ |
| Pipes | ✅ |
| grep | ✅ |
| awk | ✅ |
| Conditions | ✅ |
| User Input | ✅ |
| Command-Line Arguments | ✅ |
| Process Monitoring | ✅ |
| Memory Monitoring | ✅ |
| Disk Monitoring | ✅ |
| Loops | 🔄 |
| Functions | 🔄 |
| Automation | 🔄 |
| DevOps Scripts | 🔄 |
