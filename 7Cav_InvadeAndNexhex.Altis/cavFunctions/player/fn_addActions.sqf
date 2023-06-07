/*
    File: fn_addActions.sqf
    Author: 7th Cav Dev Team

    Description:
        Adds pertinent actions for the mission file to the start base crate.

    Parameter(s):
        None

    Returns:
        Nothing

    Example:
    [] call cav_fnc_addActions;
    
*/

base_crate addAction [
    "PARACHUTE SELF-INSERT",
    {[_this select 1] call cav_fnc_halo;}, 
    nil,
    1.5,
    true,
    true,
    "",                 
    "((_target distance _this) <= 10)" 
];

base_crate addAction [
    "Vehicle Spawner",
    {[_this select 1] call cav_fnc_createSpawner;}, 
    nil,
    1.4,
    true,
    true,
    "",                 
    "((_target distance _this) <= 10)"
];

