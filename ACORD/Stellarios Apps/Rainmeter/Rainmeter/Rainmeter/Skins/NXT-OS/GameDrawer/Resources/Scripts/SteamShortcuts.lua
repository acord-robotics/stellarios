--[[
	@Author: NuzzyFutts
	@Github: github.com/NuzzyFutts
	@File: SteamShortcuts
	@input: {string} DEFAULT_STEAM_PATH - The path of the default steam directory
			{string} USER_ID - The user's steam ID
]]

function main(DEFAULT_STEAM_PATH, USER_ID)				--For use in game drawer
	local SHORTCUT_VDF_PATH = DEFAULT_STEAM_PATH .. 'userdata\\'..USER_ID..'\\config\\shortcuts.vdf'

	--function to split a string into a table by a delimeter/pattern
	local function split(pString, pPattern)

		local Table = {}
		local fpat = "(.-)" .. pPattern
		local last_end = 1
		local s, e, cap = pString:find(fpat, 1)

		while s do
			if s ~= 1 or cap ~= "" then
				table.insert(Table,cap)
			end
			last_end = e+1
			s, e, cap = pString:find(fpat, last_end)
		end

		if last_end <= #pString then
			cap = pString:sub(last_end)
			table.insert(Table, cap)
		end

		return Table
	end


	--Function to read the shortcuts.vdf file and return a 
	--(rough) table with the data that we need for the
	--tables in GameDrawer
	local function readVDFFile(vdfFile)
		local shortcutsFile = io.open(SHORTCUT_VDF_PATH, rb)
		local shortcutsStringBuilder = ''
		
		--if the file exists and we can open it
		if shortcutsFile ~= nil then

			--infnite loop
			while true do

				--read in 5 characters at a time
				local buff = shortcutsFile:read(5)
				
				--if we have reached the end of the file
				--break out of the loop and close the file
				if buff == nil then
					shortcutsFile:close()
					break
				else
					--else build the string further, by replacing base16 control characters with '|'
					shortcutsStringBuilder = shortcutsStringBuilder .. string.gsub(buff, '%c','|')
				end
			end
		end

		--split the string into a table and remove unneeded entries
		local resultTable = split(shortcutsStringBuilder, '|')
		for i = #resultTable, 1, -1  do
			if resultTable[i] == '' then
				table.remove(resultTable, i)
			end
		end

		debug("Entries gained from VDF File output:")
		for i = 1, table.getn(resultTable) do
			debug(resultTable[i])
		end

		--return the final table
		return resultTable
	end

	--finalize the data and return the data table as required by gamedrawer
	local function finaliseTables(shortcutsTable)

		--initialize the variables
		local currNum = nil
		local currName = nil
		local currPath = nil
		local currTable = {}
		local resultTable = {}

		debug("Shortcut VDF parsing table output:")

		--for all entries in the table
		for i = 1, table.getn(shortcutsTable) do

			debug(shortcutsTable[i])

			--if this line has the number for this app, assign currNum
			if string.match(shortcutsTable[i], '^%d') then
				currNum = shortcutsTable[i]
			end

			--if this line has the app name, assign currName
			if string.match(shortcutsTable[i], '^AppName') then
				currName = shortcutsTable[i+1]
			end

			--if this line has the app path, assign currPath
			if string.match(shortcutsTable[i], '^exe') then
				currPath = shortcutsTable[i+1]
			end
			
			--finalise currTable, push to resultTable and start over
			if string.match(shortcutsTable[i], 'tags') then
				--if currNum was never assigned (only happens when
				--it is the first time), assign it to 0
				if currNum == nil then
					currNum = 0
				end
				currTable["appID"] = currNum
				currTable["lastPlayed"] = nil
				currTable["appName"] = currName
				currTable["installed"] = true
				currTable["hidden"] = false
				currTable["appPath"] = currPath
				currTable["bannerURL"] = nil
				currTable["bannerName"] = "placeholder.jpg"
				currTable["launcher"] = "Steam Shortcuts"

				table.insert(resultTable,currTable)

				currTable = {}
				currNum = nil
				currName = nil
				currPath = nil
			end
		end

		return resultTable
	end

	local shortcutVDFResult = readVDFFile(SHORTCUT_VDF_PATH)
	local final = {}

	--if the file wasn't found, set final to nil and return a debug statement
	if shortcutVDFResult == nil then
		debug('Shortcut vdf file not found. Stopping search...')
	end

	final = finaliseTables(shortcutVDFResult)
	
	--debug code
	for a = 1, table.getn(final) do
		debug(final[a].appID, final[a].appName, final[a].appPath,"")
	end
	debug("Total number of games found: "..table.getn(final))

	return final
end