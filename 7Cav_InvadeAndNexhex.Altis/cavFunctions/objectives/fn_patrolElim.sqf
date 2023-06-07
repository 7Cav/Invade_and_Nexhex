/*
    File: fn_patrolElim.sqf
    Author: 7th Cav Dev Team

    Description:
        Objective file. Players are tasked with eliminating enemy OPFOR.

    Parameter(s):
        none [var_type] : description

    Returns:
        Nothing

    Example:
    [] call cav_fnc_patrolElim;
    
*/
_infantryArray = [];
_reinforcements = 0;
_createdGroups = [];
_victoryCondition = false;
_distance = 400;

//Create AO Forces
_infantryPool = ["main","infantry"] call cav_fnc_calculateForce;

_randomPos = [[[ao_marker_location,_distance]],["water"]] call BIS_fnc_randomPos;
_infantryArray = [_randomPos,75,_infantryPool,0,0,0,0,0] call cav_fnc_spawnForce;

_reinforcements = _infantryArray select 0;
_createdGroups = _infantryArray select 1;

{

    [_x, getPos (leader _x), 100,4] call lambs_wp_fnc_taskPatrol;

} forEach _createdGroups;

_taskID = format ["ePatrol_%1",str time];

[true,_taskID,["Eliminate the enemy patrol force.","Eliminate Enemy Patrol",""],ao_marker_location,"ASSIGNED",1,true,"attack",true] call BIS_fnc_taskCreate;

while {!_victoryCondition} do {

    if (count units east > 0) then {_victoryCondition = false;} else {_victoryCondition = true;};
    sleep 5;

};

[_taskID,"SUCCEEDED",true] call BIS_fnc_taskSetState;

[null,_taskID] spawn cav_fnc_missionGenerate;
