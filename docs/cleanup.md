# cleanup.sh

`cleanup.sh` finds old files in a directory and can optionally delete them.

By default, it runs in dry-run mode and only displays matching files.

## Safety Rule

The script does not delete anything unless `--delete` is explicitly provided.

This makes it safer to inspect files before removing them.

## What It Does

- Searches files older than a chosen number of days
- Uses `/tmp` by default
- Runs in dry-run mode by default
- Deletes files only with `--delete`
- Validates the target directory
- Validates the number of days

## Usage

Dry-run with default values:

```sh
./scripts/cleanup.sh
```

Dry-run on a custom directory:

```sh
./scripts/cleanup.sh /tmp 7
```

Delete matching files:

```sh
./scripts/cleanup.sh /tmp 7 --delete
```

Help:

```sh
./scripts/cleanup.sh --help
```

## How `-mtime` Works

The script uses `find -mtime`.

`-mtime` works with full 24-hour days.

Example:

```sh
find /tmp -type f -mtime +7 -print
```

This means:

```text
Find files modified more than 7 full days ago.
```

Important:

```text
A file created just now will not match -mtime +0.
```

To test the script immediately, create a file and force its modification date into the past.

## Safe Test Example

Create a test directory:

```sh
mkdir -p /tmp/cleanup_test
```

Create a file and set its modification date to 2 days ago:

```sh
touch -d "2 days ago" /tmp/cleanup_test/file.txt
```

Check the file timestamp:

```sh
ls -l /tmp/cleanup_test/file.txt
```

Run dry-run:

```sh
./scripts/cleanup.sh /tmp/cleanup_test 0
```

The file should be displayed but not deleted.

Run delete mode:

```sh
./scripts/cleanup.sh /tmp/cleanup_test 0 --delete
```

Check the directory:

```sh
ls -la /tmp/cleanup_test
```

The file should be gone.

## Commands Used

| Command | Purpose |
| --- | --- |
| `find` | Searches files recursively |
| `-type f` | Keeps only files |
| `-mtime +N` | Matches files older than N full days |
| `-print` | Displays matching files |
| `-delete` | Deletes matching files |
| `touch -d` | Creates a file with a chosen modification date for testing |

## Exit Behavior

| Case | Behavior |
| --- | --- |
| Dry-run | Displays matching files only |
| `--delete` | Displays and deletes matching files |
| Invalid directory | Prints an error and exits with failure |
| Invalid number of days | Prints an error and exits with failure |
| `--help` or `-h` | Prints usage help |

## Notes

Use `--delete` only after checking the dry-run output.

For real system directories, permission errors may appear depending on your user rights.
