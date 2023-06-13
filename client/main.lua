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
    TriggerServerEvent('GMW_Scripts:PackageBomb:RegisterTarget', NetworkGetNetworkIdFromEntity(object))
end)

RegisterNetEvent('GMW_Scripts:PackageBomb:AddTarget', function(objectNetId)
    local settings = {
        {
            name = 'package:open',
            icon = 'fa-sharp fa-solid fa-box-open-full',
            label = Config.Text['open_package'],
            canInteract = function(entity, distance, coords, name, bone)
                return distance < 3
            end,
            onSelect = function(data)
                PackageBomb:Explode(data.entity, objectNetId)
            end
        },
    }
    exports.ox_target:addEntity(objectNetId, settings)
end)


function PackageBomb:Explode(entity, objectNetId)
    local x, y, z = table.unpack(GetEntityCoords(entity))

    Anim:Duck()
    Wait(1000)

    NetworkRequestControlOfNetworkId(objectNetId)

    repeat Wait(10) until NetworkHasControlOfNetworkId(objectNetId)

	AddExplosion(x, y, z, 9, 0.9, 1, 0, 1065353216, 0)
    DeleteEntity(NetworkGetEntityFromNetworkId(objectNetId))
end 


