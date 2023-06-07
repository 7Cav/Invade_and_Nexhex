/*
    File: fn_handleAI.sqf
    Author: 7th Cav Dev Team

    Description:
        Performs maintenance actions on mission spawned AI unit.

    Parameter(s):
        _unit - The unit to execute code for. [OBJECT]

    Returns:
        Nothing
*/


params ["_unit"];

// AI Skill
_skill = 0.45; // Make a parameter?


_unit setSkill ["aimingspeed",     _skill];
_unit setSkill ["aimingaccuracy",  _skill];
_unit setSkill ["aimingshake",     _skill];
_unit setSkill ["spottime",        1];
_unit setSkill ["spotdistance",    _skill];
_unit setSkill ["commanding",      _skill];
_unit setSkill ["general",         _skill];

