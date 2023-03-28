--------------------------------------
--<!>-- ASTUDIOS | DEVELOPMENT --<!>--
--------------------------------------
print("^2[astudios-pocketbmx] ::^0 Started")
print("^2[astudios-pocketbmx] ::^0 Developed by ASTUDIOS | DEVELOPMENT")
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.BikeItem, function(source)
    TriggerClientEvent('astudios-pocketbmx:client:use', source)
end)
