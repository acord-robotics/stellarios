function Main()
	Display("Checking for PLACEHOLDER in dock.inc")
	SkinsPath = SKIN:GetVariable('SKINSPATH')
	FilePath = SKIN:MakePathAbsolute(SkinsPath.."NXT-OS Data\\Dock.inc")
	info={}
	for line in io.lines(FilePath) do
		table.insert(info, line)
	end
	Check()
end

function Check()
	local change = false
	for k,v in pairs(info) do
		if v == "PLACEHOLDER" then
			Display("Correcting line " .. k)
			table.remove(info,k)
			change = true
		end
	end
	if change then
		write()
	end 
end


function write()
	File = io.open(FilePath, "w+")
	Display("Writing")
	if not File then
		print('WriteFile: unable to open file at ' .. FilePath)
		return
	end

	for k, v in pairs(info) do
		File:write(v.."\n")
	end

	File:close()
end