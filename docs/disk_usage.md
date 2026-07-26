# disk_usage.sh

`disk_usage.sh` displays filesystem usage for a given path.

It also compares the usage percentage with a configurable warning threshold.

## Information Displayed

- Filesystem
- Total size
- Used space
- Available space
- Usage percentage
- Status: `OK` or `WARNING`

## Usage

Default path `/` and default threshold `80%`:

```sh
./scripts/disk_usage.sh
```

Custom path:

```sh
./scripts/disk_usage.sh /home
```

Custom path and threshold:

```sh
./scripts/disk_usage.sh / 90
```

Help:

```sh
./scripts/disk_usage.sh --help
```

## Example Output

```text
Disk usage
==========
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda2        98G   64G   29G  69% /

Status: OK, usage is 69% (threshold: 80%)
```

## Commands Used

| Command | Purpose |
| --- | --- |
| `df -h` | Displays filesystem usage in a readable format |
| `df -P` | Displays filesystem usage in a stable script-friendly format |
| `awk` | Extracts the usage percentage |
| `gsub` | Removes the `%` symbol before numeric comparison |

## `df` vs `du`

| Command | Purpose |
| --- | --- |
| `df` | Shows usage of a filesystem or partition |
| `du` | Shows the size of files or directories |

This script uses `df` because it checks filesystem usage, not the size of one folder.

## Exit Behavior

| Case | Behavior |
| --- | --- |
| Usage below threshold | Prints `OK` |
| Usage reaches threshold | Prints `WARNING` and exits with code `2` |
| Invalid path | Prints an error and exits with failure |
| Invalid threshold | Prints an error and exits with failure |
| `--help` or `-h` | Prints usage help |

## Examples

Check root filesystem:

```sh
./scripts/disk_usage.sh
```

Check `/tmp`:

```sh
./scripts/disk_usage.sh /tmp
```

Trigger a warning with a low threshold:

```sh
./scripts/disk_usage.sh / 1
```

Invalid threshold:

```sh
./scripts/disk_usage.sh / bad
```

Invalid path:

```sh
./scripts/disk_usage.sh /does/not/exist
```
