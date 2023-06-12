fx_version 'cerulean'
games { 'gta5' }

author 'German. Warthog'

lua54 'yes'

shared_scripts {'config.lua'}

client_scripts {
    'client/components/.lua',
    'client/main.lua',
}

server_scripts {
    'server/main.lua'
}

dependencies {
    'es_extended',
    'ox_lib'
}