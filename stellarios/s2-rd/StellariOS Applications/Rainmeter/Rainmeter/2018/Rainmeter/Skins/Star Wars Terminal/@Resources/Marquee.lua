--LuaMarquee v5.2 by Smurfier (smurfier20@gmail.com)
--This work is licensed under a Creative Commons Attribution-Noncommercial-Share Alike 3.0 License.

PROPERTIES =
{
Text = "Input Error!";
MeasureName = "";
Variable = "";
Width = 10;
NumOfMeasures = 1;
Delimiter = "  ";
ScrollMode=2;
AutoReset = 1;
StartPosition = "Left";
}

function Initialize()
print("Running LuaMarquee v5.2")
if PROPERTIES.MeasureName ~= "" then
   iMeasureCount = tonumber(PROPERTIES.NumOfMeasures)
   if iMeasureCount > 1 then
      local sMeasurePrefix = PROPERTIES.MeasureName
      tMeasures = {}
      for i = 1, iMeasureCount do
         tMeasures[i] = SKIN:GetMeasure(sMeasurePrefix..i)
      end   
   else
      Measure = SKIN:GetMeasure(PROPERTIES.MeasureName)
   end
elseif PROPERTIES.Variable == "" then
   Text = PROPERTIES.Text
end
Width,ScrollMode = tonumber(PROPERTIES.Width),tonumber(PROPERTIES.ScrollMode)
Value,OldText = "",""
Timer,End,Int,Pause = 1,0,1,0
end -- function Initialize

function Update()
   if PROPERTIES.MeasureName ~= "" then
      if iMeasureCount > 1 then
         Text = tMeasures[1]:GetStringValue()
         for i=2, iMeasureCount do Text = Text..PROPERTIES.Delimiter..tMeasures[i]:GetStringValue() end
      else
         Text = Measure:GetStringValue()
      end
   elseif PROPERTIES.Variable ~= "" then
      Text = SKIN:GetVariable(PROPERTIES.Variable)
   end
   
   if Text ~= OldText and tonumber(PROPERTIES.AutoReset)==1 then Timer=0 end
   OldText = Text
   
   Length = string.len(Text)
   Int = (Length<=Width and ScrollMode==2) and 0 or 1
   Text2 = Text
   if Int==1 then
      for a=1, Width do
      Text2 = " "..Text2
      end
      Length = Length + Width
   end
   
   if PROPERTIES.StartPosition == "Left" and Int==1 then
   Text2=Text..Text2
   end

   End = Timer + Width
   Value = string.sub(Text2, Timer , End)
   Timer = Timer % Length + (Int*(Pause==1 and 0 or 1))
   return Value
end -- function Update

function TogglePause()
Pause = (Pause==1 and 0 or 1)
end