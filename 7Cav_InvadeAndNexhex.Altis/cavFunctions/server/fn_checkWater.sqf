/*
    File: fn_checkWater.sqf
    Author: 7th Cav Dev Team

    Description:
        Used to check AO creation for nearby water.

    Parameter(s):
        _xCoord [INT] : Width of AO
        _yCoord [INT] : Height of AO
        _aoPosition [ARRAY] : Potential AO creation location.

    Returns:
        Boolean: True = AO is too close to water.

    Example:
    _waterCheck = [_xCoord,_yCoord,_aoPosition] call cav_fnc_checkWater;

*/

params ["_xCoord","_yCoord","_aoPosition"];

_safetyMargin = 0.85;
_xSafety = ceil (_xCoord * _safetyMargin);
_ySafety = ceil (_yCoord * _safetyMargin);

_nCheck = surfaceIsWater [  (_aoPosition select 0),             (_aoPosition select 1)+ _ySafety]; 
_neCheck = surfaceIsWater [ (_aoPosition select 0) + _xSafety,    (_aoPosition select 1)+ _ySafety]; 
_eCheck = surfaceIsWater [  (_aoPosition select 0) + _xSafety,    (_aoPosition select 1)]; 
_seCheck = surfaceIsWater [ (_aoPosition select 0) + _xSafety,    (_aoPosition select 1)- _ySafety]; 
_sCheck = surfaceIsWater [  (_aoPosition select 0),             (_aoPosition select 1)- _ySafety]; 
_swCheck = surfaceIsWater [ (_aoPosition select 0) - _xSafety,    (_aoPosition select 1)- _ySafety]; 
_wCheck = surfaceIsWater [  (_aoPosition select 0) - _xSafety,    (_aoPosition select 1)]; 
_nwCheck = surfaceIsWater [ (_aoPosition select 0) - _xSafety,    (_aoPosition select 1)+ _ySafety]; 
 
_resultArray = [_nCheck,_neCheck,_eCheck,_seCheck,_sCheck,_swCheck,_wCheck,_nwCheck];
_waterCount = 0;

{

    if(_x) then {

        _waterCount = _waterCount + 1

    } else {

        _waterCount

    };

} forEach _resultArray;

_results = if(_waterCount > 2) then {

    true

} else {

    false

};

_results