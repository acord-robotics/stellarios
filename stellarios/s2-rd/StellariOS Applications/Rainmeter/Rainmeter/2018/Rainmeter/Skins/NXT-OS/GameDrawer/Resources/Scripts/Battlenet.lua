--[[
	@Author: NuzzyFutts
	@Github: github.com/NuzzyFutts
	@File: Battlenet
	@input: {string} BNET_CONFIG_FILE_PATH - The path of the Battle.net config file
]]

function main(BNET_CONFIG_FILE_PATH)
	local LIST_OF_GAMES =  {prometheus="Pro",
							destiny2="DST2",
							heroes="Hero",
							hs_beta="WTCG",
							diablo3="D3",
							wow="WoW",
							s2="S2",
							s1="S1",
							viper="VIPR"}

	local GAME_NAMES =  	{prometheus="Overwatch",
							destiny2="Destiny 2",
							heroes="Heroes of the Storm",
							hs_beta="Hearthstone",
							diablo3="Diablo 3",
							wow="World of Warcraft",
							s2="Starcraft 2",
							s1="Starcraft",
							viper="Call of Duty: Black Ops 4"}

	local BANNER_URLS =    {prometheus="http://us.blizzard.com/static/_images/lang/en-us/gamecard-games-overwatch.jpg",
							destiny2="https://bnetproduct-a.akamaihd.net//ff5/c9fb7c865fa0eb80b1cacef42dd3cb1e-feature-07.png",
							heroes="http://us.blizzard.com/static/_images/lang/en-us/gamecard-games-heroes.jpg",
							hs_beta="http://us.blizzard.com/static/_images/games/hearthstone/gamecard-games-hearthstone-en.jpg",
							diablo3="http://us.blizzard.com/static/_images/lang/en-us/gamecard-games-d3.jpg",
							wow="http://us.blizzard.com/static/_images/lang/en-us/gamecard-games-wow.jpg",
							s2="http://us.blizzard.com/static/_images/lang/en-us/gamecard-games-sc2.jpg",
							s1="http://us.blizzard.com/static/_images/lang/en-us/gamecard-games-sc1.jpg",
							viper="https://bnetproduct-a.akamaihd.net//38/c004e9ac19a5b157a01fbe1f07fc92f1-CODBO4-Bnet_Game-Shop_Feature_R1C1-640x360-20180413.png"}

	local function getInstalledGames()
		local familyFile = io.open(BNET_CONFIG_FILE_PATH,"r")
		local count = 0
		local found = false
		local level = 0
		local start = nil
		local count = 0
		local entry = nil
		local uid = nil
		local games = {}

		if familyFile then
			for line in familyFile:lines() do
				
				count = count + 1

				if found or string.match(line,'Games') then

					entry = string.match(line,'^%s*"([%w%p]+)": {')

					if entry ~= nil and level == 1 and entry ~= "battle_net" and entry ~= "prometheus_test" then
						table.insert(games, entry)
					end

					if string.match(line, "{") then
						level = level + 1
					end

					if string.match(line, "}") then
						level = level - 1
					end

					if not found then
						found = true
						start = count
					end

					if level == 0 and start ~= count then
						break
					end
				end
			end
			familyFile:close()
		else
			--game family file not found file not found
			debug("Error: Could not find/open the file 'battle.net.config'")
			return nil
		end
		return games
	end
	
	local function finalizeGames(games)

		local resultTable = {}
		local currTable = {}

		if games ~= nil then 
			for i=1, table.getn(games) do
				if LIST_OF_GAMES[games[i]] ~= nil and GAME_NAMES[games[i]] ~= nil and BANNER_URLS[games[i]] ~= nil then -- Check to see if we know about this game 
					currTable["appID"]= LIST_OF_GAMES[games[i]]
					currTable["appName"] = GAME_NAMES[games[i]]
					currTable["installed"] = true
					currTable["hidden"] = false
					currTable["lastPlayed"] =  nil
					currTable["appPath"] = "battlenet://"..LIST_OF_GAMES[games[i]]
					currTable["bannerURL"] = BANNER_URLS[games[i]]
					currTable["bannerName"] = LIST_OF_GAMES[games[i]]..".jpg"		--TODO
					currTable["launcher"] = "Battle.net"

					table.insert(resultTable, currTable)
					currTable = {}
				else
					debug(games[i].." is not known by the Battle.net plugin.")
				end
			end
		end

		return resultTable

	end

	local installedGames = getInstalledGames()
	local final = finalizeGames(installedGames)

	return final

end