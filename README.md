# Server Performance Stats Monitor

## Author: Aleemuddin Mohammad

**Email:** [aleemuddin.work@gmail.com](mailto\:aleemuddin.work@gmail.com)

---

## Table of Contents

- [Introduction](#introduction)

- [Technologies](#technologies)

- [Project Breakdown](#project-breakdown)

  - [P1: Setup and CPU Usage](#p1-setup-and-cpu-usage)
  - [P2: Memory Usage](#p2-memory-usage)
  - [P3: Disk Usage](#p3-disk-usage)
  - [P4: Top 5 Processes](#p4-top-5-processes)
  - [P5: Stretch Features](#p5-stretch-features)

- [Setup Instructions](#setup-instructions)

- [Contact](#contact)

- [Conclusion](#conclusion)

---

## Introduction

This repository contains a Bash script that monitors basic server performance statistics. I created this project to learn Bash scripting and Linux CLI tools from scratch. Each component was added, tested, and debugged to ensure functionality and clarity.

---

## Technologies

- **Bash** - Scripting language used to write the monitor
- **Linux CLI tools** - `top`, `free`, `df`, `ps`, `uptime`, `who`, `awk`, `grep`, etc.
- **Amazon EC2** - Used as the test server for executing the script

---

## Project Breakdown

### P1: Setup and CPU Usage

- Created a script using `touch` and made it executable.
- Added CPU monitoring using:
  ```bash
  top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " 100 - $8 "%"}'
  ```
- Learned about `top` output format and Bash arithmetic.

### P2: Memory Usage

- Used `free` command to extract memory stats.
- Parsed total, used, free, and available memory using `awk`.
- Calculated percentage usage:
  ```bash
  percent=$((used * 100 / total))
  ```
- Debugged unit handling issue (`Mi`, `Gi`) and used numeric format for calculations.

### P3: Disk Usage

- Used `df --total` to compute overall disk usage.
- Printed disk stats per partition:
  ```bash
  df -h --output=target,avail,used,pcent
  ```
- Parsed usage values and calculated available percentages.

### P4: Top 5 Processes

- Displayed top 5 processes by CPU:
  ```bash
  ps -eo user,pid,command,%cpu --sort=-%cpu | head -n 6
  ```
- Displayed top 5 processes by memory:
  ```bash
  ps -eo user,pid,command,%mem --sort=-%mem | head -n 6
  ```

### P5: Stretch Features

- Displayed OS version using:
  ```bash
  cat /etc/os-release
  ```
- Added system uptime, load average, logged-in users, and boot time:
  ```bash
  uptime -p
  cat /proc/loadavg
  who
  who -b
  ```
- Conditionally handled commands that require `sudo`.

---

## Setup Instructions

To run this project on a Linux system:

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/server-performance-monitor.git
   ```
2. Navigate to the script directory:
   ```bash
   cd server-performance-monitor
   ```
3. Make the script executable:
   ```bash
   chmod +x server-stats.sh
   ```
4. Run the script:
   ```bash
   ./server-stats.sh
   ```

---

## Contact

For any queries or suggestions:

- **Email:** [aleemuddin.work@gmail.com](mailto\:aleemuddin.work@gmail.com)

---

## Conclusion

This project gave me hands-on experience with Linux system monitoring, Bash scripting, and debugging. It reinforced the importance of understanding core OS-level tools and strengthened my confidence in writing production-friendly Bash scripts.


