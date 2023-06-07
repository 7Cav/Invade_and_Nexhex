zeus_whitelist = [];
[
    {
        params ["_args"];
        _args params [];

        zeus_whitelist = "cavzeus" callExtension "";
        publicVariable "zeus_whitelist";

    }, 60, []
] call CBA_fnc_addPerFrameHandler;

addMissionEventHandler ["PlayerDisconnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	
	_unit = _uid call BIS_fnc_getUnitByUID;
	_zeusModule = getAssignedCuratorLogic _unit;
	_zeusGroup = group _zeusModule;
	unassignCurator _zeusModule;
	deleteVehicle _zeusModule;
	deleteGroup _zeusGroup;	
}];

setDate [2020, 6, 26, floor(random 24), 00];


[] execVM "MissionScripts\cleanup.sqf";
[] execVM "MissionScripts\fogKiller.sqf";

waitUntil {!isNil "ao_x_size" && !isNil "ao_y_size"};
[ao_x_size,ao_y_size] spawn cav_fnc_createAO;