waitUntil {(!(isNull player))};
waitUntil { local player };
waitUntil { getPlayerUID player != "" };

//Remove and dedicate a function.
addMissionEventHandler ["Draw3D",
	{		
		if (((missionNamespace getVariable ["DeployedSector", ""]) != "") and (missionNamespace getVariable ["NoAirTransportAvailable", true]) and ((base_crate distance player) < 50)) then
		{			
			drawIcon3D[getText (configFile >> "CfgVehicles" >> "B_Parachute" >> "icon"),[1, 1, 1,1],[getPosATLVisual base_crate select 0,getPosATLVisual base_crate select 1,((getPosATLVisual base_crate) select 2) + 1],1,1,0, "PARACHUTE SELF-INSERT"];
		};
	}
];
