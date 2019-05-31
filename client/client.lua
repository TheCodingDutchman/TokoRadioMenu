function createMenu()
    local _menuPool = NativeUI.CreatePool()
    local _mainMenu = NativeUI.CreateMenu("Radio", "~b~Select TokoVoip radio", 0, 0)
    _menuPool:Add(_mainMenu)

    _menuPool:MouseControlsEnabled(false)
    local items = {"off", "on"}
    local radio1 = NativeUI.CreateSliderItem("Police radio", items, 1, false)
    menu:AddItem(radio1)
    menu.OnSliderChange = function(sender, item, index)
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
    end
end

RegisterCommand("radio", function()
    createMenu()
end)
