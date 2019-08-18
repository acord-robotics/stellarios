function Initialize()
	ColorScreenColorPickerBoxHue = SKIN:GetMeter("ColorScreen.ColorPickerBox.Hue")
	ColorScreenColorPickerBoxColor = SKIN:GetMeter("ColorScreen.ColorPickerBox.Color")
	hprecent = 0
	globala  = 255
	globalab = false
	globalh  = 360
	globals  = 1
	globalv  = 1
	globalx  = 100
	globaly  = 0
	globalshowalpha = "false"
	globaleditnum = nil

	compareside         = nil
	comparedefaultside  = nil
	comparedefaultcolor = nil
	compareshowalpha    = nil
	compareposx         = nil 
	compareposy         = nil
	compareoffset       = nil

	--Draw()
end

function Execute(num)
	if num ~= nil then
		globaleditnum = num
		local side = SKIN:GetVariable('ColorPicker.Side'..num,'left')
		local face = SKIN:GetVariable('ColorPicker.Face'..num,'swatches')
		local defaultcolor = SKIN:GetVariable('ColorPicker.StartColor'..num,'0,0,0')
		local defaultcolorvar = SKIN:GetVariable('ColorPicker.StartColorVar'..num)
		local showalpha = SKIN:GetVariable('ColorPicker.Alpha'..num,'false')
		local postable = {}
		local posvar = SKIN:GetVariable('ColorPicker.Pos'..num)
		local relposvar = SKIN:GetVariable('ColorPicker.RPos'..num)
		if posvar ~= nil and posvar ~= '' then
			for val in posvar:gmatch('[^,]+') do
				table.insert(postable,tonumber(SKIN:ParseFormula(val))) 
			end
		end 
		local posx = postable[1]
		local posy = postable[2]
		local offset = postable[3]
		if face ~= 'swatches' and face ~= 'picker' then
			face = 'swatches'
		end 
		if offset == nil then
			offset = 0 
		end
		if defaultcolorvar ~= "" and defaultcolorvar ~= nil then
			defaultcolor = SKIN:GetVariable(defaultcolorvar)
		end
		if relposvar ~= "" and relposvar ~= nil then
			local vartable = {}
			for val in relposvar:gmatch('[^,]+') do
				table.insert(vartable,val)
			end
			local metername = vartable[1]
			local offsetr = vartable[2]
			local meter = SKIN:GetMeter(metername)
			if side == "left" then
				posx = ((tonumber(meter:GetX()))-2)
				posy = (tonumber(meter:GetY())+(tonumber(meter:GetH())/2))
			elseif side == "right" then
				posx = (tonumber(meter:GetX())+(tonumber(meter:GetW()))+1)
				posy = (tonumber(meter:GetY())+(tonumber(meter:GetH())/2))
			elseif side == "top" then
				posx = (tonumber(meter:GetX())+(tonumber(meter:GetW())/2))
				posy = ((tonumber(meter:GetY()))-1)
			elseif side == "bottom" then
				posx = (tonumber(meter:GetX())+(tonumber(meter:GetW())/2))
				posy = (tonumber(meter:GetY())+(tonumber(meter:GetH()))+1)
			end
			offset = offsetr
		end
		if posx == nil or posy == nil or offset == nil then
			print('Color Picker: Error, the position variable was not set... Please set "ColorPicker.Pos" to x,y,offset or ColorPicker.RPos to the name of a meter,offset')
			return
		end
		PromptColor(side,face,defaultcolor,showalpha,posx,posy,offset)
	end
end

