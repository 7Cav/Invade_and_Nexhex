fnc_find_sector = {
	params["_previousSector"];

	_foundSector = "";	
		
	_farSectors = [];
	_nearSectors = [];	
	
	if (_previousSector == "") then
	{
		_foundSector = selectRandom sectorList;
	}
	else
	{
		_foundIndex = -2;
		while {_foundIndex != -1} do
		{
			_foundIndex = sectorList findIf { (getMarkerPos _x) inArea _previousSector };
			if (_foundIndex != -1) then
			{
				sectorList deleteAt _foundIndex;
			};
		};
	
		{
			if ((getMarkerPos _x) distance (getMarkerPos _previousSector) >= 2000 + ((getMarkerSize _x) select 0) + ((getMarkerSize _previousSector) select 0)) then
			{
				_farSectors pushBack _x;
			}
			else
			{
				_nearSectors pushBack _x;
			};
		} forEach sectorList;
		
		if (count _farSectors > 0) then
		{
			_distance = 99999;
		
			{
				if ((getMarkerPos _x) distance (getMarkerPos _previousSector) < _distance) then
				{
					_foundSector = _x;
					_distance = (getMarkerPos _x) distance (getMarkerPos _previousSector);
				};
			}
			forEach _farSectors;
		}
		else
		{
			_distance = 0;
			{
				if ((getMarkerPos _x) distance (getMarkerPos _previousSector) > _distance) then
				{
					_foundSector = _x;
					_distance = (getMarkerPos _x) distance (getMarkerPos _previousSector);
				};
			}
			forEach _nearSectors;
		};
	};
	
	_foundSector
};

fnc_deploy_sector = {
	params["_sector"];
	
	_deployedSector = "";
	
	_playerCount = count allPlayers;
	_deployedSectorRadius = 100 + (10 min (floor(_playerCount / 5))) * 100;
	
	if (markerShape _sector == "ICON") then
	{
		_deployedSector = createMarker [_sector + "_deployed", getMarkerPos _sector];
		_deployedSector setMarkerShape "ELLIPSE";
		_deployedSector setMarkerSize [_deployedSectorRadius, _deployedSectorRadius];
		_deployedSector setMarkerColor "ColorOPFOR";
		_deployedSector setMarkerAlpha 0.5;
	};
	
	if (markerShape _sector == "ELLIPSE") then
	{
		_sectorRadius = (markerSize _sector) select 0;
		
		if (_deployedSectorRadius >= _sectorRadius) then
		{
			_deployedSector = createMarker [_sector + "_deployed", getMarkerPos _sector];
			_deployedSector setMarkerShape "ELLIPSE";
			_deployedSector setMarkerSize [_deployedSectorRadius, _deployedSectorRadius];
			_deployedSector setMarkerColor "ColorOPFOR";
			_deployedSector setMarkerAlpha 0.5;
		}
		else
		{
			_differenceRadius = _sectorRadius - _deployedSectorRadius;
			_deployedSectorPosition = [[[getMarkerPos _sector, _differenceRadius]], ["water"]] call BIS_fnc_randomPos;
						
			_deployedSector = createMarker [_sector + "_deployed", _deployedSectorPosition];
			_deployedSector setMarkerShape "ELLIPSE";
			_deployedSector setMarkerSize [_deployedSectorRadius, _deployedSectorRadius];
			_deployedSector setMarkerColor "ColorOPFOR";
			_deployedSector setMarkerAlpha 0.5;
		};
	};
	
	(_sector + "_text") setMarkerPos (getMarkerPos _deployedSector);
	(_sector + "_text") setMarkerAlpha 1;
	
	_deployedSector;
};

_previousDeployedSector = "";

_bluforVehicleHandler = [] execVM "MissionScripts\bluforVehicleLoop.sqf";

_missionDone = false;

sleep 20;

while {!_missionDone} do
{
	_currentSector = [_previousDeployedSector] call fnc_find_sector;
	_currentDeployedSector = "";
	
	if (_currentSector == "") then
	{
		_missionDone = true;
	}
	else
	{	
		_currentDeployedSector = [_currentSector] call fnc_deploy_sector;		
	
		["TaskUpdated",["",format["%1 ACTIVE IN 20 SECONDS",markerText _currentSector]]] remoteExec ["BIS_fnc_showNotification",0];		
		_currentDeployedSector setMarkerBrush "DiagGrid";
		
		sleep 20;
				
		missionNamespace setVariable ["DeployedSector", _currentDeployedSector, true];
		["TaskAssigned",["",format["ATTACK %1",markerText _currentSector]]] remoteExec ["BIS_fnc_showNotification",0];
		_currentDeployedSector setMarkerBrush "SolidBorder";
		
		[_currentDeployedSector] call compile preprocessFileLineNumbers "MissionScripts\sectorEngagement.sqf";
		
		missionNamespace setVariable ["DeployedSector", "", true];
		["TaskSucceeded",["",format["%1 SECURED",markerText _currentSector]]] remoteExec ["BIS_fnc_showNotification",0];

		_currentDeployedSector setMarkerAlpha 0;
		(_currentSector + "_text") setMarkerAlpha 0;
		_foundIndex = sectorList find _currentSector;
		sectorList deleteAt _foundIndex;
	};
	
	_previousDeployedSector = _currentDeployedSector;

	sleep 5;
};

terminate _bluforVehicleHandler;

"EveryoneWon" call BIS_fnc_endMissionServer;