import os
import atexit
import readline

py_history_file = os.path.join(os.path.expanduser('~'), '.local',
                               'share', 'histfiles', 'python')

try:
    readline.read_history_file(py_history_file)
except IOError:
    pass

readline.set_history_length(512)
atexit.register(readline.write_history_file, py_history_file)