function PromptColor(side,defaultside,defaultcolor,showalpha,posx,posy,offset)
	if side == nil or defaultside == nil or defaultcolor == nil or showalpha == nil or posx == nil or posy == nil or offset == nil then
		return
	elseif side ~= compareside or defaultside ~= comparedefaultside or defaultcolor ~= comparedefaultcolor or showalpha ~= compareshowalpha or posx ~= compareposx or posy ~= compareposy or offset ~= compareoffset then
		compareside,comparedefaultside,comparedefaultcolor,compareshowalpha,compareposx,compareposy,compareoffset = side,defaultside,defaultcolor,showalpha,posx,posy,offset
		globalshowalpha   = showalpha
		local arrowname   = nil
		local arrowx      = nil
		local arrowy      = nil
		local boxx        = nil
		local boxy        = nil
		local anix        = nil
		local aniy        = nil
		local baseoffset  = nil
		local boxoffsetx  = nil
		local boxoffsety  = nil
		local rgbinputvalues = {}
		for val in defaultcolor:gmatch('[^,]+') do
			table.insert(rgbinputvalues,tonumber(val))
		end

		if table.getn(rgbinputvalues) == 3 then
			R,G,B = rgbinputvalues[1],rgbinputvalues[2],rgbinputvalues[3]
			globala = 255
			globalab = false
		elseif table.getn(rgbinputvalues) == 4 then
			R,G,B,globala = rgbinputvalues[1],rgbinputvalues[2],rgbinputvalues[3],rgbinputvalues[4]
			globalab = true
		else
			print("Color.Framework Error: The the rgb string was passed incorrectly to the promt function")
			return
		end 

		if tonumber(offset) < 0 then
			offset = 0
		elseif side == "left" or side == "right" then
			if tonumber(offset) > 227 then
				offset = 245
			end
		elseif side == "top" or side == "bottom" then
			if tonumber(offset) > 350 then
				offset = 370
			end
		end
		
		if side == "right" then
			arrowname = "#SKINSPATH#\\NXT-OS\\@Resources\\Images\\Pop_Box_Arrow_Left.png"
			arrowx = (posx)
			arrowy = (posy-16)
			boxy   = ((posy-24)-offset)
			boxx   = (posx+10)
			anix   = (posx+23)
			aniy   = ((posy+15)-offset)
		elseif side == "left" then
			arrowname = "#SKINSPATH#\\NXT-OS\\@Resources\\Images\\Pop_Box_Arrow_Right.png"
			arrowx = (posx-15)
			arrowy = (posy-16)
			boxy   = ((posy-24)-offset)
			boxx   = (posx-423)
			anix   = (posx-410)
			aniy   = ((posy+15)-offset)
		elseif side == "bottom" then
			arrowname = "#SKINSPATH#\\NXT-OS\\@Resources\\Images\\Pop_Box_Arrow_Up.png"
			arrowx = (posx-16)
			arrowy = (posy)
			boxy   = (posy+9)
			boxx   = ((posx-24)-offset)
			anix   = ((posx-11)-offset)
			aniy   = (posy+48)
		elseif side == "top" then
			arrowname = "#SKINSPATH#\\NXT-OS\\@Resources\\Images\\Pop_Box_Arrow_Down.png"
			arrowx = (posx-16)
			arrowy = (posy-16)
			boxy   = (posy-303)
			boxx   = ((posx-24)-offset)
			anix   = ((posx-11)-offset)
			aniy   = (posy-264)
		end
		SKIN:Bang("!MoveMeter",arrowx,arrowy,"ColorScreen.BoxArrow")
		SKIN:Bang("!MoveMeter",boxx,boxy,"Colorscreen.Background")
		SKIN:Bang("!MoveMeter",anix,aniy,"Colorscreen.FlipAnimation")
		SKIN:Bang("!SetOption","ColorScreen.BoxArrow","ImageName",arrowname)
		SKIN:Bang("!Showmetergroup","ColorScreenBase")
		if defaultside == "picker" then
			switchtochoose()
		elseif defaultside == "swatches" then
			local check = drawswatches(R,G,B)
			if check == 0 then 
				switchtochoose()
			else
				switchtoswatch()
			end
		end
	end
end

function finish()
	compareside         = nil
	comparedefaultside  = nil
	comparedefaultcolor = nil
	compareshowalpha    = nil
	compareposx         = nil 
	compareposy         = nil
	compareoffset       = nil
	local finalrgb      = nil
 	if globalab or globala ~= 255 then
 		finalrgb = R..","..G..","..B..","..globala
 	else
 		finalrgb = R..","..G..","..B
 	end
 	local finishcommands = string.gsub(SKIN:GetVariable("ColorPicker.Bangs"..globaleditnum),"%$ColorPicker.Output%$",finalrgb)
 	SKIN:Bang('!SetOptionGroup','ColorScreenSwatchesSelectors','ImageName', "#SKINSPATH#NXT-OS\\@Resources\\Images\\blank.png")
 	SKIN:Bang("!Hidemetergroup","ColorScreenFull")
 	SKIN:Bang("!Update")
 	SKIN:Bang(finishcommands)
end 

function cancel()
	compareside         = nil
	comparedefaultside  = nil
	comparedefaultcolor = nil
	compareshowalpha    = nil
	compareposx         = nil 
	compareposy         = nil
	compareoffset       = nil
	SKIN:Bang("!Hidemetergroup","ColorScreenFull")
 	SKIN:Bang("!Redraw")
