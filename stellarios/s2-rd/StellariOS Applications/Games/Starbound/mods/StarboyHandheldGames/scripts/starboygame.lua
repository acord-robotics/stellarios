require "/scripts/util.lua"

function init()
  if config.getParameter("key") == nil then
    activeItem.setInstanceValue("key", sb.makeUuid())
  end
  
  self.key = config.getParameter("key")
  
  message.setHandler("holdingGame", function() return true end)
  message.setHandler("holdingCorrectGame", holdingCorrectGame)
  message.setHandler("closed", onClosed)
  message.setHandler("getKey", getKey)
  message.setHandler("saveScores", saveScores)
  message.setHandler("loadScores", loadScores)
end

function activate(fireMode, shiftHeld)
  if not self.gameOpen then
    activeItem.interact(config.getParameter("interactAction"), config.getParameter("interactData"));
    self.gameOpen = true
  end
end

function uninit()

end

function onClosed()
  self.gameOpen = false
end

function getKey()
  return config.getParameter("key")
end

function holdingCorrectGame(_,_,interfaceKey)
  return interfaceKey.key == self.key and self.key ~= nil
end

function saveScores(_,_,scoreData)
    --sb.logInfo("ITEM:saving " .. util.tableToString(scoreData))
    activeItem.setInstanceValue("scores", scoreData)
end

function loadScores()
  local scores = config.getParameter("scores")
  --local scoreString
  --if scores == nil then scoreString = " nil " else scoreString = util.tableToString(scores) end
  
  --sb.logInfo("ITEM:loading " .. scoreString)
  return config.getParameter("scores")
end