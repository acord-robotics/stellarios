function Initialize()
	SKIN:Bang('!EnableMeasure SetActiveStatus NXT-OS\\System\\FileBrowser')
	lastconfig = nil
end

function Destroy(Config)
	if lastconfig == Config then
		SKIN:Bang('!DeactivateConfig NXT-OS\\System\\FileBrowser')
	end
end

function BrowseCall(Config,Num)
	if lastconfig ~= Config then
		lastconfig = Config
		SKIN:Bang('!DeactivateConfig NXT-OS\\System\\FileBrowser')
		SKIN:Bang('!CommandMeasure','FileBrowserController','Accept('..Num..')',Config)
	else
		lastconfig = Config
		SKIN:Bang('!CommandMeasure','FileBrowserController','Accept('..Num..')',Config)
	end
end