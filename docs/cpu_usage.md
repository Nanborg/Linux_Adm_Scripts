# cpu_usage.sh

`cpu_usage.sh` displays basic CPU load information and the processes currently using the most CPU.

It is a read-only script: it does not stop, kill, or modify processes.

## Information Displayed

- Number of CPU cores
- Load average over 1, 5 and 15 minutes
- Top CPU-consuming processes

## Usage

Show the default number of processes:

```sh
./scripts/cpu_usage.sh
```

Show a custom number of processes:

```sh
./scripts/cpu_usage.sh 10
```

Help:

```sh
./scripts/cpu_usage.sh --help
```

## Example Output

```text
CPU usage
=========
CPU cores: 8
Load average 1/5/15 min: 0.14 0.20 0.18

Top CPU processes:
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
user      1234 12.0  1.5 123456 12345 ?        Sl   10:00   0:12 example
```

## Commands Used

| Command | Purpose |
| --- | --- |
| `nproc` | Gets the number of available CPU cores |
| `/proc/loadavg` | Provides load average values |
| `awk` | Extracts the 1, 5 and 15 minute load values |
| `ps aux --sort=-%cpu` | Lists processes sorted by CPU usage |
| `head` | Limits the number of displayed processes |

## Load Average

Load average is not the same as CPU percentage.

It represents the average number of tasks using or waiting for CPU time.

The three values usually mean:

| Value | Meaning |
| --- | --- |
| First value | Load average over 1 minute |
| Second value | Load average over 5 minutes |
| Third value | Load average over 15 minutes |

Load should be interpreted relative to the number of CPU cores.

Example:

```text
Load 4.00 on 4 cores is not the same as load 4.00 on 1 core.
```

## Process Count Argument

The optional argument controls how many processes are displayed.

Example:

```sh
./scripts/cpu_usage.sh 10
```

The script keeps the `ps` header line, so internally it displays:

```text
process_count + 1 line
```

## Exit Behavior

| Case | Behavior |
| --- | --- |
| No argument | Shows default number of CPU-consuming processes |
| Numeric argument | Shows that number of processes |
| Invalid argument | Prints an error and exits with failure |
| `--help` or `-h` | Prints usage help |

## Examples

Default output:

```sh
./scripts/cpu_usage.sh
```

Show 15 processes:

```sh
./scripts/cpu_usage.sh 15
```

Invalid argument:

```sh
./scripts/cpu_usage.sh bad
```
