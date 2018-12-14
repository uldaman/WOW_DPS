import time
from .keypass import hitPress


class QHandler(object):

    def __init__(self, window_name, loop_count):
        self.q_down = False
        self.window_name = window_name
        self.loop_count = loop_count * (loop_count + 1) / 2

    def handle_loop(self):
        while True:
            if self.q_down:
                hitPress("~", self.loop_count)
            time.sleep(1 / 16)

    def on_key_down_event(self, event):
        if event.Key == "Q" and event.WindowName == self.window_name:
            self.q_down = True
        return True

    def on_key_up_event(self, event):
        if event.Key == "Q" and event.WindowName == self.window_name:
            self.q_down = False
        return True
