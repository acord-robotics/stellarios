function Main()
	Display("Running Dock Scripts")
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
	for k,v in ipairs(info) do
		local icon, path, text, format = string.match(v, "<Icon>(.-)</Icon><Path>(.-)</Path><Text>(.-)</Text><Format>(.-)</Format>")
		Display("Checking Icon "..text)
		if format == "3" then
			Display("Correcting Icon "..text)
			change = true
			info[k]="<Icon>"..icon.."</Icon><Path>"..path.."</Path><Text>"..text.."</Text><Format>"..format.."<Sort>Name</Sort><Ascending>1</Ascending></Format>"
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