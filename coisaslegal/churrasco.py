#before hand: # https://raw.githubusercontent.com/Vyndorix/GDI_EFFECTS_IN_PYTHON/main/GDI_EFFECTS_IN_PYTHON.py
import os
from random import *
import time
import math
import win32gui
import win32api
import win32con
from win32gui import *
from win32api import *
from win32ui import *
from win32con import *
from numba import *
import ctypes
from random import *


desk = GetDC(0) # https://stackoverflow.com/questions/71288956/different-color-text-with-drawtext-in-python

x = GetSystemMetrics(0)
y = GetSystemMetrics(1)

cu = 'Voce lembra de mim?' # trolada meneira hihihihi

SetTextColor(desk, 255)
SetBkColor(desk, 0)
for i in range(2500):
    DrawText(desk, cu, len(cu), (randrange(x), randrange(y), randrange(x), randrange(y)), DT_LEFT)
    
for i in range(6):
    desktop_window_id = 0
    desktop_dc = win32gui.GetDC(desktop_window_id)
    screen_width = win32api.GetSystemMetrics(win32con.SM_CXSCREEN)
    screen_height = win32api.GetSystemMetrics(win32con.SM_CYSCREEN)
    win32gui.StretchBlt(desktop_dc, 0, 0, screen_width, screen_height, desktop_dc, 0, 0, screen_width, screen_height, win32con.NOTSRCCOPY)
    win32gui.BitBlt(desktop_dc, 0, 0, screen_width, screen_height, desktop_dc, 0, 0, win32con.NOTSRCCOPY)
    win32gui.ReleaseDC(desktop_window_id, desktop_dc)
    time.sleep(0.01)

