enableDynamicSimulationSystem false;

createCenter east;
createCenter sideLogic;

setViewDistance 3000;
setObjectViewDistance [3000,3000];

zeus_whitelist = [];
[
    {
        params ["_args"];
        _args params [];

        zeus_whitelist = "cavzeus" callExtension "";
        publicVariable "zeus_whitelist";

    }, 60, []
] call CBA_fnc_addPerFrameHandler;

addMissionEventHandler ["PlayerDisconnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	
	_unit = _uid call BIS_fnc_getUnitByUID;
	_zeusModule = getAssignedCuratorLogic _unit;
	_zeusGroup = group _zeusModule;
	unassignCurator _zeusModule;
	deleteVehicle _zeusModule;
	deleteGroup _zeusGroup;	
}];

setDate [2020, 6, 26, floor(random 24), 00];

redforSkill = 0.5;

redforSpottingAugment_default = 700;
redforSpottingAugment_vsHumvee = 700;
redforSpottingAugment_vsMRAP = 1000;
redforSpottingAugment_vsAPC = 1500;
redforSpottingAugment_vsIFV = 2000;
redforSpottingAugment_vsMBT = 3000;
redforSpottingAugment_atgm = 3000;
redforSpottingAugment_infantry_atgm = 1500;
redforSpottingAugment_gunAA = 1000;
redforSpottingAugment_spGunAA = 1000;
redforSpottingAugment_samAA = 8000;
redforSpottingAugment_spSAMAA = 8000;
redforSpottingAugment_infantryAAShort = 1000;
redforSpottingAugment_infantryAALong = 8000;
redforSpottingAugment_sniper = 1000;

redfor_sector_initialRadius = 100;
redfor_sector_radiusIncreaseIncrement = 100;
redfor_sector_radiusIncreasePlayerCount = 5;
redfor_sector_maxRadius = 1000;
redfor_sector_sideObjectivePlayerCountIncrement = 5;

redfor_compound_radius = 25;
redfor_deployedCompoundsList = [];

[] call compile preprocessFileLineNumbers "MissionScripts\collectSectors.sqf";
[] call compile preprocessFileLineNumbers "MissionScripts\collectBlufor.sqf";
[] call compile preprocessFileLineNumbers "MissionScripts\collectRedfor.sqf";

[] execVM "MissionScripts\cleanup.sqf";
[] execVM "MissionScripts\fogKiller.sqf";
[] execVM "MissionScripts\spottingAugment.sqf";

[] execVM "MissionScripts\missionLoop.sqf";