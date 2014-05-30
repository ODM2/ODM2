import sys
import os


def resource_path(relative=None):
    APPNAME = "ODMTools"
    if sys.platform.lower() == 'darwin':
        appdata = os.path.expanduser(os.path.join("~", "." + APPNAME))
    elif 'win' in sys.platform:
        appdata = os.path.join(os.environ['APPDATA'], APPNAME)
    else:
        appdata = os.path.expanduser(os.path.join("~", "." + APPNAME))

    if not os.path.exists(appdata):
        os.mkdir(appdata)

    return os.path.join(appdata, relative)


def slash():
    if sys.platform.lower() == 'Darwin' or sys.platform.lower() == 'mac':
        return '/'
    elif 'win' in sys.platform:
        return '\\'