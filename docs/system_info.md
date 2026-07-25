# system_info.sh

`system_info.sh` displays a short summary of the current Linux system.

It is a read-only script: it does not modify files, services, users, or system configuration.

## Information Displayed

- Hostname
- Current user
- Linux distribution
- Kernel version
- CPU architecture
- Uptime
- Current date

## Usage

Normal output:

```sh
./scripts/system_info.sh
```

JSON output:

```sh
./scripts/system_info.sh --json
```

Help:

```sh
./scripts/system_info.sh --help
```

## Example Output

```text
System information
==================
Hostname:     my-linux
User:         nicolsan
OS:           Ubuntu 24.04 LTS
Kernel:       6.8.0
Architecture: x86_64
Uptime:       up 2 hours, 14 minutes
Date:         2026-07-25 14:30:00
```

## Example JSON Output

```json
{
  "hostname": "my-linux",
  "user": "nicolsan",
  "os": "Ubuntu 24.04 LTS",
  "kernel": "6.8.0",
  "architecture": "x86_64",
  "uptime": "up 2 hours, 14 minutes",
  "date": "2026-07-25 14:30:00"
}
```

## Commands Used

| Command | Purpose |
| --- | --- |
| `hostname` | Get the machine name |
| `whoami` | Get the current user |
| `uname -r` | Get the kernel version |
| `uname -m` | Get the CPU architecture |
| `uptime -p` | Get a readable uptime |
| `date` | Get the current date |
| `/etc/os-release` | Read Linux distribution information |

## Exit Behavior

| Case | Behavior |
| --- | --- |
| No option | Prints normal text output |
| `--json` | Prints JSON output |
| `--help` or `-h` | Prints usage help |
| Unknown option | Prints an error and exits with failure |

## Notes

The JSON output is intentionally simple and meant for basic scripting or inspection.
