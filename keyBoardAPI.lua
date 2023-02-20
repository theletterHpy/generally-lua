
local app = APP.begin("keyboard", "keyboard")
keys = {"a"}

local f4 = keybinds:newKeybind("f4 key", "key.keyboard.f4")
function app.events.post_key_press()
    if app.current_page ~= "key" then
        return
    end
    f4:onPress(function ()
        str=""
        typing = not typing
        print(typing and "Disabled Typing" or "Enabled Typing")
    return true
    end)
    

    if app.selected_item - element_count == 16 and offset + 16 ~= #APP.sorted_apps then
        offset = offset + 1
        app.selected_item = 15 + element_count

        update_app_list()
        app.redraw()
    elseif app.selected_item - element_count == 1 and offset ~= 0 then
        offset = offset - 1
        app.selected_item = 2 + element_count

        update_app_list()
        app.redraw()
    elseif app.selected_item >= 1 and not APP.sorted_apps[app.selected_item - element_count] then
        app.selected_item = #APP.sorted_apps + element_count

        app.redraw()
    end
end


function events.tick()
    for key in keys do
        _G[key] =  function()
            keybinds:newKeybind(key+" key", "key.keyboard." + key).press = function()
                if f4:isPressed() then
                    str= str + key
                end
            end
        end
    end
end


return keyboard