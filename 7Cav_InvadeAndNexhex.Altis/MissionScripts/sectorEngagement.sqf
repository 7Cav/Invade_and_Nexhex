params["_sector"];

fnc_deploy_infantry = {
	params ["_sector","_squadLoadouts","_infantryList","_deploymentTypes","_sectorUnitsList"];
	
	_grp = createGroup [east,true];		
			
	_deploymentType = selectRandom _deploymentTypes;	
	
	if (_deploymentType == "garrison") then
	{
		if (count garrisonableBuildings > 0) then
		{
			_randIndex = floor(random(count garrisonableBuildings));
			_garrisonBuilding = garrisonableBuildings select _randIndex;
			_garrisonBuildingPositions = garrisonPositions select _randIndex;
			_garrisonBuildingLocation = getPos _garrisonBuilding;
			
			{
				_randPos = floor(random(count _garrisonBuildingPositions));
				_garrisonPosition = _garrisonBuildingPositions select _randPos;
				_garrisonBuildingPositions deleteAt _randPos;
				
				_class = _x select 0;
				_loadout = _x select 1;
				
				_unit = _grp createUnit [_class,[0,0,0],[],0,"NONE"];						
				_unit setPosATL _garrisonPosition;			
				_unit setUnitLoadout _loadout;		
				[_unit] execVM "MissionScripts\aiSkill.sqf";				
				_unit disableAI "PATH";	
				_unit setUnitPos "UP";					
				_infantryList pushBack _unit;
				_sectorUnitsList pushBack _unit;
				{
					_x addCuratorEditableObjects [[_unit],true];
				} forEach allCurators;
			} forEach _squadLoadouts;
			
			_grp setFormDir ((getMarkerPos _sector) getDir _garrisonBuildingLocation);
			
			if (count _garrisonBuildingPositions < count redfor_squad_deploymentData) then
			{
				garrisonPositions deleteAt _randIndex;
				garrisonableBuildings deleteAt _randIndex;
			};
		}
		else
		{
			_deploymentType = "open";
		};
	};	
	
	if (_deploymentType == "open") then
	{		
		_randPos = [getMarkerPos _sector, 0,((markerSize _sector) select 0) / 2, 2, 0, 0.30] call BIS_fnc_findSafePos;
		{
			_class = _x select 0;
			_loadout = _x select 1;
			
			_unit = _grp createUnit [_class,[0,0,0],[],0,"NONE"];
			_randDir = floor(random 360);
			_unit setPosATL (_randPos getPos [2, _randDir]);
			_unit setUnitLoadout _loadout;		
			[_unit] execVM "MissionScripts\aiSkill.sqf";
			_infantryList pushBack _unit;
			_sectorUnitsList pushBack _unit;
			{
				_x addCuratorEditableObjects [[_unit],true];
			} forEach allCurators;
		}
		forEach _squadLoadouts;
		
		_grp setFormDir ((getMarkerPos _sector) getDir _randPos);
		_grp setBehaviour "COMBAT";
		_grp setCombatMode "RED";
	};
};

fnc_deploy_officerAndRetinue = {
	params ["_sector","_squadLoadouts","_officerLoadout","_officerList","_sectorUnitsList"];
	
	_grp = createGroup [east,true];
	
	if (count garrisonableBuildings > 0) then
	{
		_randIndex = floor(random(count garrisonableBuildings));
		_garrisonBuilding = garrisonableBuildings select _randIndex;
		_garrisonBuildingPositions = garrisonPositions select _randIndex;
		_garrisonBuildingLocation = getPos _garrisonBuilding;
		
		{
			_randPos = floor(random(count _garrisonBuildingPositions));
			_garrisonPosition = _garrisonBuildingPositions select _randPos;
			_garrisonBuildingPositions deleteAt _randPos;
			
			_class = _x select 0;
			_loadout = _x select 1;
			
			_unit = _grp createUnit [_class,[0,0,0],[],0,"NONE"];						
			_unit setPosATL _garrisonPosition;			
			_unit setUnitLoadout _loadout;		
			[_unit] execVM "MissionScripts\aiSkill.sqf";				
			_unit disableAI "PATH";	
			_unit setUnitPos "UP";
			_sectorUnitsList pushBack _unit;
			{
				_x addCuratorEditableObjects [[_unit],true];
			} forEach allCurators;			
		} forEach (_squadLoadouts select [0, count _squadLoadouts-1]);
		
		_randPos = floor(random(count _garrisonBuildingPositions));
		_garrisonPosition = _garrisonBuildingPositions select _randPos;
		_garrisonBuildingPositions deleteAt _randPos;
		
		_class = _officerLoadout select 0;
		_loadout = _officerLoadout select 1;
		
		_unit = _grp createUnit [_class,[0,0,0],[],0,"NONE"];						
		_unit setPosATL _garrisonPosition;			
		_unit setUnitLoadout _loadout;		
		[_unit] execVM "MissionScripts\aiSkill.sqf";				
		_unit disableAI "PATH";	
		_unit setUnitPos "UP";					
		_officerList pushBack _unit;
		_sectorUnitsList pushBack _unit;
		{
			_x addCuratorEditableObjects [[_unit],true];
		} forEach allCurators;
		
		_grp setFormDir ((getMarkerPos _sector) getDir _garrisonBuildingLocation);
		
		if (count _garrisonBuildingPositions < count redfor_squad_deploymentData) then
		{
			garrisonPositions deleteAt _randIndex;
			garrisonableBuildings deleteAt _randIndex;
		};
	}
	else
	{		
		_randPos = [getMarkerPos _sector, 0,((markerSize _sector) select 0) / 2, 2, 0, 0.30] call BIS_fnc_findSafePos;
		{
			_class = _x select 0;
			_loadout = _x select 1;
			
			_unit = _grp createUnit [_class,[0,0,0],[],0,"NONE"];
			_randDir = floor(random 360);
			_unit setPosATL (_randPos getPos [2, _randDir]);
			_unit setUnitLoadout _loadout;		
			[_unit] execVM "MissionScripts\aiSkill.sqf";	
			_sectorUnitsList pushBack _unit;			
			{
				_x addCuratorEditableObjects [[_unit],true];
			} forEach allCurators;
		}
		forEach _squadLoadouts;
		
		_class = _officerLoadout select 0;
		_loadout = _officerLoadout select 1;
		
		_unit = _grp createUnit [_class,[0,0,0],[],0,"NONE"];	
		_randDir = floor(random 360);
		_unit setPosATL (_randPos getPos [2, _randDir]);	
		_unit setUnitLoadout _loadout;		
		[_unit] execVM "MissionScripts\aiSkill.sqf";					
		_officerList pushBack _unit;
		_sectorUnitsList pushBack _unit;
		{
			_x addCuratorEditableObjects [[_unit],true];
		} forEach allCurators;
		
		_grp setFormDir ((getMarkerPos _sector) getDir _randPos);
		_grp setBehaviour "COMBAT";
		_grp setCombatMode "RED";
	};	
};

