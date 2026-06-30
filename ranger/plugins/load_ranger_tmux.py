import sys
import os

# ranger_tmux is a package inside its submodule directory — add it to path
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), 'ranger_tmux'))

from ranger_tmux import plugin  # noqa: F401 — registers hooks with ranger on import
