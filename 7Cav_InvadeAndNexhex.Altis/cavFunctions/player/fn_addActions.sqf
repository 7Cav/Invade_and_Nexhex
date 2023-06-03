/*
    File: fn_addActions.sqf
    Author: 7th Cav Dev Team

    Description:
        Adds pertinent actions for the mission file to the start base crate.

    Parameter(s):
        None

    Returns:
        Nothing
*/


base_crate addAction ["PARACHUTE SELF-INSERT",
                    "cavFunctions\player\fn_halo.sqf", 
                    nil,
                    1.5,
                    true,
                    true,
                    "",                 
                    "(missionNamespace getVariable [""DeployedSector"",""""] != """") && (missionNamespace getVariable [""NoAirTransportAvailable"", true])"];

base_crate addAction [
    "Vehicle Spawner",
    "ui\SEVCAV_vehicle_spawner\fn_createSpawner.sqf"
];

