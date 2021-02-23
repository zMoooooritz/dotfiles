#!/usr/bin/env python
import sys
import datetime
from pathlib import Path

# TODO add history
# TODO customizable output format

HOME = str(Path.home())
TRACKING_DIR = HOME + "/.local/share/tracker"
PREVIOUS = TRACKING_DIR + "/previous"
START = TRACKING_DIR + "/start"

try:
    open(PREVIOUS)
    open(START)
except FileNotFoundError:
    print("One or more of the following files do not exist:")
    print(" " + PREVIOUS)
    print(" " + START)
    sys.exit()


class Tracker:

    def start_tracking(self):
        write_content(START, now())
        write_content(PREVIOUS, 0)

    def reset_tracking(self):
        write_content(START, 0)
        write_content(PREVIOUS, 0)

    def pause_tracking(self):
        if (not self.is_active()):
            return
        active = self.get_active_time()
        prev = self.get_prev_time()
        prev_new = active + prev
        write_content(PREVIOUS, prev_new)
        write_content(START, 0)

    def unpause_tracking(self):
        if (self.is_active()):
            return
        write_content(START, now())

    def toggle_tracking(self):
        if (self.is_active()):
            self.pause_tracking()
        else:
            self.unpause_tracking()

    def print_current(self):
        time = secs_to_time(self.get_active_time() + self.get_prev_time())
        if (self.is_active()):
            print(time + "h")
        else:
            print('%{F#ffee00}' + time + "h" + '%{F-}')

    def is_active(self):
        return load_content(START) != "0"

    def get_active_time(self):
        s = load_content(START)
        time_now = now()
        try:
            start = datetime.datetime.strptime(s, '%Y-%m-%d %H:%M:%S')
        except ValueError:
            return 0
        diff = time_now - start
        return int(diff.total_seconds())

    def get_prev_time(self):
        secs = load_content(PREVIOUS)
        if not secs or not secs.isdigit():
            return 0
        return int(secs)


def load_content(path):
    try:
        file = open(path, "r")
    except FileNotFoundError:
        return 0
    content = file.read().strip()
    file.close()
    return content

def write_content(path, content):
    file = open(path, "w")
    file.write(str(content))
    file.close()

def now():
    return datetime.datetime.now().replace(microsecond=0)

def secs_to_time(seconds):
    minutes = int(seconds / 60)
    hours = str(int(minutes  / 60))
    mins = str(minutes % 60)
    return hours.zfill(2) + ":" + mins.zfill(2)

def print_usage():
    print(USAGE)

USAGE = """Usage: {} [options]
    start
    reset
    pause
    unpause
    toggle
    usage""".format(sys.argv[0].split("/")[-1])

if __name__ == '__main__':

    if (len(sys.argv) == 1):
        print_usage()
        sys.exit()

    cmd = sys.argv[1]
    t = Tracker()

    if (cmd == "start"):
        t.start_tracking()
    if (cmd == "reset"):
        t.reset_tracking()
    elif (cmd == "current"):
        t.print_current()
    elif (cmd == "pause"):
        t.pause_tracking()
    elif (cmd == "unpause"):
        t.unpause_tracking()
    elif (cmd == "toggle"):
        t.toggle_tracking()
    elif (cmd == "usage" or cmd == "help"):
        print_usage()
    else:
        pass

