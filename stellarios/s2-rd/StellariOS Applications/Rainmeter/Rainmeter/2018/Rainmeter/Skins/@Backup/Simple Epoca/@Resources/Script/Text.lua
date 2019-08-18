function Initialize()

   inc = 1
   
end

function Update()

   allText = SELF:GetOption('TextToType')
   
   newText = string.sub(allText, 1, inc)
   SKIN:Bang('!SetOption', 'MeterTitle', 'Text', newText)
   
   inc = inc + 1
   if inc == string.len(allText) + 1 then inc = 1 end
   
end