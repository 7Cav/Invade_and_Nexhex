/*
    File: fn_calculateForce.sqf
    Author: 7th Cav Dev Team

    Description:
        Checks populated player and roles to determine type of OPFOR to spawn.

    Parameter(s):
        _objectiveType [STRING] : Type of objective to spawn AI for. main, side
        _type [STRING] : infantry, lightVehicle, mediumVehicle, heavyVehicle, rotary, fixedwing

    Returns:
        Number of AI to create.

    Example:
    [_objectiveType,_type] call cav_fnc_calculateForce;
    
*/

params [["_objectiveType","main"],"_type"];

_players = count (allPlayers - entities "HeadlessClient_F");
_infantryMultiplier = 3;
_infantryMinimum = 20;

_results = switch (_type) do {

    case "infantry"         : {(_players * _infantryMultiplier) max _infantryMinimum;};
    case "lightVehicle"     : {systemChat "'_type' not found.";};
    case "mediumVehicle"    : {systemChat "'_type' not found.";};
    case "heavyVehicle"     : {systemChat "'_type' not found.";};
    case "rotary"           : {systemChat "'_type' not found.";};
    case "fixedwing"        : {systemChat "'_type' not found.";};
    default {systemChat "'_type' not found.";};
};

_results
//_rf_light_vehicle_pool
//_rf_medium_vehicle_pool
//_rf_heavy_vehicle_pool
//_rf_rotary_pool
//_rf_fixedwing_pool