fnc_deploy_vehicle = {
	params["_placementAreaPosition", "_placementAreaRadius", "_roadsList", "_crewmanData","_vehicleData","_vehicleList","_sectorUnitsList"];
	
	_possiblePositions = [];
		
	_randSafePos = [_placementAreaPosition, 0,_placementAreaRadius, 10, 0, 0.15] call BIS_fnc_findSafePos;
	if (_randSafePos inArea _sector) then
	{
		_possiblePositions pushBack _randSafePos;
	};
	
	_roadIndex = -1;	
	if (count _roadsList > 0) then
	{
		_roadIndex = floor(random(count _roadsList));
		_roadSegment = _roadsList select _roadIndex;
		
		_possiblePositions pushBack (getPos _roadSegment);
	};
			
	if (count _possiblePositions > 0) then
	{
		_pos = selectRandom _possiblePositions;
		
		if (_roadIndex != -1) then
		{
			if (_pos isEqualTo (getPos (_roadsList select _roadIndex))) then
			{
				_roadsList deleteAt _roadIndex;
			};
		};
	
		_vehClass = _vehicleData select 0;	
		_vehAppearance = _vehicleData select 1;
		_vehPylons = _vehicleData select 2;
		_vehPylonPaths = _vehicleData select 3;
		_vehTurretMagazines = _vehicleData select 4;
		
		_veh = createVehicle [_vehClass, [0,0,2000], [], 0, "NONE"];
		_veh setPosATL [_pos select 0, _pos select 1, 0.5];
		{
			_x addCuratorEditableObjects [[_veh],true];
		} forEach allCurators;
		
		_veh spawn compile _vehAppearance;
		
		{ 
			_veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
		} 
		forEach getPylonMagazines _veh;
		{
			_veh setPylonLoadOut [_forEachIndex + 1, _x, true, _vehPylonPaths select _forEachIndex];
		} forEach _vehPylons;
			
		_veh setDir (_placementAreaPosition getDir _pos);
		
		_veh lock 3;
		
		_grp = createGroup [east,true];	
		
		_crewmanClass = _crewmanData select 0;
		_crewmanLoadout = _crewmanData select 1;	
		
		if ((_veh emptyPositions "Commander") > 0) then
		{
			_unit = _grp createUnit [_crewmanClass,_pos,[],0,"NONE"];
			_unit setUnitLoadout _crewmanLoadout;
			[_unit] execVM "MissionScripts\aiSkill.sqf";
			{
				_x addCuratorEditableObjects [[_unit],true];
			} forEach allCurators;
			
			_unit moveInCommander _veh;
			_sectorUnitsList pushBack _unit;
		};
		
		if ((_veh emptyPositions "Gunner") > 0) then
		{		
			_unit = _grp createUnit [_crewmanClass,_pos,[],0,"NONE"];
			_unit setUnitLoadout _crewmanLoadout;
			[_unit] execVM "MissionScripts\aiSkill.sqf";
			{
				_x addCuratorEditableObjects [[_unit],true];
			} forEach allCurators;
			
			_unit moveInGunner _veh;
			_sectorUnitsList pushBack _unit;
		};
		
		if ((_veh emptyPositions "Driver") > 0) then
		{
			_unit = _grp createUnit [_crewmanClass,_pos,[],0,"NONE"];
			_unit setUnitLoadout _crewmanLoadout;
			[_unit] execVM "MissionScripts\aiSkill.sqf";
			{
				_x addCuratorEditableObjects [[_unit],true];
			} forEach allCurators;
			
			_unit moveInDriver _veh;
			_sectorUnitsList pushBack _unit;
		};
		
		_veh allowCrewInImmobile true;
		_veh setUnloadInCombat [false, false];
		
		_grp addVehicle _veh;	
			
		[_veh] execVM "MissionScripts\redforReplenish.sqf";	
		
		_veh addEventHandler ["Killed",
			{
				{
					_x setDamage 1;
				} forEach crew (_this select 0);
			}
		];
				
		_grp setBehaviour "COMBAT";
		_grp setCombatMode "RED";
		
		_vehicleList pushBack _veh;
	};	
};

