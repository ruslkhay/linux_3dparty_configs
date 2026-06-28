# Ranger Config

File manager setup for a research/development workflow — with icons, rich
previews, archive management, git status, tmux integration, and smart
directory jumping.

## Requirements

Install all dependencies at once:

```bash
sudo apt install bat atool chafa python3-nbconvert zoxide
```

| Tool | Purpose |
|------|---------|
| `bat` (runs as `batcat` on Ubuntu) | Syntax-highlighted code preview |
| `atool` | Preview and extract archives (tar, zip, 7z, rar, …) |
| `chafa` | Render images as Unicode art (works in GNOME Terminal) |
| `python3-nbconvert` | Convert Jupyter notebooks for preview |
| `zoxide` | Smart directory jumping (learns frequent paths) |
| `pdftotext` / `pdftoppm` | PDF preview — usually pre-installed (`poppler-utils`) |

A **Nerd Font** or **NerdFontsSymbolsOnly** must be available as a terminal
fallback font for file icons to render correctly.

## Plugins

Managed as git submodules — after cloning run:

```bash
git submodule update --init --recursive
```

| Plugin | Purpose |
|--------|---------|
| [ranger-devicons2](https://github.com/cdump/ranger-devicons2) | File icons synced from nvim-web-devicons |
| [ranger-archives](https://github.com/maximtrp/ranger-archives) | Extract / compress archives from within ranger |
| [ranger_tmux](https://github.com/joouha/ranger_tmux) | Open files in tmux panes |
| [ranger-zoxide](https://github.com/jchook/ranger-zoxide) | Jump to frecent directories via zoxide |
| ranger_git *(built-in)* | Git status indicators in file listing |

## Previews

| File type | Tool |
|-----------|------|
| Code (py, cpp, lua, …) | `batcat` with syntax highlighting |
| Images (png, jpg, svg, …) | `chafa` — Unicode art rendering |
| PDF | First page via `pdftoppm` + `chafa`, fallback to text |
| Jupyter notebooks (`.ipynb`) | Converted to highlighted Python via `nbconvert` |
| Archives | Contents listed via `atool` |
| Graphviz (`.dot`, `.gv`) | Syntax highlighted source |
| PlantUML (`.puml`) | Syntax highlighted source |

## Keybindings

| Key | Action |
|-----|--------|
| `zj` | Jump to a frecent directory (zoxide) |
| `ex` | Extract selected archive |
| `ec` | Compress selected files |
| `ts` | Open file in a tmux horizontal split (nvim) |
| `tv` | Open file in a tmux vertical split (nvim) |
| `gs` | `git status` of current directory |
| `gl` | `git log --oneline` (last 15 commits) |
| `gd` | `git diff` |

## Notes

- Image preview uses `chafa` (Unicode art), not `ueberzug` — the latter does
  not work in GNOME Terminal.
- `scope.sh` is the preview driver; edit it to add new file types.
- `vcs_aware true` is set — ranger shows git status in the gutter natively.
