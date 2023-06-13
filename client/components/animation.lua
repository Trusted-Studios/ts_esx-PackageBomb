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

Anim = {
    ped = nil
}

function Anim:Play()
    self.ped = PlayerPedId()

    local animDict = "anim@mp_fireworks"
    local animName = "place_firework_2_cylinder"

    RequestAnimDict(animDict)
    repeat Wait(0) until HasAnimDictLoaded(animDict) 
    
    local Object = Game.SpawnObjectAtCoords(Config.Prop, 0, 0, 0)
    
    TaskPlayAnim(self.ped, animDict, animName, 8.0, -1, -1, 0, 0, 0, 0, 0)
    Wait(875)
    
    AttachEntityToEntity(Object, self.ped, GetEntityBoneIndexByName(self.ped, "IK_R_Hand"), 0.0, -0.05, -0.10, -100.0, 180.0, 35.0, 0, 0, 1, 0, 0, 1)
    Wait(875)
    
    DetachEntity(Object, true, false)
    PlaceObjectOnGroundProperly(Object)
    Wait(1750)
    
    ClearPedTasks(self.ped)
    
    return Object
end

function Anim:Duck()
    self.ped = PlayerPedId()

    local animDict = "amb@world_human_bum_wash@male@low@idle_a"
    local animName = "idle_a"

    RequestAnimDict(animDict)
    repeat Wait(0) until HasAnimDictLoaded(animDict) 

    TaskPlayAnim(self.ped, animDict, animName, 8.0, 0.2, 0.8, 0, 0, 0, 0, 0)
end