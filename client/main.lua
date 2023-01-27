local QBCore = exports['qb-core']:GetCoreObject()
local display = false

function show_message(entry)
	return Locale[config.locale][entry]
end

local clothing_label   =  Locale[config.locale]['clothing_label']
local tower_label   =  Locale[config.locale]['tower_label']
local jobs_label   =  Locale[config.locale]['jobs_label']
local gasoline_label   =  Locale[config.locale]['gasoline_label']
local legaljob_label   =  Locale[config.locale]['legaljob_label']
local market_label   =  Locale[config.locale]['market_label']
local mechanic_label   =  Locale[config.locale]['mechanic_label']
local bank_label   =  Locale[config.locale]['bank_label']
local garage_label   =  Locale[config.locale]['garage_label']



RegisterCommand("blips", function(source)
    SetDisplay(not display,clothing_label,tower_label,jobs_label,gasoline_label,legaljob_label,market_label,mechanic_label,bank_label,garage_label)
end)

RegisterNUICallback("exit", function(data)
    SetDisplay(display)
end)


function SetDisplay(bool,clothing_label,tower_label,jobs_label,gasoline_label,legaljob_label,market_label,mechanic_label,bank_label,garage_label)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        clothing_label = clothing_label,
        tower_label = tower_label,
        jobs_label = jobs_label,
        gasoline_label = gasoline_label,
        legaljob_label = legaljob_label,
        market_label = market_label,
        mechanic_label = mechanic_label,
        bank_label = bank_label,
        garage_label = garage_label,
        status = bool,
    })
end



Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)




----------------------- BLİPS ------------------------------

