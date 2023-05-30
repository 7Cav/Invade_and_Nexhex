params["_veh"];

_timer = 300;

while {(alive _veh) && (alive (gunner _veh))} do
{	
	if (_timer == 0) then
	{
		_veh setVehicleAmmo 1;		
	};	
	
	if (_timer == 0) then
	{
		_timer = 300;
	};
	
	_timer = _timer - 1;
	
	sleep 1;
};