-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Debug Logs
-- ════════════════════════════════════════════════════════════════════════════════════ --

local filename = function()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("^.*/(.*).lua$") or str
end
print("^6[CLIENT - DEBUG] ^0: "..filename()..".lua gestartet");

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Code
-- ════════════════════════════════════════════════════════════════════════════════════ --

PackageBomb = {}

RegisterNetEvent('GMW_Scripts:PakageBomb:Place', function()
    local object = Anim:Play()
    local settings = {
        {
            name = 'package:open',
            icon = 'fa-solid fa-road',
            label = Config.Text['open_package'],
            canInteract = function(entity, distance, coords, name, bone)
                return distance < 3
            end,
            onSelect = function(data)
                PackageBomb:Explode(data)
            end
        },
    }
    exports.ox_target:addEntity(NetworkGetNetworkIdFromEntity(object), settings)
end)

function PackageBomb:Explode(data)
    local x, y, z = table.unpack(GetEntityCoords(data.entity))

    AddExplosion(x, y, z, 0, 1, true, false, true)

    DeleteEntity(data.entity)
end 