local old_blips = {}
local entire_blips = {
    
    -- Clothing
  
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = 1693.4566, y = 4823.17,  z = 42.1631294,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = -1177.86, y = -1780.561, z = 3.9084651470184,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = -712.215, y = -155.3529, z = 37.4151268,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = 121.76,   y = -224.6,    z = 53.56,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = -1192.94, y = -772.6889, z = 17.3255997,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = 425.236,  y = -806.008,  z = 28.491,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = -162.658, y = -303.397, z = 38.733,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = 75.950, y = -1392.891, z = 28.376,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = -822.194, y = -1074.134, z = 10.328,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = -1450.711, y = -236.83, z = 48.809,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = 4.254, y = 6512.813, z = 30.877,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = 615.180, y = 2762.933, z = 41.088,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = 1196.785, y = 2709.558, z = 37.222,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = -3171.453, y = 1043.857, z = 19.863,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = -1100.959, y = 2710.211, z = 18.107,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = -1207.6564941406, y = -1456.8890380859, z = 4.3784737586975,  scale= 0.4,  kind ="clothing"},
    {title="Kıyafetçi",   colour = 0,  id = 73,  x = 1784.13, y = 2492.6, z = 50.43,  scale= 0.4,  kind ="clothing"},
  
    -- tower 

    {title="Polis Merkezi",    colour = 29, id = 60,  x = 434.3231,  y =  -981.9143,z = 30.71062,  scale= 0.7,  kind ="tower"},
    {title="Sheriff Merkezi",  colour = 44, id = 60,  x = -445.3519, y =  6012.737, z = 31.71632,  scale= 0.7,  kind ="tower"},
    {title="Hastane",          colour = 2,  id = 61,  x = 294.72, y = -580.44, z = 43.18,  scale= 0.7,  kind ="tower"},
    {title="Boş Malikane",         colour = 44,  id = 176, x = -1520.04, y = 853.87, z = 181.59,  scale= 0.7,  kind ="tower"},
    {title="Boş Malikane",         colour = 50, id = 176, x = -1460.37, y = -29.19, z = 54.65,  scale= 0.7,  kind ="tower"},
    {title="Boş Malikane",         colour = 5,  id = 176, x = 1386.41, y = 1141.52, z = 114.33,  scale= 0.7,  kind ="tower"},
    {title="Boş Malikane",         colour = 84,  id = 176, x = -91.92, y = 836.15, z = 235.72,  scale= 0.7,  kind ="tower"},

    -- jobs 

    {title="Kuaför",           colour = 2,  id = 71,  x = -817.078, y = -185.478, z = 37.568,    scale= 0.7,  kind ="jobs"},
    {title="Kuaför",           colour = 2,  id = 71,  x = -32.3973, y = -150.834, z = 57.076,    scale= 0.7,  kind ="jobs"},
    {title="Kuaför",           colour = 2,  id = 71,  x = -279.123, y = 6228.874, z = 31.695,    scale= 0.7,  kind ="jobs"},
    {title="Dövmeci",          colour = 1,  id = 75,  x = 1322.6,    y =  -1651.9,  z = 51.2,      scale= 0.7,  kind ="jobs"},
    {title="Dövmeci",          colour = 1,  id = 75,  x = -1153.6,   y =  -1425.6,  z = 3.9,       scale= 0.7,  kind ="jobs"},
    {title="Dövmeci",          colour = 1,  id = 75,  x = 322.1,     y =  180.4,    z = 102.5,     scale= 0.7,  kind ="jobs"},
    {title="Dövmeci",          colour = 1,  id = 75,  x = -3170.0,   y =  1075.0,   z = 19.8,      scale= 0.7,  kind ="jobs"},
    {title="Dövmeci",          colour = 1,  id = 75,  x = 1864.6,    y =  3747.7,   z = 32.0,      scale= 0.7,  kind ="jobs"},
    {title="Galeri",           colour = 66, id = 523, x = -37.03975, y = -1102.751, z = 26.42233,  scale= 0.7,  kind ="jobs"},
    {title="Kuyumcu",          colour = 0,  id = 439, x = -628.2939, y = -235.1127, z = 38.05701,  scale= 0.7,  kind ="jobs"},
    {title="Göl Bar",          colour = 19,  id = 93, x = -469.6,  y = 4337.83, z = 61.96,     scale= 0.7,  kind ="jobs"},


    -- gasoline 
      
    {title="Benzinlik",       colour = 41,  id = 361, x = 49.4187,   y = 2778.793,  z = 58.043,    scale= 0.4,  kind = "gasoline"},
    {title="Benzinlik",       colour = 41,  id = 361, x = 263.894,   y = 2606.463,  z = 44.983,    scale= 0.4,  kind = "gasoline"},
    {title="Benzinlik",       colour = 41,  id = 361, x = 1039.958,  y = 2671.134,  z = 39.550,    scale= 0.4,  kind = "gasoline"},
    {title="Benzinlik",       colour = 41,  id = 361, x = 1207.260,  y = 2660.175,  z = 37.899,    scale= 0.4,  kind = "gasoline"},
    {title="Benzinlik",       colour = 41,  id = 361, x = 2539.685,  y = 2594.192,  z = 37.944,    scale= 0.4,  kind = "gasoline"},
    {title="Benzinlik",       colour = 41,  id = 361, x = 2679.858,  y =3263.946,   z = 55.240,    scale= 0.4,  kind = "gasoline"},
    {title="Benzinlik",       colour = 41,  id = 361, x = 2005.055,  y = 3773.887,  z = 32.403,    scale= 0.4,  kind = "gasoline"},
    {title="Benzinlik",       colour = 41,  id = 361, x = 1687.156,  y = 4929.392,  z = 42.078,    scale= 0.4,  kind = "gasoline"},
    {title="Benzinlik",       colour = 41,  id = 361, x = 1701.314,  y = 6416.028,  z = 32.763,    scale= 0.4,  kind = "gasoline"},
    {title="Benzinlik",       colour = 41,  id = 361, x = 179.857,   y = 6602.839,  z = 31.868,    scale= 0.4,  kind = "gasoline"},


    -- legal jobs 

    {title="Silahçı",          colour = 37, id = 110, x = 17.41546,  y = -1115.932, z = 29.79117,  scale= 0.7,  kind ="legal_jobs"},
    {title="Silahçı",          colour = 37, id = 110, x = 17.41546,  y = -1115.932, z = 29.79117,  scale= 0.7,  kind ="legal_jobs"},
    {title="Odun Toplama",     colour = 21, id = 285, x = -554.1841, y = 5369.808,  z = 70.35939,  scale= 0.7,  kind ="legal_jobs"},
    {title="Odun Toplama",     colour = 21, id = 285, x = -554.1841, y = 5369.808,  z = 70.35939,  scale= 0.7,  kind ="legal_jobs"},


    -- market --
  
    {title="Market",           colour = 2,  id = 52,  x = 373.875,   y = 325.896,   z = 102.566,   scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = 2557.458,  y = 382.282,   z = 107.622,   scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = -3038.939, y = 585.954,   z = 6.908,     scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = -1487.553, y = -379.107,  z = 39.163,    scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = 1392.562,  y = 3604.684,  z = 33.980,    scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = -2968.243, y = 390.910,   z = 14.043,    scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = 2678.916,  y = 3280.671,  z = 54.241,    scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = -48.519,   y = -1757.514, z = 28.421,    scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = 1163.373,  y = -323.801,  z = 68.205,    scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = -707.501,  y = -914.260,  z = 18.215,    scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = -1820.523, y = 792.518,   z = 137.118,   scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = 1698.388,  y = 4924.404,  z = 41.063,    scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = 1961.464,  y = 3740.672,  z = 31.343,    scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = 1135.808,  y = -982.281,  z = 45.415,    scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = 25.88,     y = -1347.1,   z = 28.5,      scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = 547.431,   y = 2671.710,  z = 41.156,    scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = -3244.383, y = 1001.428,  z = 11.830,    scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = 1166.024,  y = 2708.930,  z = 37.157,    scale= 0.7,  kind ="market"},
    {title="Market",           colour = 2,  id = 52,  x = 1729.216,  y = 6414.131,  z = 34.037,    scale= 0.7,  kind ="market"},
    

    --mechanic 

    {title="Mekanik",         colour = 47,  id = 566, x = 942.24,    y = -971.04,   z = 39.48,     scale= 0.7,  kind = "mechanic"},  
    {title="Mekanik",         colour = 3,   id = 566, x = 722.0862,  y = -1088.235, z = 22.20861,  scale= 0.7,  kind = "mechanic"}, 
    {title="Mekanik",         colour = 1,   id = 566, x = 538.4003,  y = -181.3546, z = 54.48497,  scale= 0.7,  kind = "mechanic"}, 
    {title="Mekanik",         colour = 7,   id = 566, x = -1145.94,  y = -1990.971, z = 13.16184,  scale= 0.7,  kind = "mechanic"},
    {title="Mekanik ",        colour = 38,  id = 566, x = -348.68,   y = -137.2,    z = 39.0,      scale= 0.7,  kind = "mechanic"},   
    {title="Mekanik",         colour = 1,   id = 566, x = -211.06,   y = -1324.02,  z = 39.48,     scale= 0.7,  kind = "mechanic"},   
    {title="Mekanik",         colour = 1,   id = 566, x = -46.05,    y = -1041.45,  z = 28.32,     scale= 0.7,  kind = "mechanic"},

    -- bank --
  
    {title="Pacific Bank",     colour = 1,  id = 272, x = 243.35,    y = 224.706,   z = 106.28,    scale= 0.7,  kind ="bank"},
    {title="Fleeca Bank",      colour = 2,  id = 272, x = 150.266,   y = -1040.203, z = 29.374,    scale= 0.7,  kind ="bank"},
    {title="Fleeca Bank",      colour = 2,  id = 272, x = -1212.980, y = -330.841,  z = 37.787,    scale= 0.7,  kind ="bank"},
    {title="Fleeca Bank",      colour = 2,  id = 272, x = -2962.582, y = 482.627,   z = 15.703,    scale= 0.7,  kind ="bank"},
    {title="Fleeca Bank",      colour = 2,  id = 272, x = -112.202,  y = 6469.295,  z = 31.626,    scale= 0.7,  kind ="bank"},
    {title="Fleeca Bank",      colour = 2,  id = 272, x = 314.187,   y = -278.621,  z = 54.170,    scale= 0.7,  kind ="bank"},
    {title="Fleeca Bank",      colour = 2,  id = 272, x = -351.534,  y = -49.529,   z = 49.042,    scale= 0.7,  kind ="bank"},
    {title="Fleeca Bank",      colour = 2,  id = 272, x = 1175.0,    y = 2706.6,    z = 38.095,    scale= 0.7,  kind ="bank"},
    
    --garages

    {title="Hells Angels MC",  colour = 64, id = 675, x = 1085.971,  y = -783.059,  z = 58.733,    scale= 0.7,  kind ="garage"},

  }


Citizen.CreateThread(function()	for _, info in pairs(entire_blips) do
  Citizen.Wait(10)
  create_blip(info.x,info.y,info.title,info.colour,info.id,info.scale,info.kind)
end
end)

function create_blip(x, y,text,colour,sprite,scale,kind)
    local blip = AddBlipForCoord(x, y)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
    table.insert(old_blips, {id = blip, kind = kind})
end


RegisterNUICallback("blip_open_close", function(data)
  if data.status == true then
    for k,v in ipairs(entire_blips) do
      if v.kind == data.name then
        create_blip(v.x,v.y,v.title,v.colour,v.id,v.scale,v.kind)
      end
    end
  else
    for k,v in ipairs(old_blips) do
      if v.kind == data.name then
        RemoveBlip(v.id)
      end
    end
  end
end)