local API = {}
--variables
local items = {}


--commands
function API:addItem(item, model)
  if string.find(item, "minecraft:")==false then
    item = "minecraft:".. item
  end
  items[item] = {root=model, replacement=item}
  items[item].root:setVisible(false)
end
--events
function events.TICK() do
  item = player:getHeldItem()
  for k, v in pairs(items) do
    if items[k].replacement==item.id then
      items[k].root:setVisible(true)
    else
      items[k].root:setVisible(false)
    end
  end
end
return API
