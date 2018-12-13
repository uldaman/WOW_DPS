import time
import pyHook
import threading
import pythoncom
from .keypass import get_key_handler, KeyHandler


def on_key_down_event(event):
    if event.WindowName == "魔兽世界":
        get_key_handler(event.Key)(True)
    return True


def on_key_up_event(event):
    if event.WindowName == "魔兽世界":
        get_key_handler(event.Key)(False)
    return True


def key_down_loop():
    while True:
        KeyHandler.handle_key_down()
        time.sleep(1 / 16)


def main():
    threading.Thread(target=key_down_loop, name='key_down_loop').start()
    hookMgr = pyHook.HookManager()
    hookMgr.KeyDown = on_key_down_event
    hookMgr.KeyUp = on_key_up_event
    hookMgr.HookKeyboard()
    pythoncom.PumpMessages()


if __name__ == '__main__':
    main()
