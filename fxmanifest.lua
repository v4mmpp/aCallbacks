fx_version 'cerulean';
games { 'gta5' }
lua54 'yes';
use_fxv2_oal 'yes';

author 'RevengeBack_';
description 'aCallback, a FiveM Callbacks system';
version '1.0.0';

shared_script 'config.lua';

server_scripts
{
    'server/Utilities.lua',
    'server/classes/_callbacks.lua',
    'lib/server_exports.lua',
};

client_scripts
{
    'client/main.lua',
    'lib/client_exports.lua',
};