fnc_getHeightIncrement = {
	params["_unit"];
	
	_increment = 0;
	
	if (vehicle _unit == _unit) then
	{
		if (stance _unit == "STAND") then
		{
			_increment = 1.8;
		};
		if (stance _unit == "CROUCH") then
		{
			_increment = 0.9;
		};
		if (stance _unit == "PRONE") then
		{
			_increment = 0.2;
		};
	}
	else
	{
		_increment = 2.1;
	};
	
	_increment
};

fnc_getSpottingAugmentDistance = {

	params["_unit"];
	
	_spottingAugmentDistance = redforSpottingAugment_default;	
	
	switch(typeOf(_unit)) do
	{		
		case (redfor_vehicle_vsHumvee_deploymentData select 0) : { _spottingAugmentDistance = redforSpottingAugment_vsHumvee; };	
		case (redfor_vehicle_vsMRAP_deploymentData select 0) : { _spottingAugmentDistance = redforSpottingAugment_vsMRAP; };
		case (redfor_vehicle_vsAPC_deploymentData select 0) : { _spottingAugmentDistance = redforSpottingAugment_vsAPC; };		
		case (redfor_vehicle_vsIFV_deploymentData select 0) : { _spottingAugmentDistance = redforSpottingAugment_vsIFV; };		
		case (redfor_vehicle_vsMBT_deploymentData select 0) : { _spottingAugmentDistance = redforSpottingAugment_vsMBT; };		
		case (redfor_gunAA_deploymentData select 0) : { _spottingAugmentDistance = redforSpottingAugment_gunAA; };		
		case (redfor_spGunAA_deploymentData select 0) : { _spottingAugmentDistance = redforSpottingAugment_spGunAA; };		
		case (redfor_samAA_deploymentData select 0) : { _spottingAugmentDistance = redforSpottingAugment_samAA; };		
		case (redfor_spSAMAA_deploymentData select 0) : { _spottingAugmentDistance = redforSpottingAugment_spSAMAA; };		
		case (redfor_atgm_deploymentData select 0) : { _spottingAugmentDistance = redforSpottingAugment_atgm; };		
		case ((redfor_sniper_deploymentData select 0) select 0) : { _spottingAugmentDistance = redforSpottingAugment_sniper; };		
		case ((redfor_infantryATGM_deploymentData select 0) select 0) : { _spottingAugmentDistance = redforSpottingAugment_infantry_atgm; };
		case ((redfor_infantryAAShort_deploymentData select 0) select 0) : { _spottingAugmentDistance = redforSpottingAugment_infantryAAShort; };
		case ((redfor_infantryAALong_deploymentData select 0) select 0) : { _spottingAugmentDistance = redforSpottingAugment_infantryAALong; };
		default { _spottingAugmentDistance = redforSpottingAugment_default; };
	};	
	
	_spottingAugmentDistance
};

_aaClasses = [redfor_gunAA_deploymentData select 0, 
				redfor_spGunAA_deploymentData select 0, 
				redfor_samAA_deploymentData select 0,
				redfor_spSAMAA_deploymentData select 0,
				(redfor_infantryAAShort_deploymentData select 0) select 0,
				(redfor_infantryAALong_deploymentData select 0) select 0];

while {true} do {
	
	_redforUnits = [];
	{
		if (side _x == east) then
		{
			_redforUnits pushBack _x;			
		};
	} forEach allUnits;
	
	_bluforUnits = [];
	{
		if (side _x == west) then
		{
			_bluforUnits pushBack (vehicle _x);
		};
	} forEach allUnits;	
	
	{		
		_currentUnit = _x;
				
		_spottingAugmentDistance = [vehicle _currentUnit] call fnc_getSpottingAugmentDistance;		
		
		{					
			_playerUnit = _x;		
			if ((vehicle _playerUnit) isKindOf "Air") then
			{
				if ((typeOf (vehicle _currentUnit)) in _aaClasses) then
				{				
					_heightIncrementRedfor = [_currentUnit] call fnc_getHeightIncrement;
					_heightIncrementBlufor = [_playerUnit] call fnc_getHeightIncrement;				
					if (([objNull,"VIEW"] checkVisibility [[getPosASL _currentUnit select 0,getPosASL _currentUnit select 1,(getPosASL _currentUnit select 2) + _heightIncrementRedfor], [getPosASL _playerUnit select 0,getPosASL _playerUnit select 1,(getPosASL _playerUnit select 2) + _heightIncrementBlufor]]) > 0) then
					{	
						
						_distance = _currentUnit distance _playerUnit;
						_distanceFactor = 1 - (_distance/_spottingAugmentDistance);
						_spottingChance = random 1;	
						if (_distanceFactor >= 2 * _spottingChance) then
						{
							_currentUnit reveal [_playerUnit,4];
							_currentUnit reveal [vehicle _playerUnit,4];
						};									
					};
				};
			}
			else
			{
				if (_currentUnit distance _playerUnit <= _spottingAugmentDistance) then
				{				
					_heightIncrementRedfor = [_currentUnit] call fnc_getHeightIncrement;
					_heightIncrementBlufor = [_playerUnit] call fnc_getHeightIncrement;				
					if (([objNull,"VIEW"] checkVisibility [[getPosASL _currentUnit select 0,getPosASL _currentUnit select 1,(getPosASL _currentUnit select 2) + _heightIncrementRedfor], [getPosASL _playerUnit select 0,getPosASL _playerUnit select 1,(getPosASL _playerUnit select 2) + _heightIncrementBlufor]]) > 0) then
					{	
						
						_distance = _currentUnit distance _playerUnit;
						_distanceFactor = 1 - (_distance/_spottingAugmentDistance);
						_spottingChance = random 1;	
						if (_distanceFactor >= 2 * _spottingChance) then
						{
							{
								_x reveal [_playerUnit,4];
								_x reveal [vehicle _playerUnit,4];								
							} forEach _redforUnits;	
						};									
					};			
				};	
			};					
		} forEach _bluforUnits;
		
	} forEach _redforUnits;
	
	sleep 10;
};