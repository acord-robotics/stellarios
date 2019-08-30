function Initialize()
	deactivate()
end

function deactivate()
	activated = 0
	SKIN:Bang('[!WriteKeyValue Variables Dash.Activated 0 "#SKINSPATH#NXT-OS\\Dash\\Dash.inc"]')
	SKIN:Bang('[!SetVariableGroup "Dash.Edit" "0" "NXTWidgets"][!SetVariableGroup "Dash.Activated" "0" "NXTWidgets"][!UpdateGroup NXTWidgets][!HideFadeGroup "NXTWidgets"][!DeactivateConfigGroup Dash]')
end

function activate()
	activated = 1
	SKIN:Bang('[!WriteKeyValue Variables Dash.Activated 1 "#SKINSPATH#NXT-OS\\Dash\\Dash.inc"]')
	SKIN:Bang('[!SetVariableGroup "Dash.Activated" "1" "NXTWidgets"][!UpdateGroup NXTWidgets][!ShowFadeGroup "NXTWidgets"][!ActivateConfig "NXT-OS\\Dash" "Dash.ini"]')
end

function toggle()
	if activated == 0 then
		activate()
	elseif activated == 1 then 
		deactivate()
	end
end