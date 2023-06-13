-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Debug Logs
-- ════════════════════════════════════════════════════════════════════════════════════ --

local filename = function()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("^.*/(.*).lua$") or str
end
print("^6[SHARED - DEBUG] ^0: "..filename()..".lua gestartet");

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Code
-- ════════════════════════════════════════════════════════════════════════════════════ --

Config = {}

Config.Item = 'package_bomb'

Config.Prop = "prop_cs_box_clothes"

Config.Text = {
    ['open_package'] = "Paket öffnen"
}

