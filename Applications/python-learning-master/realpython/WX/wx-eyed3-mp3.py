# https://realpython.com/python-gui-with-wxpython/#sizers-dynamic-sizing

import wx
import eyed3 # python tool for working with audio files
import glob #glob 3 for python - ~~pip install glob3~~ # pathnames

# Creating classes for this project
class Mp3Panel(wx.Panel): # Create user interface (UI), subclass wx.Panel
    def __init__(self, parent):
        super().__init__(parent)
        main_sizer = wx.BoxSizer(wx.VERTICAL)
        self.row_obj_dict = {} # dictionary for data (store) about MP3 files

        self.list_ctrl = wx.ListCtrl(
            self, size=(-1, 100), 
            style=wx.LC_REPORT | wx.BORDER_SUNKEN # sunken border (FLAG!!). # List report control (ctrl) - stores lists in formats
        )
        self.list_ctrl.InsertColumn(0, 'Artist', width=140) # this needs to be inserted for each header, so that the list (list ctrl) has the correct headers
        self.list_ctrl.InsertColumn(1, 'Album', width=140) # Supply index of list - 0,1,2,3,etc
        self.list_ctrl.InsertColumn(2, 'Title', width=200)
        main_sizer.Add(self.list_ctrl, 0, wx.ALL | wx.EXPAND, 5)        
        edit_button = wx.Button(self, label='Edit') # edit button for editing tags
        edit_button.Bind(wx.EVT_BUTTON, self.on_edit) # event handler - binds the edit button
        main_sizer.Add(edit_button, 0, wx.ALL | wx.CENTER, 5)        
        self.SetSizer(main_sizer)

    def on_edit(self, event):
        print('in on_edit')

    def update_mp3_listing(self, folder_path):
        print(folder_path)

# Code for the frame

class Mp3Frame(wx.Frame):
    def __init__(self):
        super().__init__(parent=None,
                        title="Mp3 Tag Editor") # Window/Frame caption/title        
        self.panel = Mp3Panel(self)
        self.Show()

if __name__ == '__main__':
    app = wx.App(False)
    frame = Mp3Frame()
    app.MainLoop()