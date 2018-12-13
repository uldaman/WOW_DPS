import pyHook
import pythoncom
import win32com.client

dm = win32com.client.Dispatch('dm.dmsoft')


def press(key):
    dm.KeyPressChar(key)


def on_key_down_event(event):
    if event.WindowName == "魔兽世界":
        if event.Key == "Q":
            for _ in range(4):
                press("~")
    return True


def main():
    hookMgr = pyHook.HookManager()
    hookMgr.KeyDown = on_key_down_event
    hookMgr.HookKeyboard()
    pythoncom.PumpMessages()


if __name__ == '__main__':
    main()
