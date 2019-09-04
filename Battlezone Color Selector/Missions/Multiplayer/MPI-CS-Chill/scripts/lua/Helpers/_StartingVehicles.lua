local NETLIST_StratStarting = 1;

local VEHICLE_SPACING_DISTANCE = 30.0;

local MAX_STARTING_VEHICLES = 32;

local _STSV = {}

local StartingVehicles = {
	s_StartingVehicles = { },
}

function _STSV.Save()
	return StartingVehicles;
end

function _STSV.Load(StartingVehiclesData)
	StartingVehicles = StartingVehiclesData;
end

function _STSV.Start()
	for i = 1, MAX_STARTING_VEHICLES - 1 do
		local pContents = GetNetworkListItem(NETLIST_StratStarting, i);

		if (pContents == nil or pContents == "") then
			break;
		end

		table.insert(StartingVehicles.s_StartingVehicles, pContents);	
	end
end

function _STSV.CreateVehicles(Team, TeamRace, Bitmask, Where)
	local RandomizedPosition = nil;
	local VehicleH = 0;

	for i = 1, #StartingVehicles.s_StartingVehicles do
		if (bit32.band(Bitmask, bit32.lshift (1, i-1)) > 0) then
			RandomizedPosition = GetPositionNear(Where, VEHICLE_SPACING_DISTANCE, 4 * VEHICLE_SPACING_DISTANCE);

			local NewODF = TeamRace .. StartingVehicles.s_StartingVehicles[i]:sub(2);

			VehicleH = BuildObject(NewODF, Team, RandomizedPosition);
			SetRandomHeadingAngle(VehicleH);
			SetBestGroup(VehicleH);
		end
	end
end

return _STSV;