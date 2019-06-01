-- NATIVEUI MENUS
local _menuPool = NativeUI.CreatePool()
local mainMenu = NativeUI.CreateMenu("Radio", "~b~Select TokoVoip radio", 0, 0)
_menuPool:Add(mainMenu)

-- RADIOS
local state = {"Off", "On"}
local radio1 = NativeUI.CreateListItem("Police radio", state, false)
mainMenu:AddItem(radio1)
mainMenu.OnListChange = function(sender, item, index)
if item == radio1 then
currentSelectedIndex = item:IndexToItem(index)
	if currentSelectedIndex == "Off" then
		if exports.tokovoip_script:isPlayerInChannel(1) == true then
            exports.tokovoip_script:removePlayerFromRadio(1)
        end
    end
    if currentSelectedIndex == "On" then
		if exports.tokovoip_script:isPlayerInChannel(1) == false then
			exports.tokovoip_script:addPlayerToRadio(1)
        end
    end
end

-- COMMANDS
RegisterCommand("radio", function()
	_menuPool:ProcessMenus()
    mainMenu:Visible(not mainMenu:Visible())
end)
end

-- Testing script
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, 29) then
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)

