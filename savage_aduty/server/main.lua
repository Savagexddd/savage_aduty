ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

ESX.RegisterServerCallback("savage_aduty:rangcheck", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)


--Aduty Command Kleidung + Godmode
TriggerEvent("es:addGroupCommand", "aduty", "support", function(source, args, user)
    TriggerClientEvent("savage_aduty:aduty", source)
end, function(source, args, user)
    TriggerClientEvent('savage_aduty:notify', source)
end)
--Ende mit Aduty Command Kleidung + Godmode


--OffDuty Godmode/Kleidung aus
TriggerEvent("es:addGroupCommand", "offduty", "support", function(source, args, user)
    TriggerClientEvent("savage_aduty:offduty", source)
end, function(source, args, user)
    TriggerClientEvent('savage_aduty:notify', source)
end)

--Unsichtbar an
TriggerEvent("es:addGroupCommand", "vsb", "support", function(source, args, user)
    TriggerClientEvent("savage_aduty:unsichtbaran", source)
end, function(source, args, user)
    TriggerClientEvent('savage_aduty:notify', source)
end)
--Unsichtbar an ende


--Unsichtbar aus
TriggerEvent("es:addGroupCommand", "offvsb", "support", function(source, args, user)
    TriggerClientEvent("savage_aduty:unsichtbaraus", source)
end, function(source, args, user)
    TriggerClientEvent('savage_aduty:notify', source)
end)
--Unsichtbar aus ende

--Discord Logs für im A-Duty
RegisterNetEvent('savage_aduty:logsa')
AddEventHandler('savage_aduty:logsa', function()
    local name = GetPlayerName(source)
    discordlogs('TacoLife  Logs', ' ' .. name .. ' ist nun im A-Duty', 3863105)
end)
--Discord Logs für nicht mehr im A-Duty
RegisterNetEvent('savage_aduty:logso')
AddEventHandler('savage_aduty:logso', function()
    local name = GetPlayerName(source)
    discordlogs('TacoLife  Logs', ' ' .. name .. ' ist nicht mehr im A-Duty', 15874618)
end)

--Discord Logs für Unsichtbarkeit
RegisterNetEvent('savage_aduty:logsv')
AddEventHandler('savage_aduty:logsv', function()
    local name = GetPlayerName(source)
    discordlogs('TacoLife  Logs', ' ' .. name .. ' ist nun im Vanish', 3863105)
end)
--Discord Logs für nicht mehr Unsichtbarkeit
RegisterNetEvent('savage_aduty:logsov')
AddEventHandler('savage_aduty:logsov', function()
    local name = GetPlayerName(source)
    discordlogs('TacoLife  Logs', ' ' .. name .. ' ist nicht mehr im Vanish', 15874618)
end)

function discordlogs (name,message,color)
    local DiscordWebHook = "https://discord.com/api/webhooks/747086088153202699/J34iRREnSXJSmLH8CDgu6nXTwtBIswqD2sfE8OYVJ5eylp1j1w9ZtSLF6XUnyugtHCKC"
    
    local embeds = {
        {
            ["title"]=message,
            ["type"]="rich",
            ["color"] =color,
            ["footer"]=  {
            ["text"]= "TacoLife Logs - "..os.date("%x %X %p"),
           },
        }
    }
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

