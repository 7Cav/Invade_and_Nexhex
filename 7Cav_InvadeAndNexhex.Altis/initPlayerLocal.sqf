waitUntil {(!(isNull player))};
waitUntil { local player };
waitUntil { getPlayerUID player != "" };

player addEventHandler ["Fired", {
	if ((getPos (_this select 0)) inArea "sector_home") then
	{
		deleteVehicle (_this select 6);
		titleText ["Firing weapons and placing / throwing explosives at base is STRICTLY PROHIBITED!", "PLAIN", 3];
	};
}];

while { not (player getVariable ["bis_dg_ini", false]) } do
{
	["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
	sleep 1;
};

addMissionEventHandler ["Draw3D",
	{		
		if (((missionNamespace getVariable ["DeployedSector", ""]) != "") and (missionNamespace getVariable ["NoAirTransportAvailable", true]) and ((halo_flag distance player) < 50)) then
		{			
			drawIcon3D[getText (configFile >> "CfgVehicles" >> "B_Parachute" >> "icon"),[1, 1, 1,1],[getPosATLVisual halo_flag select 0,getPosATLVisual halo_flag select 1,((getPosATLVisual halo_flag) select 2) + 1],1,1,0, "PARACHUTE SELF-INSERT"];
		};
	}
];

halo_flag addAction ["PARACHUTE SELF-INSERT",
					{			
						_sector = missionNamespace getVariable ["DeployedSector", ""];
						_dir = (getMarkerPos _sector) getDir (getMarkerPos "sector_home");
						(_this select 1) setDir (_dir + 180);
						(_this select 1) setPos ((getMarkerPos _sector) getPos [((markerSize _sector) select 0) + 1000, _dir]);
						[(_this select 1), 1000] call bis_fnc_halo;
						sleep 0.1;
						(_this select 1) setDir (_dir + 180);
						sleep 0.1;										
						(_this select 1) setVectorDir [sin (_dir + 180), cos (_dir + 180), 0];						
					}, 
					nil,
					1.5,
					true,
					true,
					"",					
					"(missionNamespace getVariable [""DeployedSector"",""""] != """") && (missionNamespace getVariable [""NoAirTransportAvailable"", true])"];