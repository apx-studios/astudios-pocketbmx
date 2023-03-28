Config = {}
Config.Debug = false -- True / False for Debug System

-- Notifications
Config.NotificationType = { -- 'qbcore' / 'astudios'
    server = 'astudios',
    client = 'astudios' 
}

-- Settings
Config.BikeItem = 'bmx'

Config.Language = {
    Progressbar = {
        ['placing'] = 'Placing Bike...',
        ['removing'] = 'Removing Bike...',
    },
    Error = {
        ['too_far_or_in_use'] = 'Too far from the bike or someone is sitting on it',
    }
}
