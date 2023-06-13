-- ════════════════════════════════════════════════════════════════════════════════════ --
-- ESX Shared
-- ════════════════════════════════════════════════════════════════════════════════════ --

ESX = exports["es_extended"]:getSharedObject()

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Debug Logs
-- ════════════════════════════════════════════════════════════════════════════════════ --

local filename = function()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("^.*/(.*).lua$") or str
end
print("^6[SERVER - DEBUG] ^0: "..filename()..".lua gestartet");

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Code
-- ════════════════════════════════════════════════════════════════════════════════════ --

ESX.RegisterUsableItem(Config.Item, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(Config.Item, 1)

    TriggerClientEvent('GMW_Scripts:PackageBomb:Place', source)
end)

RegisterNetEvent('GMW_Scripts:PackageBomb:RegisterTarget', function(objectNetId)
    TriggerClientEvent('GMW_Scripts:PackageBomb:AddTarget', -1, objectNetId)
end)