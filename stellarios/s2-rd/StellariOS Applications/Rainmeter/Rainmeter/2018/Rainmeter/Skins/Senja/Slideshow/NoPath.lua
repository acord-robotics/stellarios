ROPERTIES =
{

}

function Initialize()

   MeterToUpdate = tolua.cast(SKIN:GetMeter("MeterImageName"), "CMeterString")
   MeasureImageName = SKIN:GetMeasure("Random")

end -- function Initialize

function Update()

   FullImageName = MeasureImageName:GetStringValue()

   Path, ImageName, Extension = string.match(FullImageName, "(.-)([^\\]-([^%.]+))$")
   
   MeterToUpdate:SetText(ImageName)
   
end -- function Update

function GetStringValue()

   return ImageName
   
end -- function GetStringValue