-- NATIVEUI MENUS
local _menuPool = NativeUI.CreatePool()
-- local mainMenu = NativeUI.CreateMenu("Radio", "~b~Select TokoVoip radio", 0, 0) -- Description is not working? Getting a value is `nil` here.
local mainMenu = NativeUI.CreateMenu("Radio", nil, 0, 0)
_menuPool:Add(mainMenu)

--[[ Error of that it says nil, this is the one of MouseControlsEnabled
[   4252813] Error running call reference function for resource TokoRadioMenu: citizen:/scripting/lua/scheduler.lua:405: @TokoRadioMenu/NativeUILua-Reloaded/UIMenu/MenuPool.lua:168: attempt to call a nil value (global 'tobool')
[   4252828] stack traceback:
[   4252828] 	@TokoRadioMenu/NativeUILua-Reloaded/UIMenu/MenuPool.lua:168: in method 'MouseControlsEnabled'
[   4252828] 	@TokoRadioMenu/client/client.lua:12: in upvalue 'ref'
[   4252828] 	citizen:/scripting/lua/scheduler.lua:391: in function <citizen:/scripting/lua/scheduler.lua:390>
[   4252844] 	[C]: in function 'xpcall'
[   4252844] 	citizen:/scripting/lua/scheduler.lua:390: in function <citizen:/scripting/lua/scheduler.lua:389>
[   4252844] stack traceback:
[   4252844] 	[C]: in function 'error'
[   4252859] 	citizen:/scripting/lua/scheduler.lua:405: in function <citizen:/scripting/lua/scheduler.lua:374>
]]--

-- _menuPool:MouseControlsEnabled(false) -- Same here again...

local state = {"off", "on"}
local radio1 = NativeUI.CreateSliderItem("Police radio", state, nil, "devider variable") -- Devider is hard coded to false(Line 43, in UIMenuSliderItem.lua). Same problem as above. Am I doing something wrong?
mainMenu:AddItem(radio1)
mainMenu.OnSliderChange = function(sender, item, index)
if item == radio1 then
currentSelectedIndex = item:IndexToItem(index)
	if currentSelectedIndex == "off" then
		if exports.tokovoip_script:isPlayerInChannel(1) == true then
            exports.tokovoip_script:removePlayerFromRadio(1)
        end
    end
    if currentSelectedIndex == "on" then
		if exports.tokovoip_script:isPlayerInChannel(1) == false then
			exports.tokovoip_script:addPlayerFromRadio(1)
        end
    end
end

-- COMMANDS
RegisterCommand("radio", function()
    TriggerEvent('chat:addMessage', {
	  color = { 255, 0, 0},
	  multiline = true,
	  args = {"TokoRadioMenu", "Command triggered."}
	})
	_menuPool:ProcessMenus()
    mainMenu:Visible(not mainMenu:Visible())
end)
end

--[[ Error when running command
[   4496875] Error running call reference function for resource TokoRadioMenu: citizen:/scripting/lua/scheduler.lua:405: ...u/NativeUILua-Reloaded/UIMenu/items/UIMenuSliderItem.lua:92: attempt to call a nil value (global 'tobool')
[   4496875] stack traceback:
[   4496875] 	...u/NativeUILua-Reloaded/UIMenu/items/UIMenuSliderItem.lua:92: in method 'Selected'
[   4496875] 	@TokoRadioMenu/NativeUILua-Reloaded/UIMenu/UIMenu.lua:351: in method 'CurrentSelection'
[   4496891] 	@TokoRadioMenu/NativeUILua-Reloaded/UIMenu/UIMenu.lua:480: in method 'AddItem'
[   4496891] 	@TokoRadioMenu/client/client.lua:20: in upvalue 'ref'
[   4496891] 	citizen:/scripting/lua/scheduler.lua:391: in function <citizen:/scripting/lua/scheduler.lua:390>
[   4496906] 	[C]: in function 'xpcall'
[   4496906] 	citizen:/scripting/lua/scheduler.lua:390: in function <citizen:/scripting/lua/scheduler.lua:389>
[   4496906] stack traceback:
[   4496906] 	[C]: in function 'error'
[   4496922] 	citizen:/scripting/lua/scheduler.lua:405: in function <citizen:/scripting/lua/scheduler.lua:374>
]]--