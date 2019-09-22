function init()
  message.setHandler("holdingGame", function() return true end)
  message.setHandler("save", storePetDate)
  message.setHandler("load", retrievePetData)
  message.setHandler("closed", onClosed)
end

function activate(fireMode, shiftHeld)
  if not self.gameOpen then
    activeItem.interact(config.getParameter("interactAction"), config.getParameter("interactData"));
	self.gameOpen = true
  end
end
function uninit()

end

function storePetDate(_, _, data)
  storage.pet = data
  
  --if config.getParameter("key") == nil then
  activeItem.setInstanceValue("pet", data)
  --end
  
  --local dataString = "saving data:\n" .. tostring(data)
  --for k,v in pairs(data) do
  --  dataString = dataString .. tostring(k) .. ":" .. tostring(v) .. "\n"
  --end
  --sb.logInfo(dataString)
end

function retrievePetData()
  return config.getParameter("pet")
  --return storage.pet
end

function onClosed()
  self.gameOpen = false

end