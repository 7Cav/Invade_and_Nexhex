/*
    File: fn_halo.sqf
    Author: 7th Cav Dev Team

    Description:
        Executes a halo jump for the player using default Bohemia funciton via a GUI. GUI borrowed from KP Liberation.

    Parameter(s):
        _unit - The player calling to execute a halo jump [OBJECT]

    Returns:
        Nothing
*/


params ["_unit"];
_cooldown = 300;
_haloAlt = 2500;
_markers_reset = [99999,99999,0];

if (isNil "SEVCAV_last_halo_jump") then {
	SEVCAV_last_halo_jump = _cooldown * -1;
};

if (SEVCAV_last_halo_jump >= time) exitWith {
	hint format ["HALO jump executed recently. Please wait %1 minutes.",ceil((SEVCAV_last_halo_jump - time)/60)];
};

_dialog = createDialog "SEVCAV_halo";
dojump = 0;
halo_position = getpos player;
[ "halo_map_event", "onMapSingleClick", { halo_position = _pos } ] call BIS_fnc_addStackedEventHandler;

waitUntil { dialog };

createMarkerLocal ["halo_marker",halo_position];
"halo_marker" setMarkerShapeLocal "icon";
"halo_marker" setMarkerTypeLocal "hd_join";
"halo_marker" setMarkerTextLocal "HALO Jump";
"halo_marker" setMarkerColorLocal "ColorGreen";

while { dialog && alive player && dojump isEqualTo 0 } do {
    "halo_marker" setMarkerPosLocal halo_position;
    sleep 0.1;
};

if ( dialog ) then {
    closeDialog 0;
    sleep 0.1;
};

"halo_marker" setMarkerPosLocal _markers_reset;
"halo_marker" setMarkerTextLocal "";

[ "halo_map_event", "onMapSingleClick" ] call BIS_fnc_removeStackedEventHandler;

if ( dojump > 0 ) then {
	SEVCAV_last_halo_jump = time + _cooldown;
	halo_position = halo_position getPos [random 250, random 360];
	halo_position = [ halo_position select 0, halo_position select 1, _haloAlt + (random 200) ];
    [0, "BLACK", 2, 0] spawn BIS_fnc_fadeEffect;
    sleep 2;
    player setpos halo_position;
	[_unit, _haloAlt] call bis_fnc_halo;
    sleep 2;
    [1, "BLACK", 2, 0] spawn BIS_fnc_fadeEffect;
   // deleteMarkerLocal the_spawn_marker;
};

