/*
    File: fn_createAO.sqf
    Author: 7th Cav Dev Team

    Description:
        Creates a new AO and starts the primary mission chain.

    Parameter(s):
        _xCoord [INT] : x dimension of AO.
        _yCoord [INT] : y dimension of AO.

    Returns:
        Nothing

    Example:
    [500,500,2.5,2] call cav_fnc_createAO;

*/

params [["_xCoord",500],["_yCoord",500]];

//Create AO Markers & Find Suitable Position
_result = true;

while {_result} do {

    ao_marker_location = [nil, ["water"]] call BIS_fnc_randomPos;

    _result = [_xCoord,_yCoord,ao_marker_location] call cav_fnc_checkWater;
    sleep 1;
};

createMarkerLocal ["ao_marker",ao_marker_location];
"ao_marker" setMarkerShapeLocal "RECTANGLE";
"ao_marker" setMarkerSizeLocal [_xCoord,_yCoord];
"ao_marker" setMarkerColorLocal "colorOPFOR";
"ao_marker" setMarkerAlphaLocal 0.20;
"ao_marker" setMarkerBrush "SolidBorder";

ao_created = true;

["patrolElim"] call cav_fnc_spawnObjective;

//Create AO Objective
