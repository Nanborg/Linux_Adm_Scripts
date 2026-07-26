# services.sh

`services.sh` lists active `systemd` services or checks the status of one specific service.

It is a read-only script: it does not start, stop, restart, enable, or disable services.

## What It Does

- Lists running services when no argument is provided
- Checks whether a given service is active
- Shows usage help with `--help`
- Handles systems where `systemctl` is not available

## Usage

List running services:

```sh
./scripts/services.sh
```

Check one service:

```sh
./scripts/services.sh ssh
```

Depending on the distribution, SSH may also be named:

```sh
./scripts/services.sh sshd
```

Help:

```sh
./scripts/services.sh --help
```

## Example Output

Service active:

```text
Status: ssh is active
```

Service inactive or not found:

```text
Status: does-not-exist is not active or not found
```

## Commands Used

| Command | Purpose |
| --- | --- |
| `systemctl list-units --type=service --state=running --no-pager` | Lists running services |
| `systemctl is-active --quiet <service>` | Checks whether a service is active |
| `command -v systemctl` | Checks whether `systemctl` is available |

## Why `--no-pager`

`systemctl` can open an interactive pager such as `less`.

For a script, this is not ideal because it can block the output.

The `--no-pager` option prints the result directly in the terminal.

## Exit Behavior

| Case | Behavior |
| --- | --- |
| No argument | Lists active services and exits successfully |
| Active service | Prints active status and exits successfully |
| Inactive or unknown service | Prints a message and exits with code `2` |
| `systemctl` unavailable | Prints an error and exits with failure |
| `--help` or `-h` | Prints usage help |

## Compatibility Notes

This script expects a Linux system using `systemd`.

On WSL, containers, or minimal Linux environments, `systemctl` may be unavailable or partially supported.

If `systemctl` is not available, the script prints a clear error instead of failing silently.
