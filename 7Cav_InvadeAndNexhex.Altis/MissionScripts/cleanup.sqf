while {true} do {	
	
	// Clean up any objects on the ground near respawn marker
	_clear = nearestObjects[(getMarkerPos "respawn_west"),["weaponholder"],300];
	for "_i" from 0 to ((count _clear) - 1) do 
	{
		deleteVehicle (_clear select _i);
	};
	
	// Delete empty groups
	{
		if (count units _x == 0) then 
		{
			deleteGroup _x;
		};
	} forEach allGroups;
	
	sleep 900; // Wait 15 mins
};