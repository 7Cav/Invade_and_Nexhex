params ["_unit"];

clearweaponcargoGlobal _unit;
clearmagazinecargoGlobal _unit;
clearitemcargoGlobal _unit;
clearbackpackcargoGlobal _unit;	

_unit addItemCargoGlobal ["ToolKit",1];

if (((typeOf _unit) in blufor_vehicle_baseLogistics_classes) 
		or ((typeOf _unit) in blufor_vehicle_forwardLogistics_classes) 
		or ((typeOf _unit) in blufor_crate_supply_classes)) then
{
	[_unit] execVM "MissionScripts\arsenal.sqf";		
	
	[_unit, 30] call ace_cargo_fnc_setSpace;
	
	_unit setVariable ["ace_isRepairVehicle",1,true];						
	[_unit,10000] call ace_refuel_fnc_makeSource;				
	[_unit,10000] call ace_rearm_fnc_makeSource;
	
	while {alive _unit} do
	{
		_items = _unit getVariable ["ACE_cargo_loaded", []];		

		_wheelCount = 0;			
		
		{
			if (_x == "ACE_Wheel") then
			{
				_wheelCount = _wheelCount + 1;					
			};				
		} forEach _items;
	
		if (_wheelCount < 4) then
		{
			["ACE_Wheel", _unit] call ace_cargo_fnc_loadItem;
		};

		_trackCount = 0;			
		
		{
			if (_x == "ACE_Track") then
			{
				_trackCount = _trackCount + 1;					
			};				
		} forEach _items;
	
		if (_trackCount < 4) then
		{
			["ACE_Track", _unit] call ace_cargo_fnc_loadItem;
		};			
		
		[_unit,10000] call ace_rearm_fnc_makeSource;
		[_unit,10000] call ace_refuel_fnc_makeSource;
		_unit setFuel 1;
		
		sleep 60;
	};
};