function Initialize()
-- Grab information and set table.
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SKIN:MakePathAbsolute(SkinsPath.."NXT-OS Data\\SettingsCache.inc")
	info={}
	for line in io.lines(FilePath) do
		local p_name, p_icon, p_path, p_ini = string.match(line, "<Name>(.-)</Name><Icon>(.-)</Icon><LaunchPath>(.-)</LaunchPath><Ini>(.-)</Ini>")
		table.insert(info,{name = p_name, icon = p_icon, path = p_path, ini = p_ini})
	end
	Draw()
end

function Draw()
	local max = table.getn(info)
	local sections = math.ceil(max/6)
	local size = 461+(sections*121) 
	for k,v in ipairs(info) do
		SKIN:Bang("!ShowMeter","ExtraIcon"..k)
		SKIN:Bang("!ShowMeter","ExtraLabel"..k)
		SKIN:Bang("!SetOption","ExtraIcon"..k,"ImageName",v.icon)
		SKIN:Bang("!SetOption","ExtraLabel"..k,"Text",v.name)
		SKIN:Bang("!SetOption","ExtraIcon"..k,"ini",v.path..' '..v.ini)
	end
	for i=1,sections do
		SKIN:Bang("!ShowMeter","ExtraSection"..i)
	end
	SKIN:Bang("!SetOption","Window.Base","H",size)
	SKIN:Bang("!SetOption","DarkBGSection","H",(size-97))
	SKIN:Bang("!Update")
end

function Launch(meter,external,measure)
	local object = nil
	if measure then 
		object = SKIN:GetMeasure(meter)
	else
		object = SKIN:GetMeter(meter)
	end
	local Ini = object:GetOption("ini")
	local path,ini = string.match(Ini,"(.-)%s(%S-).ini")
	SKIN:Bang("!ActivateConfig",path,ini..".ini")
	SKIN:Bang("!WriteKeyValue","Variables","ForwardCommand","[!CommandMeasure Script Launch('"..meter.."',"..tostring(external)..")]")
	if external then
		local X = SKIN:GetX()
		local Y = SKIN:GetY()
		SKIN:Bang("!Move",X,Y,path)
		SKIN:Bang("!DeactivateConfig")
	end
end