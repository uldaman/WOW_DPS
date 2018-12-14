import pyHook
import threading
import pythoncom
from .qhandler import QHandler

handler = QHandler("魔兽世界", 4)


def main():
    threading.Thread(target=handler.handle_loop, name='key_down_loop').start()
    hookMgr = pyHook.HookManager()
    hookMgr.KeyDown = handler.on_key_down_event
    hookMgr.KeyUp = handler.on_key_up_event
    hookMgr.HookKeyboard()
    pythoncom.PumpMessages()


if __name__ == '__main__':
    main()
