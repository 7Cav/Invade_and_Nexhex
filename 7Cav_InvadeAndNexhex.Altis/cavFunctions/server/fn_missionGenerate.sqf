/*
    File: fn_missionGenerate.sqf
    Author: 7th Cav Dev Team

    Description:
        Cleans existing variables and markers then generates a new mission.

    Parameter(s):
        _objectList [GROUP] : Mission objects to get rid of.
        _taskID [STRING] : Task ID for previous AO

    Returns:
        Nothing

    Example:
    [_objectList] call cav_fnc_handleAI;
    
*/

params ["_objectList","_taskID"];

deleteMarker "ao_marker";

[_taskID,true,true] call BIS_fnc_deleteTask;
sleep 10;

[ao_x_size,ao_y_size] spawn cav_fnc_createAO;
