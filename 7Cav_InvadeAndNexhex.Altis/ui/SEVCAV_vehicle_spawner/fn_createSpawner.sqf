/*
    File: fn_createSpawner.sqf
    Author: 7th Cav Dev Team

    Description:
        Initializes and opens the 7th Cav vehicle spawner.

    Parameter(s):
        _unit - The player calling to open the GUI [OBJECT]

    Returns:
        Nothing
*/


params ["_unit"];

disableSerialization;

createDialog "SEVCAV_vehicle_spawner";

waitUntil {!isNull (findDisplay 5204);};

//Base Selector Init
_ctrl = (findDisplay 5204) displayCtrl 2100;

{
    _ctrl lbAdd _x;
} forEach ["Place Holder","Place Holder 2"];

//Vehicle Selector Init
_ctrl = (findDisplay 5204) displayCtrl 2101;

{
    _displayName = [configFile >> "CfgVehicles" >>  _x] call BIS_fnc_DisplayName;
    _ctrl lbAdd  _displayName;
} forEach SEVCAV_blufor_vehicles;

//Spawn Selector Init
_ctrl = (findDisplay 5204) displayCtrl 2102;

{
    _ctrl lbAdd _x;
} forEach ["Place Holder","Place Holder 2"];

_ctrl = (findDisplay 5204) displayCtrl 1600;
_ctrl ctrlAddEventHandler ["ButtonDown",{
    if !(lbCurSel 2101 == -1) then {
        _index = lbCurSel 2101;

        _targetVehicle = SEVCAV_blufor_vehicles select _index;
        _newVehicle = _targetVehicle createVehicle ((getPosASL spawner_1) findEmptyPosition [20,50,_targetVehicle]);
        closeDialog 2;

    } else {
        systemChat "Please select a vehicle first!";
    };
}];