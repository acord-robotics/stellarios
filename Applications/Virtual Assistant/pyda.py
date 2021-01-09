import wikipedia
import wx
import wolframalpha

class MyFrame(wx.Frame):
    def __init__(self):
        wx.Frame.__init__(self, None,
            pos=wx.DefaultPosition, size=wx.Size(450, 100),
            style=wx.MINIMIZE_BOX | wx.SYSTEM_MENU | wx.CAPTION |
             wx.CLOSE_BOX | wx.CLIP_CHILDREN,
            title="PyDA by ACORD")
        panel = wx.Panel(self)
        my_sizer = wx.BoxSizer(wx.VERTICAL)
        lbl = wx.StaticText(panel,
        label="Hello, I am PyDA, the Python Digital Assistant. How can I help?")
        my_sizer.Add(lbl, 0, wx.ALL, 5)
        self.txt = wx.TextCtrl(panel, style=wx.TE_PROCESS_ENTER,size=(400,300))
        self.txt.SetFocus()
        self.txt.Bind(wx.EVT_TEXT_ENTER, self.OnEnter)
        my_sizer.Add(self.txt, 0, wx.ALL, 5)
        panel.SetSizer(my_sizer)
        self.Show()

    def OnEnter(self, event):
        input = self.txt.GetValue()        
        input = input.lower()
        try:
            #wolframalpha
            app_id = "8A6LA2-ELRHR92Y88"
            client = wolframalpha.client(app_id)
            result = client.query(input)
            answer = next(result.results).text
            print(answer)
        except:
            #wikipedia
            """
            # Code for input splitting - I'll leave that alone for now. Currently you can't type in "who is ____", you can only type in "_____"
            input = input.split(" ")
            input = "".join(input[2:])
            """
            print(wikipedia.summary(input))

if __name__ == "__main__":
    app = wx.App(True)
    frame = MyFrame()
    app.MainLoop()