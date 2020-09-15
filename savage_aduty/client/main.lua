local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

  
ESX = nil
local imaduty = false
imaduty = not imaduty
local imvanish = false
imvanish= not vanish

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
end)


--Entfernt Standard Sounds wie Autos etc
Citizen.CreateThread(function()
  StartAudioScene('CHARACTER_CHANGE_IN_SKY_SCENE')
end)

RegisterNetEvent('savage_aduty:aduty')
AddEventHandler('savage_aduty:aduty', function(source)
  local playerPed = GetPlayerPed(-1)
  TriggerEvent('skinchanger:getSkin', function(skin)
    ESX.TriggerServerCallback("savage_aduty:rangcheck", function(group)
      if skin.sex == 0 then
        if group == "superadmin" then
          TriggerEvent("skinchanger:loadClothes", skin, Config.Outfits.superadmin.male)
          ESX.ShowNotification('Du befindest dich nun im A-Duty')
          SetEntityInvincible(playerPed, true)
          imaduty = true
          TriggerServerEvent('savage_aduty:logsa')
        elseif group == "admin" then
          TriggerEvent("skinchanger:loadClothes", skin, Config.Outfits.admin.male)
          ESX.ShowNotification('Du befindest dich nun im A-Duty')
          SetEntityInvincible(playerPed, true)
          imaduty = true
          TriggerServerEvent('savage_aduty:logsa')	
        elseif group == "mod" then
          TriggerEvent("skinchanger:loadClothes", skin, Config.Outfits.mod.male)
          ESX.ShowNotification('Du befindest dich nun im A-Duty')
          SetEntityInvincible(playerPed, true)
          imaduty = true
          TriggerServerEvent('savage_aduty:logsa')	
        elseif group == "support" then
          TriggerEvent("skinchanger:loadClothes", skin, Config.Outfits.support.male)
          ESX.ShowNotification('Du befindest dich nun im A-Duty')
          SetEntityInvincible(playerPed, true)
          imaduty = true
          TriggerServerEvent('savage_aduty:logsa')					
        end
      else
        if group == "superadmin" then
          TriggerEvent("skinchanger:loadClothes", skin, Config.Outfits.superadmin.female)
          ESX.ShowNotification('Du befindest dich nun im A-Duty')
          SetEntityInvincible(playerPed, true)
          imaduty = true
          TriggerServerEvent('savage_aduty:logsa')
        elseif group == "admin" then
          TriggerEvent("skinchanger:loadClothes", skin, Config.Outfits.admin.female)
          ESX.ShowNotification('Du befindest dich nun im A-Duty')
          SetEntityInvincible(playerPed, true)
          imaduty = true
          TriggerServerEvent('savage_aduty:logsa')
        elseif group == "mod" then
          TriggerEvent("skinchanger:loadClothes", skin, Config.Outfits.mod.female)
          ESX.ShowNotification('Du befindest dich nun im A-Duty')
          SetEntityInvincible(playerPed, true)
          imaduty = true
          TriggerServerEvent('savage_aduty:logsa')
        elseif group == "support" then
          TriggerEvent("skinchanger:loadClothes", skin, Config.Outfits.support.female)
          ESX.ShowNotification('Du befindest dich nun im A-Duty')
          SetEntityInvincible(playerPed, true)
          imaduty = true
          TriggerServerEvent('savage_aduty:logsa')
        end
      end
    end)
  end)
end)

--OffDuty Godmode aus
RegisterNetEvent('savage_aduty:offduty')
AddEventHandler('savage_aduty:offduty', function(source)
  local playerPed = GetPlayerPed(-1)
  
  if imaduty == true then
    TriggerEvent('savage_aduty:offdutygehen')
    TriggerEvent('savage_aduty:offdutykleidung')
    TriggerServerEvent('savage_aduty:logso')
  else
    ESX.ShowNotification('Du befindest dich nicht im A-Duty')
  end
end)

RegisterNetEvent('savage_aduty:offdutygehen')
AddEventHandler('savage_aduty:offdutygehen', function(source)
  local playerPed = GetPlayerPed(-1)

  ESX.ShowNotification('Du befindest dich nun nicht mehr im A-Duty')
  SetEntityInvincible(playerPed, false)
  imaduty = false
end)


--Notification für keine Rechte
RegisterNetEvent('savage_aduty:notify')
AddEventHandler('savage_aduty:notify', function(source)
  local playerPed = GetPlayerPed(-1)

  ESX.ShowNotification('Kein Zugriff')
end)

--OffDuty Kleidung aus
RegisterNetEvent('savage_aduty:offdutykleidung')
AddEventHandler('savage_aduty:offdutykleidung', function(source)
  

  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
  TriggerEvent('skinchanger:loadSkin', skin)
  end)
end)


--Unsichtbar an
RegisterNetEvent('savage_aduty:unsichtbaran')
AddEventHandler('savage_aduty:unsichtbaran', function(source)
  local playerPed = GetPlayerPed(-1)

  if imaduty == true then
    SetEntityVisible(playerPed, false)
    ESX.ShowNotification('Du befindest dich nun im Vanish')
    TriggerServerEvent('savage_aduty:logsv')
    imvanish = true
  else
    ESX.ShowNotification('Du musst dafür im A-Duty sein')
  end
end) 


--Unsichtbar aus
RegisterNetEvent('savage_aduty:unsichtbaraus')
AddEventHandler('savage_aduty:unsichtbaraus', function(source)
  local playerPed = GetPlayerPed(-1)

  if imvanish == true then
    SetEntityVisible(playerPed, true)
    ESX.ShowNotification('Du befindest dich nun nicht mehr im Vanish')
    TriggerServerEvent('savage_aduty:logsov')
    imvanish = false
  else
    ESX.ShowNotification('Du befindest dich nicht im Vanish')
  end
end) 
