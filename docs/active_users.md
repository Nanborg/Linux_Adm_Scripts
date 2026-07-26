# active_users.sh

`active_users.sh` lists active user sessions on the current Linux system.

It can also show a short summary or recent login history.

## What It Shows

- Number of active sessions
- Active user sessions
- Detailed session activity
- Recent login history when requested

## Usage

Default output:

```sh
./scripts/active_users.sh
```

Summary only:

```sh
./scripts/active_users.sh --summary
```

Recent login history:

```sh
./scripts/active_users.sh --history
```

Help:

```sh
./scripts/active_users.sh --help
```

## Options

| Option | Description |
| --- | --- |
| `--summary` | Shows only the active sessions summary |
| `--history` | Shows recent login history using `last` |
| `--help`, `-h` | Shows usage help |

## Commands Used

| Command | Purpose |
| --- | --- |
| `who` | Lists active login sessions |
| `w` | Shows detailed active session information |
| `last` | Shows recent login history |
| `command -v` | Checks whether required commands are available |

## Example Output

```text
Active users
============
Session count: 1

Sessions:
nicolsan tty2 2026-07-25 10:12

Detailed activity
=================
 10:30:42 up 2:18, 1 user, load average: 0.05, 0.08, 0.10
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
nicolsan tty2                      10:12    2:00   0.10s  0.10s bash
```

## Exit Behavior

| Case | Behavior |
| --- | --- |
| No option | Shows sessions and detailed activity |
| `--summary` | Shows only active sessions |
| `--history` | Shows active sessions and recent login history |
| `--help` or `-h` | Shows usage help |
| Unknown option | Prints an error and exits with failure |
| Missing command | Prints an error and exits with failure |

## Notes

On WSL, containers, or limited environments, `who` and `w` may return little or no session information.

That does not always mean the script is broken. It can mean the environment does not record login sessions like a full Linux system.
