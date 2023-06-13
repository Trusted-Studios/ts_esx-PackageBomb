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

RegisterNetEvent('GMW_Scripts:PackageBomb:Place', function()
    local object = Anim:Play()
    local settings = {
        {
            name = 'package:open',
            icon = 'fa-sharp fa-solid fa-box-open-full',
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

    Anim:Duck()
    Wait(1000)

	AddExplosion(x, y, z, 9, 0.9, 1, 0, 1065353216, 0)
    DeleteEntity(data.entity)
end 


