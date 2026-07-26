# memory_usage.sh

`memory_usage.sh` displays RAM usage on the current Linux system.

It also calculates the used memory percentage and compares it with a configurable warning threshold.

## Information Displayed

- Total memory
- Used memory
- Free memory
- Available memory
- Used memory percentage
- Status: `OK` or `WARNING`

## Usage

Default threshold, 80%:

```sh
./scripts/memory_usage.sh
```

Custom threshold:

```sh
./scripts/memory_usage.sh 70
```

Help:

```sh
./scripts/memory_usage.sh --help
```

## Example Output

```text
Memory usage
============
Total:     15900 MB
Used:      6200 MB (38%)
Free:      2100 MB
Available: 9700 MB

Status: OK, memory usage is 38%
```

## Commands Used

| Command | Purpose |
| --- | --- |
| `free -m` | Displays memory values in MB |
| `awk` | Extracts selected columns from `free` output |
| `command -v` | Checks whether `free` is available |

## Memory Columns

| Column | Meaning |
| --- | --- |
| `total` | Total RAM available on the system |
| `used` | RAM currently used |
| `free` | RAM completely unused |
| `available` | RAM available for new applications |

## Notes About Available Memory

Linux uses part of free RAM as cache.

Because of that, the `free` value can look low even when the system still has enough memory available.

The `available` value is usually more useful for understanding whether the system is under memory pressure.

## Exit Behavior

| Case | Behavior |
| --- | --- |
| Memory usage below threshold | Prints `OK` |
| Memory usage reaches threshold | Prints `WARNING` and exits with code `2` |
| Invalid threshold | Prints an error and exits with failure |
| Missing `free` command | Prints an error and exits with failure |
| `--help` or `-h` | Prints usage help |

## Examples

Check memory with default threshold:

```sh
./scripts/memory_usage.sh
```

Trigger a warning with a low threshold:

```sh
./scripts/memory_usage.sh 1
```

Invalid threshold:

```sh
./scripts/memory_usage.sh bad
```