fnc_deploy_vehicle_fixedPosition = {
	params["_position", "_direction","_crewmanData","_vehicleData","_vehicleList","_sectorUnitsList"];	
			
	_vehClass = _vehicleData select 0;	
	_vehAppearance = _vehicleData select 1;
	_vehPylons = _vehicleData select 2;
	_vehPylonPaths = _vehicleData select 3;
	_vehTurretMagazines = _vehicleData select 4;
	
	_veh = createVehicle [_vehClass, [0,0,2000], [], 0, "NONE"];
	_veh setPosATL [_position select 0, _position select 1, 0.1];
	{
		_x addCuratorEditableObjects [[_veh],true];
	} forEach allCurators;
	
	_veh spawn compile _vehAppearance;
	
	{ 
		_veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
	} 
	forEach getPylonMagazines _veh;
	{
		_veh setPylonLoadOut [_forEachIndex + 1, _x, true, _vehPylonPaths select _forEachIndex];
	} forEach _vehPylons;
		
	_veh setDir _direction;
	
	_veh lock 3;
	
	_grp = createGroup [east,true];	
	
	_crewmanClass = _crewmanData select 0;
	_crewmanLoadout = _crewmanData select 1;	
	
	if ((_veh emptyPositions "Gunner") > 0) then
	{		
		_unit = _grp createUnit [_crewmanClass,_position,[],0,"NONE"];
		_unit setUnitLoadout _crewmanLoadout;
		[_unit] execVM "MissionScripts\aiSkill.sqf";
		{
			_x addCuratorEditableObjects [[_unit],true];
		} forEach allCurators;
		
		_unit moveInGunner _veh;
		_sectorUnitsList pushBack _unit;
	};	
	
	_veh allowCrewInImmobile true;
	_veh setUnloadInCombat [false, false];
	
	_grp addVehicle _veh;	
		
	[_veh] execVM "MissionScripts\redforReplenish.sqf";	
	
	_veh addEventHandler ["Killed",
		{
			{
				_x setDamage 1;
			} forEach crew (_this select 0);
		}
	];
	
	if (_vehClass == redfor_mortar_deploymentData select 0) then
	{
		_grp setBehaviour "CARELESS";
	}
	else
	{
		_grp setBehaviour "COMBAT";
	};	

	_vehicleList pushBack _veh;	
};

fnc_deploy_compound = {
	params["_position","_radius","_wallData"];	
				
	_class = _wallData select 0;
	_sizeStep = _wallData select 1;	
	
	_xStart = (_position select 0) - _radius;
	_xEnd = (_position select 0) + _radius;
	
	_yStart = (_position select 1) - _radius; 
	_yEnd = (_position select 1) + _radius;	
	
	for "_i" from _xStart to _xEnd step _sizeStep do
	{
		if ((_i < floor((_xStart + _xEnd)/2) - 2 * _sizeStep) 
			or (_i > floor((_xStart + _xEnd)/2) + 2 * _sizeStep)) then		
		{
			_wall = createVehicle [_class, [0,0,2000], [], 0, "NONE"];
			_wall setPosATL [_i, _yStart, 0];
			_wall setDir 0;
			
			_wall = createVehicle [_class, [0,0,2000], [], 0, "NONE"];
			_wall setPosATL [_i, _yEnd, 0];			
			_wall setDir 0;
		};
	};
	
	for "_j" from _yStart to _yEnd step _sizeStep do
	{
		if ((_j < floor((_yStart + _yEnd)/2) - 2 * _sizeStep) 
			or (_j > floor((_yStart + _yEnd)/2) + 2 * _sizeStep)) then		
		{
			_wall = createVehicle [_class, [0,0,2000], [], 0, "NONE"];
			_wall setPosATL [_xStart, _j, 0];
			_wall setDir 90;
			
			_wall = createVehicle [_class, [0,0,2000], [], 0, "NONE"];
			_wall setPosATL [_xEnd, _j, 0];
			_wall setDir 90;
		};		
	};
};

fnc_get_compound_locations = {
	params["_sector", "_roadsList"];

	_compoundLocations = [];
	
	_xAxisStart = ((getMarkerPos _sector) select 0) - ((markerSize _sector) select 0);
	_xAxisEnd = ((getMarkerPos _sector) select 0) + ((markerSize _sector) select 0);
	_yAxisStart = ((getMarkerPos _sector) select 1) - ((markerSize _sector) select 1);
	_yAxisEnd = ((getMarkerPos _sector) select 1) + ((markerSize _sector) select 1);
	
	_step = 2 * redfor_compound_radius;
	
	for "_i" from  _xAxisStart to _xAxisEnd step _step do
	{
		for "_j" from  _yAxisStart to _yAxisEnd step _step do
		{
			if ([_i, _j] inArea [getMarkerPos _sector
								, (markerSize _sector) select 0
								, (markerSize _sector) select 1
								, 0
								, false]) then
			{				
				if (count ([_i, _j, 0] isFlatEmpty [-1, -1, 0.2, redfor_compound_radius]) > 0) then								
				{
					_validPosition = true;					
					
					if (_validPosition) then
					{
						{
							scopeName "roadsLoop";
							if (([_i, _j, 0] distance (getPos _x)) <= (redfor_compound_radius * 2)) then
							{
								_validPosition = false;
								breakOut "roadsLoop";
							};
						} forEach _roadsList;
					};
					
					if (_validPosition) then
					{
						if (([_i, _j] find redfor_deployedCompoundsList) != -1) then
						{
							_validPosition = false;
						};
					};
					
					if (_validPosition) then 
					{
						_compoundLocations pushBack [_i, _j];
					};					
				};
			};				
		};
	};
	
	_compoundLocations
};

_roadsList = (getMarkerPos _sector) nearRoads (((markerSize _sector) select 0));
_compoundLocationsList = [_sector, _roadsList] call fnc_get_compound_locations;

sectorRedforInfantry = [];
sectorRedforVehicles = [];
sectorRedforAA = [];
sectorRedforAT = [];
sectorRedforMortars = [];
sectorRedforSupply = [];
sectorRedforHQ = [];
sectorRedforComms = [];
sectorRedforOfficer = [];
sectorRedforCommandos = [];
sectorRedforSnipers = [];
sectorRedforFieldWeapons = [];
sectorRedforAll = [];

_frontlineForcesDefeatedMessage = false;
_aaDefeatedMessage = false;
_atDefeatedMessage = false;
_mortarsDefeatedMessage = false;
_supplyDefeatedMessage = false;
_hqDefeatedMessage = false;
_commsDefeatedMessage = false;
_officerDefeatedMessage = false;
_commandosDefeatedMessage = false;
_snipersDefeatedMessage = false;
_fieldWeaponsDefeatedMessage = false;

_frontlineForcesDefeated = false;							
_aaDefeated = false;
_atDefeated = false;
_mortarsDefeated = false;
_supplyDefeated = false;
_hqDefeated = false;
_commsDefeated = false;
_officerDefeated = false;
_commandosDefeated = false;
_snipersDefeated = false;
_fieldWeaponsDefeated = false;

