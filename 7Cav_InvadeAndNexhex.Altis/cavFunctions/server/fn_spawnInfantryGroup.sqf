/*
    File: fn_spawnInfantryGroup.sqf
    Author: 7th Cav Dev Team

    Description:
        Takes parameters and spawns infantry units per the loaded preset, grouping them and applying some mission related logic.

    EXAMPLE: [rf_fireteam,nil,position player] call cav_fnc_spawnInfantryGroup;

    Parameter(s):
        _units [ARRAY] : The list of units to create.
            Type Definitions:
            1: Sentry Team (2 Units)
            2: Fireteam (4 Units)
            3: Squad (9 Units)
            4: HQ Team (4 Units)
            5: Heavy Weapons Team (Gun) (4 Units)
            6: Heavy Weapons Team (AT) (4 Units)
            7: Heavy Weapons Team (AA) (4 Units)
        _type [INT] : - Defines special behavior for certain units in specific situations.
            Type Definitions:
                WIP
        _creationPoint [ARRAY] : The place where the group will be spawned.


    Returns:
        _createdGroup

    Example:
    [_units,nil,_activeAO] call cav_fnc_spawnInfantryGroup;

*/

// Spawn Units
params ["_units",["_type",nil],"_creationPoint"];

_createdUnits = [];
_createdGroup = createGroup [east,true];

{
   _unit = _createdGroup createUnit [_x,_creationPoint,[],5,"none"];
   _createdUnits pushback _unit;
} forEach _units;

_createdUnits joinSilent _createdGroup;

[_createdGroup] call cav_fnc_handleAI;

_createdGroup


