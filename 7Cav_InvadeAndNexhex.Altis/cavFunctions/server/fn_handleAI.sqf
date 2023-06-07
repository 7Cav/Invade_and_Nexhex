/*
    File: fn_handleAI.sqf
    Author: 7th Cav Dev Team

    Description:
        Performs maintenance actions on mission spawned AI unit.

    Parameter(s):
        _createdGroup [GROUP] : The group to execute code on.

    Returns:
        Nothing

    Example:
    [_group] call cav_fnc_handleAI;
    
*/

params ["_createdGroup"];

 _skill = 0.45;

{ 
    _unit = _x;

    _unit setSkill ["aimingspeed",     _skill];
    _unit setSkill ["aimingaccuracy",  _skill];
    _unit setSkill ["aimingshake",     _skill];
    _unit setSkill ["spottime",        1];
    _unit setSkill ["spotdistance",    _skill];
    _unit setSkill ["commanding",      _skill];
    _unit setSkill ["general",         _skill];

} forEach units _createdGroup;

{
    _x addCuratorEditableObjects [units _createdGroup,true];
} forEach allCurators;