_frontLineActive = true;
_aaActive = false;
_atActive = false;
_mortarsActive = false;
_supplyActive = false;
_hqActive = false;
_commsActive = false;
_officerActive = false;
_commandosActive = false;
_snipersActive = false;
_fieldWeaponsActive = false;

_grenadierInfantry = false;
_hqInfantry = false;
_commsInfantry = false;
_supplyInfantry = false;
_atgmInfantry = false;
_aaInfantry = false;
_marksmanInfantry = false;
_fieldWeaponsInfantry = false;

_playerCount = count allPlayers;
_redforFrontlineElementCount = ceil(2 * _playerCount / (count redfor_squad_deploymentData)) + 1;
	
_sideObjectiveList = ["mortars", "aa", "at","supply", "hq", "comms", "officer", "commandos", "snipers", "fieldWeapons"];
_playerCountForObjective = (_playerCount) min 50;
_activeObjectiveCount = floor(random(ceil(_playerCountForObjective / redfor_sector_sideObjectivePlayerCountIncrement))) + 1;

redforDeployedVehicleLevels = [redfor_vehicle_vsHumvee_deploymentData];
redforDeployedReplacementVehicleLevels = [redfor_vehicle_replacement_vsHumvee_deploymentData];

_maximumBluforVehicleLevel = 0;
	
{
	_vehicle = _x select 0;
	_class = typeOf _vehicle;
	
	if ({alive _x} count (crew _vehicle) > 0) then
	{
		_bluforVehicleLevels = [
			[blufor_vehicle_humvee_classes, 1]
			, [blufor_vehicle_mrap_classes, 2]
			, [blufor_vehicle_apc_classes, 3]
			, [blufor_vehicle_ifv_classes, 4]
			, [blufor_vehicle_mbt_classes, 5]
		];
		
		{
			_levelClasses = _x select 0;
			_level = _x select 1;
			
			if (_class in _levelClasses) then
			{
				if (_maximumBluforVehicleLevel < _level) then
				{
					_maximumBluforVehicleLevel = _level;
				};
			};
		} forEach _bluforVehicleLevels;
	};
} forEach blufor_vehicle_deploymentData;

_redforVehicleLevels = [	
	[redfor_vehicle_vsMRAP_deploymentData, redfor_vehicle_replacement_vsMRAP_deploymentData, 2]
	, [redfor_vehicle_vsAPC_deploymentData, redfor_vehicle_replacement_vsAPC_deploymentData, 3]
	, [redfor_vehicle_vsIFV_deploymentData, redfor_vehicle_replacement_vsIFV_deploymentData, 4]
	, [redfor_vehicle_vsMBT_deploymentData, redfor_vehicle_replacement_vsMBT_deploymentData, 5]
];

{
	if ((count (_x select 0) > 0) and (_maximumBluforVehicleLevel >= (_x select 2))) then
	{
		redforDeployedVehicleLevels pushBack (_x select 0);
		redforDeployedReplacementVehicleLevels pushBack (_x select 1);
	};
} forEach _redforVehicleLevels;

_deployLongRangeAA = false;
_deployArmoredAA = false;

if  (_maximumBluforVehicleLevel >= 4) then
{
	_deployArmoredAA = true;
};

{
	_vehicle = _x select 0;
	_class = typeOf _vehicle;
	
	if ({alive _x} count (crew _vehicle) > 0) then
	{
		if (((typeOf _vehicle) in blufor_vehicle_attackRotaryWing_classes) or ((typeOf _vehicle) in blufor_vehicle_attackFixedWing_classes)) then
		{
			_deployLongRangeAA = true;
		};
	};
} forEach blufor_vehicle_deploymentData;

while {_activeObjectiveCount > 0} do
{
	_randomIndex = floor(random (count _sideObjectiveList));	

	switch(_sideObjectiveList select _randomIndex) do
	{
		case "aa" : {_aaActive = true};
		case "at" : {_atActive = true};
		case "mortars" : {_mortarsActive = true};
		case "supply" : {supplyActive = true};
		case "hq" : {_hqActive = true};
		case "comms" : {_commsActive = true};
		case "officer" : {_officerActive = true};
		case "commandos" : {_commandosActive = true};
		case "snipers" : {_snipersActive = true};
		case "fieldWeapons" : {_fieldWeaponsActive = true};
	};
	
	_sideObjectiveList deleteAt _randomIndex;
	
	_activeObjectiveCount = _activeObjectiveCount - 1;	
};

_terrainObjecTypes = ["TREE", "SMALL TREE", "BUSH", "BUILDING", "HOUSE", "FOREST BORDER", "FOREST TRIANGLE", "FOREST SQUARE", "CHURCH", "CHAPEL", "CROSS", "BUNKER", "FORTRESS", "FOUNTAIN", "VIEW-TOWER", "LIGHTHOUSE", "QUAY", "FUELSTATION", "HOSPITAL", "FENCE", "WALL", "HIDE", "BUSSTOP", "ROAD", "FOREST", "TRANSMITTER", "STACK", "RUIN", "TOURISM", "WATERTOWER", "TRACK", "MAIN ROAD", "ROCK", "ROCKS", "POWER LINES", "RAILWAY", "POWERSOLAR", "POWERWAVE", "POWERWIND", "SHIPWRECK", "TRAIL"];