end 

function setcolor(r,g,b)
	R,G,B = r,g,b
end

function switchtochoose()
	if globalshowalpha == "true" then
		SKIN:Bang("!Showmetergroup","ColorScreenChooseAlpha")
	else 
		SKIN:Bang("!Hidemetergroup","ColorScreenChooseAlpha")
	end
	SKIN:Bang("!Hidemetergroup","ColorScreenSwatches")
	SKIN:Bang("!Showmetergroup","ColorScreenChoose")
	DrawFromRgb(R,G,B)
end

function switchtoswatch()
	drawswatches(R,G,B)
	SKIN:Bang("!Hidemetergroup","ColorScreenChooseAlpha")
	SKIN:Bang("!Hidemetergroup","ColorScreenChoose")
	SKIN:Bang("!Showmetergroup","ColorScreenSwatches")
	SKIN:Bang("!Update")
end

function drawswatches(r,g,b)
	local r,g,b = tonumber(r),tonumber(g),tonumber(b)
	R,G,B = r,g,b
	local swatchindex = 0
	-- Red swatch selectors
	if r == 230 and g == 119 and b == 119 then
		swatchindex = 1
	elseif r == 255 and g == 66 and b == 66 then
		swatchindex = 2
	elseif r == 255 and g == 20 and b == 20 then
		swatchindex = 3
	elseif r == 191 and g == 0 and b == 0 then
		swatchindex = 4
	-- Orange swatch selectors 
	elseif r == 230 and g == 156 and b == 119 then
		swatchindex = 5
	elseif r == 255 and g == 129 and b == 66 then
		swatchindex = 6
	elseif r == 255 and g == 98 and b == 20 then
		swatchindex = 7
	elseif r == 191 and g == 63 and b == 0 then
		swatchindex = 8
	-- Yellow swatch selectors
	elseif r == 230 and g == 204 and b == 119 then
		swatchindex = 9
	elseif r == 255 and g == 211 and b == 66 then
		swatchindex = 10
	elseif r == 255 and g == 200 and b == 20 then
		swatchindex = 11
	elseif r == 191 and g == 145 and b == 0 then
		swatchindex = 12
	-- Green swatch selectors
	elseif r == 140 and g == 213 and b == 136 then
		swatchindex = 13
	elseif r == 102 and g == 226 and b == 95 then
		swatchindex = 14
	elseif r == 64 and g == 218 and b == 56 then
		swatchindex = 15
	elseif r == 36 and g == 161 and b == 29 then
		swatchindex = 16
	-- Blue swatch selectors
	elseif r == 119 and g == 169 and b == 230 then
		swatchindex = 17
	elseif r == 66 and g == 151 and b == 255 then
		swatchindex = 18
	elseif r == 20 and g == 126 and b == 255 then
		swatchindex = 19
	elseif r == 0 and g == 86 and b == 191 then
		swatchindex = 20
	-- Purple swatch selectors
	elseif r == 171 and g == 119 and b == 230 then
		swatchindex = 21
	elseif r == 154 and g == 66 and b == 255 then
		swatchindex = 22
	elseif r == 129 and g == 20 and b == 255 then
		swatchindex = 23
	elseif r == 89 and g == 0 and b == 191 then
		swatchindex = 24
	-- Grey swatch selectors
	elseif r == 255 and g == 255 and b == 255 then
		swatchindex = 25
	elseif r == 80 and g == 80 and b == 80 then
		swatchindex = 26
	elseif r == 30 and g == 30 and b == 30 then
		swatchindex = 27
	elseif r == 0 and g == 0 and b == 0 then
		swatchindex = 28
	else
		swatchindex = 0
	end
	SKIN:Bang('!SetOptionGroup','ColorScreenSwatchesSelectors','ImageName', "#SKINSPATH#NXT-OS\\@Resources\\Images\\blank.png")
	if swatchindex ~= 0 then
		SKIN:Bang("!SetOption","ColorScreen.Swatch."..swatchindex,"Imagename","#SKINSPATH#NXT-OS\\@Resources\\Images\\Swatch_Check.png")
	end
	SKIN:Bang("!Update")
	return swatchindex
end

