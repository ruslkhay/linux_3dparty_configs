"""Ranger git status plugin.

- Shows git branch in the title bar
- Adds keybinding gs (in rc.conf) to run git status in the shell
- Shows M/A/D/? status indicators in file listing via 'git' linemode

Usage: add to rc.conf
    default_linemode git
    map gs shell git status
    map gl shell git log --oneline -10
"""

import subprocess
import os
from ranger.core.linemode import LinemodeBase
import ranger


_status_cache = {}   # {dirpath: {basename: status_char}}
_last_dir = [None]


def _fetch_status(dirpath):
    try:
        out = subprocess.check_output(
            ['git', 'status', '--porcelain'],
            cwd=dirpath,
            stderr=subprocess.DEVNULL,
            timeout=2,
        )
        result = {}
        for line in out.decode('utf-8', errors='replace').splitlines():
            if len(line) >= 4:
                xy = line[:2]
                path = line[3:].split(' -> ')[-1].strip()
                if xy[0] not in (' ', '?'):
                    result[os.path.basename(path)] = xy[0]
                elif xy[1] not in (' ', '?'):
                    result[os.path.basename(path)] = xy[1]
                elif '?' in xy:
                    result[os.path.basename(path)] = '?'
        return result
    except Exception:
        return {}


@ranger.api.register_linemode
class GitLinemode(LinemodeBase):
    name = "git"

    def filetitle(self, fobj, metadata):
        return fobj.relative_path

    def infostring(self, fobj, metadata):
        dirpath = fobj.dirname
        if _last_dir[0] != dirpath:
            _status_cache[dirpath] = _fetch_status(dirpath)
            _last_dir[0] = dirpath
        status = _status_cache.get(dirpath, {})
        char = status.get(fobj.basename, '')
        return char if char else ''
