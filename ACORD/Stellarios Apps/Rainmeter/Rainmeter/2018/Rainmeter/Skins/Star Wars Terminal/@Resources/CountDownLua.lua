PROPERTIES = {year=0, month=0, day=0, hour=0, minute=0, second=0}

function Initialize()

	stringDate = tolua.cast(SKIN:GetMeter("Date"), "CMeterString")
	stringHour = tolua.cast(SKIN:GetMeter("Hour"), "CMeterString")
	stringMinute = tolua.cast(SKIN:GetMeter("Minute"), "CMeterString")
	stringSecond = tolua.cast(SKIN:GetMeter("Second"), "CMeterString")

end -- function Initialize


function Update()
	
	local rLeft = os.time(PROPERTIES) - os.time()
	local dLeft = math.floor(rLeft/60/60/24)
	local hLeft = math.floor(rLeft/60/60)%24
	local mLeft = math.floor(rLeft/60)%60
	local sLeft = math.floor(rLeft)%60
	
	stringDate:SetText(dLeft)
	stringHour:SetText(hLeft)
	stringMinute:SetText(mLeft)
	stringSecond:SetText(sLeft)


end -- function Update