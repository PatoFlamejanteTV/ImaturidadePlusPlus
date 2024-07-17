import win32api
import win32con
import win32gui
import math
import time
from random import *
import os

os.system('mode con lines=15 cols=15')

def sines(): # https://github.com/Leo-Aqua/Python-gdi-repo/blob/main/GDI%20effects/Waves/waves.py
    desktop = win32gui.GetDesktopWindow()
    hdc = win32gui.GetWindowDC(desktop)
    sw = win32api.GetSystemMetrics(0)
    sh = win32api.GetSystemMetrics(1)
    angle = 0

    while True:
        hdc = win32gui.GetWindowDC(desktop)
        for i in range(int(sw + sh)):
            a = int(math.sin(angle) * randrange(20))
            win32gui.BitBlt(hdc, 0, ((i) * 40), sw, randrange(200), hdc, a, ((i) * 40), win32con.SRCCOPY)
            angle += 1
        win32gui.ReleaseDC(desktop, hdc)
        #time.sleep(0.01)

if __name__ == '__main__':
    sines()
