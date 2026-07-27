# backup.sh

Create a compressed backup archive from a directory.

This script takes a source directory, creates a backup folder if needed, then generates a timestamped `.tar.gz` archive.

## Usage

```sh
./scripts/backup.sh <source_directory> [backup_directory]
```

## Examples

Display help:

```sh
./scripts/backup.sh --help
```

Backup the `scripts/` directory into the default `backups/` folder:

```sh
./scripts/backup.sh scripts
```

Backup the `scripts/` directory into a custom folder:

```sh
./scripts/backup.sh scripts my_backups
```

## What It Does

- Checks that a source directory was provided
- Checks that the source directory exists
- Uses `backups/` as default destination if no backup directory is given
- Creates the backup directory with `mkdir -p`
- Builds a timestamped archive name
- Creates a compressed `.tar.gz` archive
- Prints a short preview of the archive content

## Archive Name

The archive name uses this format:

```text
<source_name>_backup_YYYYMMDD_HHMMSS.tar.gz
```

Example:

```text
scripts_backup_20260726_143012.tar.gz
```

The timestamp prevents a new backup from overwriting an older one.

## Example Output

```text
Backup created: backups/scripts_backup_20260726_143012.tar.gz
Content preview:
scripts/
scripts/system_info.sh
scripts/disk_usage.sh
scripts/memory_usage.sh
```

## Commands Used

| Command | Purpose |
| --- | --- |
| `mkdir -p` | Create the backup directory if it does not already exist |
| `date +"%Y%m%d_%H%M%S"` | Generate a timestamp |
| `basename` | Extract the last part of the source directory path |
| `tar -czf` | Create a compressed `.tar.gz` archive |
| `tar -tzf` | List the content of a `.tar.gz` archive |
| `head` | Limit the preview output |

## Tar Options

The script uses:

```sh
tar -czf archive.tar.gz source_directory
```

Meaning:

- `-c`: create a new archive
- `-z`: compress the archive with gzip
- `-f`: write the archive to a file

To preview an archive, the script uses:

```sh
tar -tzf archive.tar.gz
```

Meaning:

- `-t`: list archive content
- `-z`: read gzip compression
- `-f`: read from a file

## Exit Behavior

| Situation | Behavior |
| --- | --- |
| `--help` or `-h` | Display usage and exit successfully |
| Missing source directory | Print an error and exit with code `1` |
| Source path does not exist | Print an error and exit with code `1` |
| Source path is not a directory | Print an error and exit with code `1` |
| Valid source directory | Create the archive and print a preview |

## Notes

Backup archives are generated files. If you do not want them in Git, keep backup folders such as `backups/` or `my_backups/` in `.gitignore`.