if (_aaActive) then
{
	if ((count _compoundLocationsList > 0) && (_playerCount > 5)) then
	{	
		_randomIndex = floor(random (count _compoundLocationsList));
		_aaArea = _compoundLocationsList select _randomIndex;
		_compoundLocationsList deleteAt _randomIndex;
		redfor_deployedCompoundsList pushBack _aaArea;
					
		{_x hideObjectGlobal true} count nearestTerrainObjects [_aaArea, _terrainObjecTypes, redfor_compound_radius * 1.5, false, false];

		_aaPositions = [
			[[(_aaArea select 0), (_aaArea select 1) + 0.5 * redfor_compound_radius], 0]
			, [[(_aaArea select 0), (_aaArea select 1) - 0.5 * redfor_compound_radius], 180]
			, [[(_aaArea select 0) + 0.5 * redfor_compound_radius, (_aaArea select 1)], 90]
			, [[(_aaArea select 0) - 0.5 * redfor_compound_radius, (_aaArea select 1)], 270]
		];
		
		_aaDeploymentData = [];
		
		if (_deployArmoredAA) then
		{
			if (_deployLongRangeAA) then
			{
				_aaDeploymentData = redfor_spSAMAA_deploymentData;
			}
			else
			{
				_aaDeploymentData = redfor_spGunAA_deploymentData;
			};
		}
		else
		{
			if (_deployLongRangeAA) then
			{
				_aaDeploymentData = redfor_samAA_deploymentData;
			}
			else
			{
				_aaDeploymentData = redfor_gunAA_deploymentData;
			};
		};

		for "_i" from 1 to 3 do
		{
			_randomIndex = floor(random (count _aaPositions));
			_aaPosition = _aaPositions select _randomIndex;
			_aaPositions deleteAt _randomIndex;
			
			[_aaPosition select 0
				, _aaPosition select 1
				, redfor_crewman_deploymentData
				, _aaDeploymentData
				, sectorRedforAA
				, sectorRedforAll] call fnc_deploy_vehicle_fixedPosition;
		};
	}
	else
	{
		_aaInfantry = true;
		if (_deployLongRangeAA) then
		{
			[_sector, redfor_infantryAALong_deploymentData, sectorRedforAA, ["open"], sectorRedforAll] call fnc_deploy_infantry;	
		}
		else
		{
			[_sector, redfor_infantryAAShort_deploymentData, sectorRedforAA, ["open"], sectorRedforAll] call fnc_deploy_infantry;	
		};		
	};	
};

if (_atActive) then
{
	
	if ((count _compoundLocationsList > 0) && (_playerCount > 5)) then
	{	
		_randomIndex = floor(random (count _compoundLocationsList));
		_atArea = _compoundLocationsList select _randomIndex;
		_compoundLocationsList deleteAt _randomIndex;
		redfor_deployedCompoundsList pushBack _atArea;
		
		{_x hideObjectGlobal true} count nearestTerrainObjects [_atArea, _terrainObjecTypes, redfor_compound_radius * 1.5, false, false];

		_atPositions = [
			[[(_atArea select 0), (_atArea select 1) + 0.5 * redfor_compound_radius], 0]
			, [[(_atArea select 0), (_atArea select 1) - 0.5 * redfor_compound_radius], 180]
			, [[(_atArea select 0) + 0.5 * redfor_compound_radius, (_atArea select 1)], 90]
			, [[(_atArea select 0) - 0.5 * redfor_compound_radius, (_atArea select 1)], 270]
		];

		for "_i" from 1 to 3 do
		{
			_randomIndex = floor(random (count _atPositions));
			_atPosition = _atPositions select _randomIndex;
			_atPositions deleteAt _randomIndex;
			
			[_atPosition select 0
				, _atPosition select 1
				, redfor_crewman_deploymentData
				, redfor_atgm_deploymentData
				, sectorRedforAT
				, sectorRedforAll] call fnc_deploy_vehicle_fixedPosition;
		};		
	}
	else
	{
		_atgmInfantry = true;
		[_sector, redfor_infantryATGM_deploymentData, sectorRedforAT, ["open"], sectorRedforAll] call fnc_deploy_infantry;	
		{		
			_x addEventHandler ["Killed", {
				 removeAllWeapons (_this select 0);
			}];
		} forEach sectorRedforAT;
	};	
};

if (_mortarsActive) then
{
	if ((count _compoundLocationsList > 0) && (_playerCount > 5)) then
	{	
		_randomIndex = floor(random (count _compoundLocationsList));
		_mortarArea = _compoundLocationsList select _randomIndex;
		_compoundLocationsList deleteAt _randomIndex;
		redfor_deployedCompoundsList pushBack _mortarArea;

		{_x hideObjectGlobal true} count nearestTerrainObjects [_mortarArea, _terrainObjecTypes, redfor_compound_radius * 1.5, false, false];

		[_mortarArea, redfor_compound_radius, redfor_compoundWall_deploymentData] call fnc_deploy_compound;

		_mortarPositions = [
			[[(_mortarArea select 0), (_mortarArea select 1) + 0.5 * redfor_compound_radius], 0]
			, [[(_mortarArea select 0), (_mortarArea select 1) - 0.5 * redfor_compound_radius], 180]
			, [[(_mortarArea select 0) + 0.5 * redfor_compound_radius, (_mortarArea select 1)], 90]
			, [[(_mortarArea select 0) - 0.5 * redfor_compound_radius, (_mortarArea select 1)], 270]
		];

		for "_i" from 1 to 3 do
		{
			_randomIndex = floor(random (count _mortarPositions));
			_mortarPosition = _mortarPositions select _randomIndex;
			_mortarPositions deleteAt _randomIndex;

			[_mortarPosition select 0
				, _mortarPosition select 1
				, redfor_crewman_deploymentData
				, redfor_mortar_deploymentData
				, sectorRedforMortars
				, sectorRedforAll] call fnc_deploy_vehicle_fixedPosition;
		};		
	}
	else
	{
		_grenadierInfantry = true;
		[_sector, redfor_grenadier_deploymentData, sectorRedforMortars, ["open"], sectorRedforAll] call fnc_deploy_infantry;			
	};
};

