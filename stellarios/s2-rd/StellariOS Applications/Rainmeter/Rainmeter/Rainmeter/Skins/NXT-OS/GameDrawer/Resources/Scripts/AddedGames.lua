function main()
	local games = json.load(dirDATA..'addedgames.json')
	local processed = {}
	local i = 1
	if games ~= nil then
		for k,v in pairs(games) do
			processed[i] = v
			processed[i]["appID"] = k
			processed[i]["installed"] = true
			processed[i]["hidden"] = false
			processed[i]["launcher"] = "User Added Games"
			i = i + 1
		end
	end
	return processed
end		