import win32com.client

dm = win32com.client.Dispatch('dm.dmsoft')


def key_down(key):
    dm.KeyDownChar(key)


def key_up(key):
    dm.KeyUpChar(key)


def press(key):
    dm.KeyPressChar(key)


def hitPress(key, count):
    if count <= 0:
        return
    dm.KeyPressChar(key)
    return hitPress(key, count - 1)


def hotkey(control, key):
    """hot_key_char('shift', '2') => @
    """
    dm.KeyDownChar(control)
    dm.KeyDownChar(key)
    dm.KeyUpChar(key)
    dm.KeyUpChar(control)