if (_fieldWeaponsActive) then
{
	if ((count _compoundLocationsList > 0) && (_playerCount > 5)) then
	{	
		_randomIndex = floor(random (count _compoundLocationsList));
		_fieldWeaponArea = _compoundLocationsList select _randomIndex;
		_compoundLocationsList deleteAt _randomIndex;
		redfor_deployedCompoundsList pushBack _fieldWeaponArea;

		{_x hideObjectGlobal true} count nearestTerrainObjects [_fieldWeaponArea, _terrainObjecTypes, redfor_compound_radius * 1.5, false, false];

		[_fieldWeaponArea, redfor_compound_radius, redfor_compoundWall_deploymentData] call fnc_deploy_compound;

		_fieldWeaponPositions = [
			[[(_fieldWeaponArea select 0), (_fieldWeaponArea select 1) + 0.5 * redfor_compound_radius], 0]
			, [[(_fieldWeaponArea select 0), (_fieldWeaponArea select 1) - 0.5 * redfor_compound_radius], 180]
			, [[(_fieldWeaponArea select 0) + 0.5 * redfor_compound_radius, (_fieldWeaponArea select 1)], 90]
			, [[(_fieldWeaponArea select 0) - 0.5 * redfor_compound_radius, (_fieldWeaponArea select 1)], 270]
		];

		for "_i" from 1 to 3 do
		{
			_randomIndex = floor(random (count _fieldWeaponPositions));
			_fieldWeaponPosition = _fieldWeaponPositions select _randomIndex;
			_fieldWeaponPositions deleteAt _randomIndex;

			[_fieldWeaponPosition select 0
				, _fieldWeaponPosition select 1
				, redfor_crewman_deploymentData
				, redfor_fieldGun_deploymentData
				, sectorRedforFieldWeapons
				, sectorRedforAll] call fnc_deploy_vehicle_fixedPosition;
		};
	}
	else
	{
		_fieldWeaponsInfantry = true;
		[_sector, redfor_weaponsTeam_deploymentData, sectorRedforFieldWeapons, ["open"], sectorRedforAll] call fnc_deploy_infantry;			
	};
};

if (_supplyActive) then
{
	if ((count _compoundLocationsList > 0) && (_playerCount > 5)) then
	{	
		_randomIndex = floor(random (count _compoundLocationsList));
		_supplyDepotArea = _compoundLocationsList select _randomIndex;
		_compoundLocationsList deleteAt _randomIndex;
		redfor_deployedCompoundsList pushBack _supplyDepotArea;
		
		{_x hideObjectGlobal true} count nearestTerrainObjects [_supplyDepotArea, _terrainObjecTypes, redfor_compound_radius * 1.5, false, false];

		[_supplyDepotArea, redfor_compound_radius, redfor_compoundWall_deploymentData] call fnc_deploy_compound;

		_supplyDepotPositions = [
			[[(_supplyDepotArea select 0), (_supplyDepotArea select 1) + 0.5 * redfor_compound_radius], 0]
			, [[(_supplyDepotArea select 0), (_supplyDepotArea select 1) - 0.5 * redfor_compound_radius], 180]
			, [[(_supplyDepotArea select 0) + 0.5 * redfor_compound_radius, (_supplyDepotArea select 1)], 90]
			, [[(_supplyDepotArea select 0) - 0.5 * redfor_compound_radius, (_supplyDepotArea select 1)], 270]
		];

		for "_i" from 1 to 3 do
		{
			_randomIndex = floor(random (count _supplyDepotPositions));
			_supplyDepotPosition = _supplyDepotPositions select _randomIndex;
			_supplyDepotPositions deleteAt _randomIndex;

			[_supplyDepotPosition select 0
				, _supplyDepotPosition select 1
				, redfor_crewman_deploymentData
				, redfor_supply_deploymentData
				, sectorRedforSupply
				, sectorRedforAll] call fnc_deploy_vehicle_fixedPosition;
		};
	}
	else
	{
		_supplyInfantry = true;		
	};
};

if (_hqActive) then
{
	if ((count _compoundLocationsList > 0) && (_playerCount > 5)) then
	{	
		_randomIndex = floor(random (count _compoundLocationsList));
		_hqArea = _compoundLocationsList select _randomIndex;
		_compoundLocationsList deleteAt _randomIndex;
		redfor_deployedCompoundsList pushBack _hqArea;
		
		{_x hideObjectGlobal true} count nearestTerrainObjects [_hqArea, _terrainObjecTypes, redfor_compound_radius * 1.5, false, false];

		[_hqArea, redfor_compound_radius, redfor_compoundWall_deploymentData] call fnc_deploy_compound;

		_hqPositions = [
			[[(_hqArea select 0), (_hqArea select 1) + 0.5 * redfor_compound_radius], 0]
			, [[(_hqArea select 0), (_hqArea select 1) - 0.5 * redfor_compound_radius], 180]
			, [[(_hqArea select 0) + 0.5 * redfor_compound_radius, (_hqArea select 1)], 90]
			, [[(_hqArea select 0) - 0.5 * redfor_compound_radius, (_hqArea select 1)], 270]
		];

		for "_i" from 1 to 3 do
		{
			_randomIndex = floor(random (count _hqPositions));
			_hqPosition = _hqPositions select _randomIndex;
			_hqPositions deleteAt _randomIndex;

			[_hqPosition select 0
				, _hqPosition select 1
				, redfor_crewman_deploymentData
				, redfor_hq_deploymentData
				, sectorRedforHQ
				, sectorRedforAll] call fnc_deploy_vehicle_fixedPosition;
		};		
	}
	else
	{
		_hqInfantry = true;		
	};	
};

if (_commsActive) then
{
	if ((count _compoundLocationsList > 0) && (_playerCount > 5)) then
	{	
		_randomIndex = floor(random (count _compoundLocationsList));
		_commsArea = _compoundLocationsList select _randomIndex;
		_compoundLocationsList deleteAt _randomIndex;
		redfor_deployedCompoundsList pushBack _commsArea;
		
		{_x hideObjectGlobal true} count nearestTerrainObjects [_commsArea, _terrainObjecTypes, redfor_compound_radius * 1.5, false, false];

		[_commsArea, redfor_compound_radius, redfor_compoundWall_deploymentData] call fnc_deploy_compound;

		_commsPositions = [
			[[(_commsArea select 0), (_commsArea select 1) + 0.5 * redfor_compound_radius], 0]
			, [[(_commsArea select 0), (_commsArea select 1) - 0.5 * redfor_compound_radius], 180]
			, [[(_commsArea select 0) + 0.5 * redfor_compound_radius, (_commsArea select 1)], 90]
			, [[(_commsArea select 0) - 0.5 * redfor_compound_radius, (_commsArea select 1)], 270]
		];

		for "_i" from 1 to 3 do
		{
			_randomIndex = floor(random (count _commsPositions));
			_commPosition = _commsPositions select _randomIndex;
			_commsPositions deleteAt _randomIndex;

			[_commPosition select 0
				, _commPosition select 1
				, redfor_crewman_deploymentData
				, redfor_commTower_deploymentData
				, sectorRedforComms
				, sectorRedforAll] call fnc_deploy_vehicle_fixedPosition;
		};
		
	}
	else
	{		
		_commsInfantry = true;
	};
};

