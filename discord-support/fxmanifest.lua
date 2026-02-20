fx_version 'cerulean'
game      'gta5'

author      'Paulo Martins'
description 'Discord Waiting Room — Staff Notifier'
version     '1.0.0'

dependency 'ox_lib'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'locales/*.lua',
}

server_scripts { 'server.lua' }
client_scripts { 'client.lua' }
