require "/scripts/util.lua"

function init()
  message.setHandler("saveScores", saveScores)
  message.setHandler("loadScores", loadScores)
end

function saveScores(_,_,scoreData)
  --if scoreData.interfaceKey == self.key and self.key ~= nil then
    --sb.logInfo("OBJ:saving " .. util.tableToString(scoreData))
    storage.scores = scoreData
  --end
end

function loadScores()
  local scores = storage.scores
  --if scores == nil then
    --sb.logInfo("OBJ:loading nil")
  --else
    --sb.logInfo("OBJ:loading " .. util.tableToString(scores) )
  --end
  return scores
end