garrisonableBuildings = [];
garrisonPositions = [];
allBuildings = ((getMarkerPos _sector) nearObjects ["Building", (markerSize _sector) select 0]) select {(count ([_x] call BIS_fnc_buildingPositions) >= 1)};

{
	if ((count ([_x] call BIS_fnc_buildingPositions) >= count redfor_squad_deploymentData) and (!isObjectHidden _x)) then
	{
		garrisonableBuildings pushback _x;
		garrisonPositions pushBack ([_x] call BIS_fnc_buildingPositions);
	};		
} forEach allBuildings;

if (_officerActive) then
{
	[_sector, redfor_squad_deploymentData, redfor_officer_deploymentData, sectorRedforOfficer, sectorRedforAll] call fnc_deploy_officerAndRetinue;
};

if (_commandosActive) then
{
	[_sector, redfor_commando_deploymentData, sectorRedforCommandos, ["garrison","open"], sectorRedforAll] call fnc_deploy_infantry;	
	{		
		_x addEventHandler ["Killed", {
			 removeAllWeapons (_this select 0);
		}];
	} forEach sectorRedforCommandos;	
};

if (_snipersActive) then
{	
	if (count allBuildings > 0) then
	{
		_marksmanInfantry = true;
		[_sector, redfor_marksman_deploymentData, sectorRedforSnipers, ["garrison"], sectorRedforAll] call fnc_deploy_infantry;	
		{		
			_x addEventHandler ["Killed", {
				 removeAllWeapons (_this select 0);
			}];
		} forEach sectorRedforSnipers;
	}
	else
	{
		[_sector, redfor_sniper_deploymentData, sectorRedforSnipers, ["open"], sectorRedforAll] call fnc_deploy_infantry;	
		{		
			_x addEventHandler ["Killed", {
				 removeAllWeapons (_this select 0);
			}];
		} forEach sectorRedforSnipers;
	};		
};

if (_hqInfantry) then
{	
	[_sector, redfor_hqStaff_deploymentData, sectorRedforHQ, ["garrison","open"], sectorRedforAll] call fnc_deploy_infantry;	
};

if (_commsInfantry) then
{	
	[_sector, redfor_commSpecialist_deploymentData, sectorRedforComms, ["garrison","open"], sectorRedforAll] call fnc_deploy_infantry;	
};

if (_supplyInfantry) then
{	
	[_sector, redfor_logisticsSpecialist_deploymentData, sectorRedforSupply, ["garrison","open"], sectorRedforAll] call fnc_deploy_infantry;	
};

for "_i" from 1 to _redforFrontlineElementCount do
{
	_vehicleDeploymentData = selectRandom redforDeployedVehicleLevels;	
	[getMarkerPos _sector, (markerSize _sector) select 0, _roadsList, redfor_crewman_deploymentData, _vehicleDeploymentData, sectorRedforVehicles, sectorRedforAll] call fnc_deploy_vehicle;		
};

for "_i" from 1 to _redforFrontlineElementCount do
{
	[_sector, redfor_squad_deploymentData, sectorRedforInfantry, ["garrison","open"], sectorRedforAll] call fnc_deploy_infantry;	
};

