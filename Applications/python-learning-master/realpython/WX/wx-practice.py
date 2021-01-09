# https://realpython.com/python-gui-with-wxpython/
import wx

class MyFrame(wx.Frame):    
    def __init__(self):
        super().__init__(parent=None, title='Hello World')
        self.Show()
        panel = wx.Panel(self) # panels are REQUIRED for WINDOWS
        my_sizer = wx.BoxSizer(wx.VERTICAL) # box sizer for absolute positioning & resizing windows/widgets. # Sizers are used to control & define the layout of controls in dialogues. laying out subwindows

        self.text_ctrl = wx.TextCtrl(panel, pos=(5, 5)) # text control - allows text to be created & edited - processes user input & displays units of data - base class for control or widget
        my_sizer.Add(self.text_ctrl, 0, wx.ALL | wx.EXPAND, 5) # wx.EXPAND makes widget expand as much as it can within the sizer; # wx.ALL says you want borders on all sides of the sizer. Using wx.CENTER would center the button on-screen
        my_btn = wx.Button(panel, label='Press Me', pos=(5, 55)) # creates button with wxPython library, label "Press Me". Where to place the button widget (pos function). This is called ABSOLUTE POSITIONING        
        my_btn.Bind(wx.EVT_BUTTON, self.on_press) # .Bind() takes the event you want to bind to, the handler to call when the event happens, an optional source, and a couple of optional ids.
        my_sizer.Add(my_btn, 0, wx.ALL | wx.CENTER, 5)
        panel.SetSizer(my_sizer)
        self.Show() # from lines 11-16 (from self.text_ctrl to now (self.Show()), this resizes the text box in "Press Me")

    def on_press(self, event):
        value = self.text_ctrl.GetValue() # gets value entered in text box when button "Press Me" is pressed
        if not value:
            print("You didn't enter anything")
        else:
            print(f'You typed: "{value}"')            

if __name__ == '__main__': 
    app = wx.App()
    frame = MyFrame()
    app.MainLoop() # main loop for app - waits for events to occur and then executes what's in the loop       

"""
Box Sizers:
1. Window: the widget
2. Proportion: sets how much space relative to other widgets this widget should take (in the window/application)
3. Flag: Pipe character (|) - can use multiple flags - specify alignment (see wx.ALL)
4. Border: how many pixels of border you want around the widget/sizer
5. userData: complex sizing of widget/sizer
"""

"""
Event Bindings:
Widgets can have event bindings attached so they can respond to certain events
"""

"""
app = wx.App() # Creates & Intializes an app
frame = wx.Frame(parent=None, title="Hello World") # app window with title/caption "Hello World"
frame.Show() # displays frame
app.MainLoop() # main loop for app - waits for events to occur and then executes what's in the loop
"""