# report.sh

Generate a simple system report.

This script gathers several system checks into one readable report. By default, it creates a timestamped report file in the `reports/` directory.

## Usage

```sh
./scripts/report.sh [--stdout] [--help]
```

## Examples

Create a report file:

```sh
./scripts/report.sh
```

Display the report directly in the terminal:

```sh
./scripts/report.sh --stdout
```

Display help:

```sh
./scripts/report.sh --help
```

## What It Includes

- Current date
- Hostname
- Kernel version
- Uptime
- Disk usage for `/`
- Memory usage
- CPU core count
- CPU load average
- Connected users

## Report File

When used without option, the script creates a file in:

```text
reports/
```

The file name uses this format:

```text
system_report_YYYYMMDD_HHMMSS.txt
```

Example:

```text
reports/system_report_20260726_153012.txt
```

The timestamp prevents a new report from overwriting a previous one.

## Example Output

```text
System report
=============
Date: Sun Jul 26 15:30:12 CEST 2026
Hostname: DESKTOP-G7BN3LI
Kernel: 6.6.87.2-microsoft-standard-WSL2
Uptime: up 2 hours, 14 minutes

Disk:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdc       1007G   42G  915G   5% /

Memory:
               total        used        free      shared  buff/cache   available
Mem:            15Gi       2.1Gi        10Gi       8.0Mi       3.0Gi        13Gi
Swap:          4.0Gi          0B       4.0Gi

CPU:
Cores: 8
Load: 0.02 0.04 0.01

Connected users:
```

On WSL or some minimal environments, the `Connected users` section can be empty. That is not necessarily an error.

## Commands Used

| Command | Purpose |
| --- | --- |
| `date` | Print the current date |
| `hostname` | Print the machine hostname |
| `uname -r` | Print the kernel version |
| `uptime -p` | Print system uptime in a readable format |
| `df -h /` | Print disk usage for `/` |
| `free -h` | Print memory usage |
| `nproc` | Print the number of CPU cores |
| `awk` | Extract load average values from `/proc/loadavg` |
| `who` | Print connected users |
| `mkdir -p` | Create the `reports/` directory if needed |

## Exit Behavior

| Situation | Behavior |
| --- | --- |
| No option | Create a timestamped report file |
| `--stdout` | Display the report in the terminal |
| `--help` or `-h` | Display usage and exit successfully |
| Unknown option | Print an error and exit with code `1` |

## Notes

Generated reports may contain local system information. If they are only for local use, keep `reports/` in `.gitignore`.

