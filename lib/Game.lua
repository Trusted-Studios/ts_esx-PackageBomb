-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Debug Logs
-- ════════════════════════════════════════════════════════════════════════════════════ --

local filename = function()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("^.*/(.*).lua$") or str
end
print("[CLIENT - DEBUG] : " .. filename() .. ".lua gestartet");

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Code
-- ════════════════════════════════════════════════════════════════════════════════════ --

Game = {}

function Game.SpawnObjectAtCoords(hash, x, y, z)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(500)
    end
    local object = CreateObjectNoOffset(hash, x, y, z, 1, 0, 1)
    PlaceObjectOnGroundProperly(object)
    FreezeEntityPosition(object, true)
    SetModelAsNoLongerNeeded(hash)
    return object
end