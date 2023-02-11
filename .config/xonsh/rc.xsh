import os
import subprocess
from xonsh.tools import unthreadable
from xonsh.tools import uncapturable
from xonsh.tools import register_custom_style

$FOREIGN_ALIASES_SUPPRESS_SKIP_MESSAGE=True
__import__('warnings').filterwarnings('ignore', 'There is no current event loop', DeprecationWarning, 'prompt_toolkit.eventloop.utils')

$XONSH_CAPTURE_ALWAYS=True

xontrib load abbrevs bashisms cd fzf-widgets gitinfo jedi kitty mpl output_search pdb pipeliner readable-traceback whole_word_jumping xog histcpy mplhooks

$UPDATE_OS_ENVIRON=True

# Add extensions from ~/.xonsh
xonsh_ext_dir = os.path.expanduser('~/.xonsh')

# PROMPT STUFF
$PROMPT_FIELDS['prompt_end'] = $PROMPT_FIELDS['prompt_end'].replace('$', '@')
def soSiStraw():
    return subprocess.check_output(['sodiumSierraStrawberry', os.path.abspath('.')]).decode().strip()

def exit_status_color():
    return 46 if $PROMPT_FIELDS['last_return_code']() == 0 else 124
$PROMPT_FIELDS['soSiStraw'] = soSiStraw
$PROMPT_FIELDS['exit_color'] = exit_status_color
$PROMPT="\x1b[1;39m[\x1b[1;38;5;{exit_color}m{last_return_code}\x1b[39m] \x1b[38;5;221m{user}@{hostname}\x1b[39m:\x1b[38;5;32m{soSiStraw}\x1b[39m{prompt_end} \x1b[0m"

# ALIASES

source-bash --overwrite-aliases $HOME/.config/portable_aliases

# XONSH WEBCONFIG START
xontrib load coreutils
# XONSH WEBCONFIG END
