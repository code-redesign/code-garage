-- Events
RegisterNetEvent('jg-advancedgarages:server:ChangeVehiclePlate', function(curPlate, newPlate)
  local src = source

  MySQL.Async.execute('UPDATE player_vehicles SET plate = ? WHERE plate = ?', {newPlate, curPlate})
  TriggerClientEvent('QBCore:Notify', src, "Vehicle plate set to " .. newPlate, 'success')
end)

RegisterNetEvent('jg-advancedgarages:server:DeleteVehicle', function(plate)
  local src = source

  MySQL.Async.execute('DELETE FROM player_vehicles WHERE plate = ?', {plate})
  TriggerClientEvent('QBCore:Notify', src, "Vehicle deleted from database " .. plate, 'success')
end)

-- Commands
QBCore.Commands.Add(Config.ChangeVehiclePlate, "Change vehicle plate (Admin only)", {}, false, function(source)
  local src = source

  TriggerClientEvent("jg-advancedgarages:client:ChangeVehiclePlate", src)
end, 'admin')

QBCore.Commands.Add(Config.DeleteVehicleFromDB, "Delete vehicle from database (Admin only)", {}, false, function(source)
  local src = source

  TriggerClientEvent("jg-advancedgarages:client:DeleteVehicle", src)
end, 'admin')