function Draw()
	local R,G,B = rgb(globalh,globals,globalv)
	SKIN:Bang("!SetOption","ColorScreen.ColorPickerBox.Hue.Indicator","X",(ColorScreenColorPickerBoxHue:GetX()-3))
	SKIN:Bang("!SetOption","ColorScreen.ColorPickerBox.Hue.Indicator","Y",math.floor((ColorScreenColorPickerBoxHue:GetY()+((hprecent)/100)*199)-3))
	SKIN:Bang("!SetOption","ColorScreen.ColorPickerBox.Color.Indicator","X",math.floor((ColorScreenColorPickerBoxColor:GetX()-4)+((globalx/100)*199))   )
	SKIN:Bang("!SetOption","ColorScreen.ColorPickerBox.Color.Indicator","Y",math.floor((ColorScreenColorPickerBoxColor:GetY()-4)+((globaly/100)*199))   )
	SKIN:Bang("!SetVariable","ColorScreen.Current.Red",R)
	SKIN:Bang("!SetVariable","ColorScreen.Current.Green",G)
	SKIN:Bang("!SetVariable","ColorScreen.Current.Blue",B)
	SKIN:Bang("!SetVariable","ColorScreen.Current.Alpha",globala)
	if gloabla == 255 then
		SKIN:Bang("!SetOption","ColorScreen.PreviewColor","SolidColor",R..","..G..","..B)
	else
		SKIN:Bang("!SetOption","ColorScreen.PreviewColor","SolidColor",R..","..G..","..B..","..globala)
	end
	SKIN:Bang("!Update")
end

function DrawFromRgb(r,g,b)
	local h,s,v = hsv(r,g,b)
	local bR,bG,bB = rgb(h,1,1)
	globalh = h
	R,G,B = r,g,b
	hprecent = (((360-h)/360)*100)
	globalx = (s*100)
	globaly = ((1-v)*100)
	globals = s
	globalv = v
	SKIN:Bang("!SetOption","ColorScreen.ColorPickerBox.Color","SolidColor",bR..","..bG..","..bB)
	SKIN:Bang("!SetOption","ColorScreen.ColorPickerBox.Hue.Indicator","X",(ColorScreenColorPickerBoxHue:GetX()-3))
	SKIN:Bang("!SetOption","ColorScreen.ColorPickerBox.Hue.Indicator","Y",math.floor((ColorScreenColorPickerBoxHue:GetY()+(((360-h)/360)*199)-3)))
	SKIN:Bang("!SetOption","ColorScreen.ColorPickerBox.Color.Indicator","X",math.floor((ColorScreenColorPickerBoxColor:GetX()-4)+(s*199))   )
	SKIN:Bang("!SetOption","ColorScreen.ColorPickerBox.Color.Indicator","Y",math.floor((ColorScreenColorPickerBoxColor:GetY()-4)+((1-v)*199))   )
	SKIN:Bang("!SetVariable","ColorScreen.Current.Red",r)
	SKIN:Bang("!SetVariable","ColorScreen.Current.Green",g)
	SKIN:Bang("!SetVariable","ColorScreen.Current.Blue",b)
	SKIN:Bang("!SetVariable","ColorScreen.Current.Alpha",globala)
	if gloabla == 255 then
		SKIN:Bang("!SetOption","ColorScreen.PreviewColor","SolidColor",r..","..g..","..b)
	else
		SKIN:Bang("!SetOption","ColorScreen.PreviewColor","SolidColor",r..","..g..","..b..","..globala)
	end
	SKIN:Bang("!Update")
end

function Adjust(c,d)
	if c == "r" then
		if d == "down" then
			if R == 0 then
				R = 255
			else
				R = (R-1)
			end
		elseif d == "up" then
			if R == 255 then
				R = 0
			else
				R = (R+1)
			end
		end
		if tonumber(d) then
			R = tonumber(d)
			if R < 1 then 
				R = 0
			elseif R > 255 then
				R = 255
			end
		end
	elseif c == "g" then
		if d == "down" then
			if G == 0 then
				G = 255
			else
				G = (G-1)
			end
		elseif d == "up" then
			if G == 255 then
				G = 0
			else
				G = (G+1)
			end
		end
		if tonumber(d) then
			G = tonumber(d)
			if G < 1 then 
				G = 0
			elseif G > 255 then
				G = 255
			end
		end
	elseif c == "b" then
		if d == "down" then
			if B == 0 then
				B = 255
			else
				B = (B-1)
			end
		elseif d == "up" then
			if B == 255 then
				B = 0
			else
				B = (B+1)
			end
		end
		if tonumber(d) then
			B = tonumber(d)
			if B < 1 then 
				B = 0
			elseif B > 255 then
				B = 255
			end
		end
	elseif c == "a" then
		if d == "down" then
			if globala == 0 then
				globala = 255
			else
				globala = (globala-1)
			end
		elseif d == "up" then
			if globala == 255 then
				globala = 0
			else
				globala = (globala+1)
			end
		end
		if tonumber(d) then
			globala = tonumber(d)
			if globala < 1 then 
				globala = 0
			elseif globala > 255 then
				globala = 255
			end
		end
	end
	DrawFromRgb(R,G,B)
