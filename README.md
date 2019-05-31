# TokoRadioMenu
A really easy to use menu for TokoVoip radio.

So yeah, I discovered the was no builtin way to use radios on TokoVoip. 
And TokoRadioSwitch wasn't what I was looking for because it requires ESX.
So I decided to create a custom system for this, that was easy to use.
It uses [NativeUILua-Reloaded](https://github.com/iTexZoz/NativeUILua_Reloaded) for the menu.

## How to use?
Download one of the releases via [here[(https://github.com/GameMaster2030/TokoRadioMenu/releases). 
Then put it into the resource folder and add to the server.cfg: `start TokoRadioMenu`.

## How to configure?
This sure isn't the best way to do it, but it shouldn't be too hard.
In the client folder open client.lua with something like [Notepad++](https://notepad-plus-plus.org/download/).
Now copy line 2-18 and paste it directly underneath it, then edit `radio1` to a different name like for example `radio2`, also edit the ids of the radios.
After you done that it should look like something as this:
```lua
...
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
local radio2 = NativeUI.CreateSliderItem("Firefighter radio", items, 1, false)
menu:AddItem(radio2)
menu.OnSliderChange = function(sender, item, index)
    if item == radio1 then
       	currentSelectedIndex = item:IndexToItem(index)
       	if currentSelectedIndex == "off" then
       		if exports.tokovoip_script:isPlayerInChannel(2) == true then
                exports.tokovoip_script:removePlayerFromRadio(2)
            end
       	end
        if currentSelectedIndex == "on" then
            if exports.tokovoip_script:isPlayerInChannel(2) == false then
                exports.tokovoip_script:addPlayerFromRadio(2)
            end
        end
    end
end
local radio3 = NativeUI.CreateSliderItem("EMS radio", items, 1, false)
menu:AddItem(radio3)
menu.OnSliderChange = function(sender, item, index)
    if item == radio1 then
       	currentSelectedIndex = item:IndexToItem(index)
       	if currentSelectedIndex == "off" then
       		if exports.tokovoip_script:isPlayerInChannel(3) == true then
                exports.tokovoip_script:removePlayerFromRadio(3)
            end
       	end
        if currentSelectedIndex == "on" then
            if exports.tokovoip_script:isPlayerInChannel(3) == false then
                exports.tokovoip_script:addPlayerFromRadio(3)
            end
        end
    end
end
```
For now it will be all directly stacked beneath each other, maybe I'll make a system for servers with many radios in the future.
