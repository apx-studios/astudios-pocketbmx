local QBCore = exports['qb-core']:GetCoreObject()
local bmxBike = nil

RegisterNetEvent('astudios-pocketbmx:client:use', function()
	if not DoesEntityExist(bmxBike) then
		local bmxBikeModel = 'bmx'
		RequestModel(bmxBikeModel)
		while not HasModelLoaded(bmxBikeModel) do
			Wait(0)
		end
		local playerPedCoords = GetEntityCoords(PlayerPedId())
		TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
		QBCore.Functions.Progressbar("placing_bmx", Config.Language.Progressbar['placing'], 10000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true
		}, {}, {}, {}, function() -- Done
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			bmxBike = CreateVehicle(bmxBikeModel, playerPedCoords.x, playerPedCoords.y, playerPedCoords.z + 1.0, GetEntityHeading(PlayerPedId()), true, false)
			SetVehicleOnGroundProperly(bmxBike)
			SetVehicleNumberPlateText(bmxBike, "BMX".. math.random(11111, 99999))
			SetPedIntoVehicle(PlayerPedId(), bmxBike, -1)
			SetModelAsNoLongerNeeded(bmxBikeModel)
			local bmxBikePlate = GetVehicleNumberPlateText(bmxBike)
			TriggerEvent("vehiclekeys:client:SetOwner", bmxBikePlate)
			SetVehicleEngineOn(bmxBike, true, true)
		end, function() -- Cancel
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		end)
	elseif DoesEntityExist(bmxBike) and #(GetEntityCoords(bmxBike) - GetEntityCoords(PlayerPedId())) < 3.0 and GetPedInVehicleSeat(bmxBike,-1) == 0 then
		TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
		QBCore.Functions.Progressbar("placing_bmx", Config.Language.Progressbar['removing'], 5000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true
		}, {}, {}, {}, function() -- Done
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			DeleteVehicle(bmxBike)
			bmxBike = nil
		end, function() -- Cancel
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		end)
	else
		if Config.NotificationType.client == "qbcore" then
			QBCore.Functions.Notify(Config.Language.Error['too_far_or_in_use'], "error")
		elseif Config.NotificationType.client == "astudios" then
			exports['astudios-notify']:notify("", Config.Language.Error['too_far_or_in_use'], 5000, 'error')
		end
	end
end)
