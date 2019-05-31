local items = {"uit", "aan"}
local portofoon = NativeUI.CreateSliderItem("Portoffon", items, 1, false)
menu:AddItem(portofoon)
menu.OnSliderChange = function(sender, item, index)
    if item == portofoon then
       	currentSelectedIndex = item:IndexToItem(index)
       	if currentSelectedIndex == "uit" then
       		if exports.tokovoip_script:isPlayerInChannel(1) == true then
                exports.tokovoip_script:removePlayerFromRadio(1)
            end
       	end
        if currentSelectedIndex == "uit" then
            if exports.tokovoip_script:isPlayerInChannel(1) == false then
                exports.tokovoip_script:addPlayerFromRadio(1)
            end
        end
    end
end