end

function SetHue(precent)
	hprecent = (precent/2)
	globalh = math.floor(((200-precent)/200)*360)
	local R,G,B = rgb(globalh,1,1)
	SKIN:Bang("!SetOption","ColorScreen.ColorPickerBox.Color","SolidColor",R..","..G..","..B)
	Draw()
end

function rgb(h,s,v)
	local C = (v*s)
	local Hi = (h/60)
	local X = C*(1-math.abs((Hi%2)-1))
	local M = (v-C)
	local R1 = nil
	local G1 = nil
	local B1 = nil
	if Hi >= 0 and Hi < 1 then
		R1 = C
		G1 = X
		B1 = 0
	elseif Hi >= 1 and Hi < 2 then
		R1 = X
		G1 = C
		B1 = 0
	elseif Hi >= 2 and Hi < 3 then
		R1 = 0
		G1 = C
		B1 = X
	elseif Hi >= 3 and Hi < 4 then
		R1 = 0
		G1 = X
		B1 = C
	elseif Hi >= 4 and Hi < 5 then
		R1 = X
		G1 = 0
		B1 = C
	elseif Hi >= 5 and Hi < 6 then
		R1 = C
		G1 = 0
		B1 = X
	elseif Hi == 6 then
		R1 = C
		G1 = 0
		B1 = X
	end
	R = math.floor((R1+M)*255)
	G = math.floor((G1+M)*255)
	B = math.floor((B1+M)*255)
	return R,G,B
end

function hsv(r,g,b)
	local Ri = (r/255)
	local Gi = (g/255)
	local Bi = (b/255)
	local Cmax = math.max(Ri,Gi,Bi)
	local Cmin = math.min(Ri,Gi,Bi)
	local D = (Cmax-Cmin)
	local V = Cmax
	local H = nil
	local S = nil
	if D == 0 then
		H = 0
	elseif Cmax == Ri then
		H = (60*(((Gi-Bi)/D)%6))
	elseif Cmax == Gi then
		H = (60*(((Bi-Ri)/D)+2))
	elseif Cmax == Bi then
		H = (60*(((Ri-Gi)/D)+4))
	end
	if Cmax == 0 then
		S = 0
	else
		S = (D/Cmax)
	end
	local H = math.floor(H)
	return H,S,V
end

-- Interface setion 
active = false
function call(name)
	SKIN:Bang("[!SetOption ColorScreen.Pos Disabled 0][!ShowMeter ColorScreen.Lock][!Update]")
	active = true
	Name       = name
	CallMeter  = SKIN:GetMeter(name)
	OffsetY    = (tonumber(CallMeter:GetY()))
	OffsetX    = (tonumber(CallMeter:GetX()))
	LimitW     = (tonumber(CallMeter:GetW()))
	LimitH     = (tonumber(CallMeter:GetH()))
end

function unlock()
	SKIN:Bang("[!SetOption ColorScreen.Pos Disabled 1][!HideMeter ColorScreen.Lock][!Update]")
	SKIN:Bang(SELF:GetOption('OnDeactiveCommands'))
	active = false
end

function toprecent(x,y)
	if active then
		if Name == "ColorScreen.ColorPickerBox.Color" then
			local AdjustX = math.max(math.min((x-OffsetX),LimitW),0)
			local AdjustY = math.max(math.min((y-OffsetY),LimitH),0)
			PosToSV(AdjustX,AdjustY)
		elseif Name == "ColorScreen.ColorPickerBox.Hue" then
			local AdjustY = math.max(math.min((y-OffsetY),LimitH),0)
			SetHue(AdjustY)
		end
	end
end

function PosToSV(x,y)
	globalx = (x/2)
	globaly = (y/2)
	globals = (x/200)
	globalv = (1-(y/200))
	rgb(globalh,globals,globalv)
	Draw()
end