while {true} do
{
	scopeName "engagementLoop";

	_frontlineForcesDefeated = (({alive _x && (_x inArea _sector)} count sectorRedforInfantry <= 0.15 * (count sectorRedforInfantry))
							and ({(alive gunner _x) && ((gunner _x) inArea _sector)} count sectorRedforVehicles <= 0.15 * (count sectorRedforVehicles)));	
	if (_aaActive) then
	{
		_aaDefeated = ({((alive _x) && (_x inArea _sector)) || ((alive (vehicle _x)) && (alive gunner (vehicle _x)) && ((gunner (vehicle _x)) inArea _sector))} count sectorRedforAA == 0);	
	}
	else
	{
		_aaDefeated = true;	
		_aaDefeatedMessage = true;
	};	
	
	if (_atActive) then
	{
		_atDefeated = ({((alive _x) && (_x inArea _sector)) || ((alive (vehicle _x)) && (alive gunner (vehicle _x)) && ((gunner (vehicle _x)) inArea _sector))} count sectorRedforAT == 0);	
	}
	else
	{
		_atDefeated = true;	
		_atDefeatedMessage = true;
	};	
	
	if (_mortarsActive) then
	{
		_mortarsDefeated = ({((alive _x) && (_x inArea _sector)) || ((alive (vehicle _x)) && (alive gunner (vehicle _x)) && ((gunner (vehicle _x)) inArea _sector))} count sectorRedforMortars == 0);		
	}
	else
	{
		_mortarsDefeated = true;	
		_mortarsDefeatedMessage = true;
	};	
	
	if (_fieldWeaponsActive) then
	{
		_fieldWeaponsDefeated = ({((alive _x) && (_x inArea _sector)) || ((alive (vehicle _x)) && (alive gunner (vehicle _x)) && ((gunner (vehicle _x)) inArea _sector))} count sectorRedforFieldWeapons == 0);		
	}
	else
	{
		_fieldWeaponsDefeated = true;	
		_fieldWeaponsDefeatedMessage = true;
	};	
	
	if (_supplyActive) then
	{
		_supplyDefeated = ({((alive _x) && (_x inArea _sector)) || ((alive (vehicle _x)) && (alive gunner (vehicle _x)) && ((gunner (vehicle _x)) inArea _sector))} count sectorRedforSupply == 0);	
	}
	else
	{
		_supplyDefeated = true;	
		_supplyDefeatedMessage = true;
	};	
	
	if (_hqActive) then
	{
		_hqDefeated = ({((alive _x) && (_x inArea _sector)) || ((alive (vehicle _x)) && (alive gunner (vehicle _x)) && ((gunner (vehicle _x)) inArea _sector))} count sectorRedforHQ == 0);	
	}
	else
	{
		_hqDefeated = true;	
		_hqDefeatedMessage = true;
	};	
	
	if (_commsActive) then
	{
		_commsDefeated = ({((alive _x) && (_x inArea _sector)) || ((alive (vehicle _x)) && (alive gunner (vehicle _x)) && ((gunner (vehicle _x)) inArea _sector))} count sectorRedforComms == 0);	
	}
	else
	{
		_commsDefeated = true;	
		_commsDefeatedMessage = true;
	};	
	
	if (_officerActive) then
	{
		_officerDefeated = ({(alive _x) && (_x inArea _sector)} count sectorRedforOfficer == 0);	
	}
	else
	{
		_officerDefeated = true;	
		_officerDefeatedMessage = true;
	};	
	
	if (_commandosActive) then
	{
		_commandosDefeated = ({(alive _x) && (_x inArea _sector)} count sectorRedforCommandos == 0);
	}
	else
	{
		_commandosDefeated = true;	
		_commandosDefeatedMessage = true;
	};	
	
	if (_snipersActive) then
	{
		_snipersDefeated = ({(alive _x) && (_x inArea _sector)} count sectorRedforSnipers == 0);
	}
	else
	{
		_snipersDefeated = true;	
		_snipersDefeatedMessage = true;
	};	
	
	if (_frontlineForcesDefeated and !_frontlineForcesDefeatedMessage) then
	{
		["TaskSucceeded",["","FRONTLINE FORCES DEFEATED"]] remoteExec ["BIS_fnc_showNotification",0];
		_frontlineForcesDefeatedMessage = true;
		sleep 2;
	};	
	
	if (_aaDefeated and !_aaDefeatedMessage) then
	{
		if (_aaInfantry) then
		{
			["TaskSucceeded",["","MANPADS SECTION ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];		
		}
		else
		{
			["TaskSucceeded",["","ANTI-AIR SECTION ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];			
		};		
		_aaDefeatedMessage = true;
		sleep 2;
	};	
	
	if (_atDefeated and !_atDefeatedMessage) then
	{
		if (_atgmInfantry) then
		{
			["TaskSucceeded",["","ATGM INFANTRY SECTION ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];
		}
		else
		{
			["TaskSucceeded",["","ANTI-TANK SECTION ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];
		};		
		_atDefeatedMessage = true;
		sleep 2;
	};	
	
	if (_mortarsDefeated and !_mortarsDefeatedMessage) then
	{
		if (_grenadierInfantry) then 
		{
			["TaskSucceeded",["","GRENADIER SECTION ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];
		}
		else
		{
			["TaskSucceeded",["","MORTAR SECTION ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];
		};		
		_mortarsDefeatedMessage = true;
		sleep 2;
	};	
	
	
	if (_fieldWeaponsDefeated and !_fieldWeaponsDefeatedMessage) then
	{
		if (_fieldWeaponsInfantry) then
		{
			["TaskSucceeded",["","WEAPONS TEAM ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];
		}
		else
		{
			["TaskSucceeded",["","FIELD GUN SECTION ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];
		};		
		_fieldWeaponsDefeatedMessage = true;
		sleep 2;
	};
	
	if (_supplyDefeated and !_supplyDefeatedMessage) then
	{
		if (_supplyInfantry) then
		{
			["TaskSucceeded",["","LOGISTICS TEAM ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];
		}
		else
		{
			["TaskSucceeded",["","SUPPLY DEPOT DESTROYED"]] remoteExec ["BIS_fnc_showNotification",0];
		};		
		_supplyDefeatedMessage = true;
		sleep 2;
	};	
	
	if (_hqDefeated and !_hqDefeatedMessage) then
	{
		if (_hqInfantry) then
		{
			["TaskSucceeded",["","COMMAND TEAM ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];
		}
		else
		{
			["TaskSucceeded",["","HEADQUARTERS DESTROYED"]] remoteExec ["BIS_fnc_showNotification",0];
		};		
		_hqDefeatedMessage = true;
		sleep 2;
	};	
	
	if (_commsDefeated and !_commsDefeatedMessage) then
	{
		if (_commsInfantry) then
		{
			["TaskSucceeded",["","COMM TEAM ELIMINATED"]] remoteExec ["BIS_fnc_showNotification",0];
		}
		else
		{
			["TaskSucceeded",["","COMM TOWERS DESTROYED"]] remoteExec ["BIS_fnc_showNotification",0];
		};		
		_commsDefeatedMessage = true;
		sleep 2;
	};
	
	if (_officerDefeated and !_officerDefeatedMessage) then
	{
		["TaskSucceeded",["","OFFICER NEUTRALIZED"]] remoteExec ["BIS_fnc_showNotification",0];
		_officerDefeatedMessage = true;
		sleep 2;
	};
	
	if (_commandosDefeated and !_commandosDefeatedMessage) then
	{
		["TaskSucceeded",["","COMMANDO TEAM NEUTRALIZED"]] remoteExec ["BIS_fnc_showNotification",0];
		_commandosDefeatedMessage = true;
		sleep 2;
	};
	
	if (_snipersDefeated and !_snipersDefeatedMessage) then
	{
		if (_marksmanInfantry) then
		{
			["TaskSucceeded",["","MARKSMAN TEAM NEUTRALIZED"]] remoteExec ["BIS_fnc_showNotification",0];
		}
		else
		{
			["TaskSucceeded",["","SNIPER TEAM NEUTRALIZED"]] remoteExec ["BIS_fnc_showNotification",0];
		};		
		_snipersDefeatedMessage = true;
		sleep 2;
	};	
	
	if (_frontlineForcesDefeated 
			and _aaDefeated
			and _atDefeated
			and _mortarsDefeated
			and _supplyDefeated
			and _hqDefeated
			and _commsDefeated
			and _officerDefeated
			and _commandosDefeated
			and _snipersDefeated
			and _fieldWeaponsDefeated) then
	{
		breakOut "engagementLoop";
	};	
	
	sleep 5;
};

{
	vehicle _x setDamage 1;
	_x setDamage 1;
} forEach sectorRedforAll;