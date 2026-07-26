# large_files.sh

`large_files.sh` finds files larger than a chosen size inside a directory.

It only lists files. It does not delete or modify anything.

## What It Does

- Searches inside a target directory
- Filters files by minimum size
- Displays file sizes in a readable format
- Sorts results from largest to smallest
- Limits the number of displayed results

## Usage

Default search:

```sh
./scripts/large_files.sh
```

Custom directory:

```sh
./scripts/large_files.sh /home
```

Custom directory and size:

```sh
./scripts/large_files.sh . 100M
```

Custom directory, size, and result limit:

```sh
./scripts/large_files.sh . 1k 10
```

Help:

```sh
./scripts/large_files.sh --help
```

## Size Units

The script passes the size value to `find -size`.

Use these units:

| Unit | Meaning |
| --- | --- |
| `c` | Bytes |
| `k` | KiB / 1024-byte blocks |
| `M` | MiB |
| `G` | GiB |

Important:

```text
Use lowercase k, not uppercase K.
```

Example:

```sh
./scripts/large_files.sh . 1k 10
```

Avoid:

```sh
./scripts/large_files.sh . 1K 10
```

## Example Output

```text
Large files
===========
Target: .
Size: +1k
Limit: 10

12M     ./logs/big.log
4.5M    ./backup/archive.tar.gz
2.0M    ./data/file.bin
```

## Commands Used

| Command | Purpose |
| --- | --- |
| `find` | Searches files recursively |
| `-type f` | Keeps only files |
| `-size +SIZE` | Filters files larger than the chosen size |
| `du -h` | Displays file size in a readable format |
| `sort -rh` | Sorts readable sizes from largest to smallest |
| `head -n` | Limits the number of displayed results |

## Notes

Permission errors can happen when searching system directories.

The script may hide those errors with:

```sh
2>/dev/null
```

This keeps the output readable.

## Exit Behavior

| Case | Behavior |
| --- | --- |
| No argument | Searches current directory with default size and limit |
| Invalid directory | Prints an error and exits with failure |
| Invalid limit | Prints an error and exits with failure |
| `--help` or `-h` | Prints usage help |

## Examples

Find files larger than `100M` in the current directory:

```sh
./scripts/large_files.sh . 100M
```

Find files larger than `1k` and show only 10 results:

```sh
./scripts/large_files.sh . 1k 10
```

Find files larger than `1G` in `/home`:

```sh
./scripts/large_files.sh /home 1G 20
```
