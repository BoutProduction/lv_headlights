--[[ 
                 Headlight Menu - by BoutProduction
]]

function OpenHeadlightMenu()
    local elems = {
        {label = 'Open list', value = 'open_list'},

}
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ColourMenu',{
        title = 'Headlight Colours',
        align = 'top-left',
        elements = elems
    },
    function(data, menu)
        if data.current.value == 'open_list' then 
            ColourList()
        end

    end,
    function(data, menu)
        menu.close()
    end)
end

--[[
    All Colours
]]

function ColourList()
        local elems = {
            {label = 'Darkblue', value = '1'},
            {label = 'Lightblue', value = '2'},
            {label = 'Turquoise', value = '3'},
            {label = 'Green', value = '4'},
            {label = 'Yellow', value = '5'},
            {label = 'Gold', value = '6'},
            {label = 'Orange', value = '7'},
            {label = 'Red', value = '8'},
            {label = 'Pink', value = '9'},
            {label = 'Violet', value = '10'},
            {label = 'Purple', value = '11'},
            {label = 'Ultraviolet', value = '12'},

        }
    
        ESX.UI.Menu.CloseAll()
    
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ColourMenu',{
            title = 'Headlight Colours',
            align = 'top-left',
            elements = elems
        },
        function(data, menu)
            local color = tonumber(data.current.value)
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            ToggleVehicleMod(veh, 22, true) -- Xenon
            if data.current.value == '1' then
                SetVehicleXenonLightsColour(veh, 1)
            elseif data.current.value == '2' then
                SetVehicleXenonLightsColour(veh, color)
            elseif data.current.value == '3' then
                SetVehicleXenonLightsColour(veh, color)
            elseif data.current.value == '4' then
                SetVehicleXenonLightsColour(veh, color)
            elseif data.current.value == '5' then
                SetVehicleXenonLightsColour(veh, color)
            elseif data.current.value == '6' then
                SetVehicleXenonLightsColour(veh, color)
            elseif data.current.value == '7' then
                SetVehicleXenonLightsColour(veh, color)
            elseif data.current.value == '8' then
                SetVehicleXenonLightsColour(veh, color)
            elseif data.current.value == '9' then
                SetVehicleXenonLightsColour(veh, color)
            elseif data.current.value == '10' then
                SSetVehicleXenonLightsColour(veh, color)
            elseif data.current.value == '11' then
                SSetVehicleXenonLightsColour(veh, color)
            elseif data.current.value == '12' then
                SetVehicleXenonLightsColour(veh, color)
            end
    end,
    function(data, menu)
        menu.close()
    end)
end

--[[
    Marker, Blip and help text
]]

local location = {
    {x = -220.4,y = -2658.93,z = 6.0},
    {x = -225.0,y = -2658.89,z = 6.0},
    {x = -229.62,y = -2658.84,z = 6.0},
    {x = -234.81,y = -2659.12,z = 6.0},

}

CreateThread(function()
    while true do
        idle = 800

        for k in pairs(location) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, location[k].x, location[k].y, location[k].z)
            if dist <= 10.0 then
                idle = 0
                DrawMarker(20, location[k].x, location[k].y, location[k].z, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 255, 50, 255, 100, true, true, 2, true, false, false, false)
            end
            if dist <= 1.2 then
                idle = 0
                ESX.ShowHelpNotification("Press ~INPUT_TALK~ to change the ~p~Colour~s~")
		if IsControlJustPressed(1,51) then 
			OpenHeadlightMenu()
		end
            end
        end
        Wait(idle)
    end
end)

-- Create blips
CreateThread(function()
    for k in pairs(location) do
        local blip = AddBlipForCoord(-227.39, -2659.0, 6.0)

        SetBlipSprite (blip, 643)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 1.0)
        SetBlipColour (blip, 8)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Headlight Changer")
        EndTextCommandSetBlipName(blip)
    end
end)
