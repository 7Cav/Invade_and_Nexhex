/*
    File: fn_spawnForce.sqf
    Author: 7th Cav Dev Team

    Description:
        Controller script for AO spawns.

    Parameter(s):
        _spawnPosition [POSITION] : Target location for script.
        _distance [INT] : Distance param to pass to spawners.
        _infantryPool [INT] : Quanity of asset to spawn.
        _lightPool [INT] : Quanity of asset to spawn.
        _mediumPool [INT] : Quanity of asset to spawn.
        _heavyPool [INT] : Quanity of asset to spawn.
        _rotaryPool [INT] : Quanity of asset to spawn.
        _fixedwingPool [INT] : Quanity of asset to spawn.

    Returns:
        ARRAY - Detailing reinforcements for each AO & list of created groups.

    Example:
    [ao_marker_location,100,20,2,2,0,0,0] call cav_fnc_spawnForce;
    
*/

params [["_spawnPosition",ao_marker_location],["_distance",0],["_infantryPool",0],["_lightPool",0],["_mediumPool",0],["_heavyPool",0],["_rotaryPool",0],["_fixedwingPool",0]];

//Infantry

_rf_ao_infantry_reinforcements = 0;
_rf_createdInfantryGroups = [];

_rf_ao_infantry_reinforcements = if (_infantryPool > cav_max_rf_infantry) then {
    
                                    _infantryPool - cav_max_rf_infantry

                                } else {

                                0

                                };

_infantryPool = if (_infantryPool > cav_max_rf_infantry) then { cav_max_rf_infantry } else { _infantryPool };

while {_infantryPool >= 8} do {

    _randomPos = [[[_spawnPosition,_distance]],["water"]] call BIS_fnc_randomPos;
    _createdSquad = [rf_squad,nil,_randomPos] call cav_fnc_spawnInfantryGroup;
    _infantryPool = _infantryPool - 8;
    _rf_createdInfantryGroups pushback _createdSquad;

    };

while {_infantryPool >= 4} do {

    _randomPos = [[[_spawnPosition,_distance]],["water"]] call BIS_fnc_randomPos;
    _createdSquad = [rf_fireteam,nil,_randomPos] call cav_fnc_spawnInfantryGroup;
    _infantryPool = _infantryPool - 4;
    _rf_createdInfantryGroups pushback _createdSquad;
    };

while {_infantryPool >= 2} do {

    _randomPos = [[[_spawnPosition,_distance]],["water"]] call BIS_fnc_randomPos;
    _createdSquad = [rf_sentry_team,nil,_randomPos] call cav_fnc_spawnInfantryGroup;
    _infantryPool = _infantryPool - 2;
    _rf_createdInfantryGroups pushback _createdSquad;
    };

_infantryPool = 0;

_returnArray = [_rf_ao_infantry_reinforcements,_rf_createdInfantryGroups];

_returnArray