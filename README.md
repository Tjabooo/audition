# audition

**"Keep these changes?" for any config file.** Your display settings ask you to confirm a new
resolution and switch back by themselves if you don't. audition does the same for your compositor,
bar and notification configs:

```sh
audition ~/.config/hypr/hyprland.conf    # opens it in $EDITOR; save and quit to start the trial
audition keep                            # happy with it
audition revert                          # or roll back now. Do nothing and it rolls back in 45 s.
```

A typo that leaves you with no keybinds, a bar that never comes back, or a monitor line that blanks
your screen fixes itself.

- **Snapshot, apply, countdown.** The files are copied first. After you edit them, audition reloads
  what they belong to (Hyprland, sway, Waybar, eww, dunst or mako, from the path) and starts the
  countdown.
- **Rollback can't be lost.** The rollback is a systemd user timer, not a process in your
  terminal, so it still happens if the compositor or terminal crashes during the trial.
- **Broken configs revert at once.** If `hyprctl configerrors` (or `swaymsg reload`) reports a new
  error after the reload, the old files come back straight away.
- **Visible.** An eww countdown bar shows at the top of the screen if eww is installed; otherwise
  you get a notification.

## Install

```sh
git clone https://github.com/Tjabooo/audition.git
cd audition && ./install.sh
```

Needs Python 3 and systemd (user session). eww and notify-send are optional.

Bind keep and revert to keys that don't depend on the config you're trying, e.g. in Hyprland:

```ini
bind = SUPER ALT, Return, exec, ~/.local/bin/audition keep
bind = SUPER ALT, BackSpace, exec, ~/.local/bin/audition revert
```

## Options

| | |
| --- | --- |
| `-t SECONDS` | Trial length (default 45, or `AUDITION_SECONDS`) |
| `--no-edit FILE...` | Snapshot now and edit however you like, then run `audition apply` |
| several files | `audition hyprland.conf ~/.config/waybar/config.jsonc` trials them together |
| `audition status` / `stream` | JSON (`active`, `left`, `files`, `pct`) for Waybar or eww |
| `AUDITION_EWW` | Use this eww config folder. By default it's the first of yours that defines an `audition` window, else the bundled one. |
| `AUDITION_SOUNDS=0` | No sounds (freedesktop theme sounds via pw-play/paplay) |

## License

MIT
