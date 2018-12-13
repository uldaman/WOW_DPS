import win32com.client

dm = win32com.client.Dispatch('dm.dmsoft')


def key_down(key):
    dm.KeyDownChar(key)


def key_up(key):
    dm.KeyUpChar(key)


def press(key):
    dm.KeyPressChar(key)


def hotkey(control, key):
    """hot_key_char('shift', '2') => @
    """
    dm.KeyDownChar(control)
    dm.KeyDownChar(key)
    dm.KeyUpChar(key)
    dm.KeyUpChar(control)


class KeyHandler(object):
    q_down = False

    @classmethod
    def handl_q(cls, is_down):
        cls.q_down = is_down

    @classmethod
    def handle_key_down(cls):
        if cls.q_down:
            press("~")


def get_key_handler(key_vk):
    return _key_handler.get(key_vk, lambda x: None)


_key_handler = {
    "Q": KeyHandler.handl_q,
}
