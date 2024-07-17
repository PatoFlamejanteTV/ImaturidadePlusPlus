#before hand: # https://raw.githubusercontent.com/Vyndorix/GDI_EFFECTS_IN_PYTHON/main/GDI_EFFECTS_IN_PYTHON.py
import win32gui
import win32api
import win32con
import time
import math
from win32gui import *
from win32api import *
from win32ui import *
from win32con import *
from random import *
from numba import *
import ctypes
from random import *
import os

desk = GetDC(0) # https://stackoverflow.com/questions/71288956/different-color-text-with-drawtext-in-python

x = GetSystemMetrics(0)
y = GetSystemMetrics(1)

text = 'EU SEMPRE VOLTAREI, EU SEMPRE ESTAREI DE VOLTA' # trolada meneira hihihihi

SetTextColor(desk, 255)
SetBkColor(desk, 0)
for i in range(2500):
    DrawText(desk, text, len(text), (randrange(x), randrange(y), randrange(x), randrange(y)), DT_LEFT)
    
for i in range(6):
    desktop_window_id = 0
    desktop_dc = win32gui.GetDC(desktop_window_id)
    screen_width = win32api.GetSystemMetrics(win32con.SM_CXSCREEN)
    screen_height = win32api.GetSystemMetrics(win32con.SM_CYSCREEN)
    win32gui.StretchBlt(desktop_dc, 0, 0, screen_width, screen_height, desktop_dc, 0, 0, screen_width, screen_height, win32con.NOTSRCCOPY)
    win32gui.BitBlt(desktop_dc, 0, 0, screen_width, screen_height, desktop_dc, 0, 0, win32con.NOTSRCCOPY)
    win32gui.ReleaseDC(desktop_window_id, desktop_dc)
    time.sleep(0.01)

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
            win32gui.BitBlt(hdc, 0, ((i) * 80), sw, randrange(200), hdc, a, ((i) * 80), win32con.SRCCOPY)
            angle += 1
        win32gui.ReleaseDC(desktop, hdc)
        #time.sleep(0.01)

if __name__ == '__main__':
    sines()
