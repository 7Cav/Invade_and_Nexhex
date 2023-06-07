/*
    File: fn_spawnObjective.sqf
    Author: 7th Cav Dev Team

    Description:
        Creates objective for AO clearing.

    Parameter(s):
        _objectiveType [STRING] : Objective type.

    Returns:
        Nothing

    Example:
    ["patrolElim"] call cav_fnc_spawnObjective;
    
*/

params ["_objectiveType"];

_results = switch (_objectiveType) do {

    case "patrolElim"         : {[] spawn cav_fnc_patrolElim;};
    default {[] spawn cav_fnc_patrolElim;};
};