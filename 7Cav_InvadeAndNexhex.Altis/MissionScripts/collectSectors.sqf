sectorList = [];

_text_marker = createMarker ["sector_home_text", getMarkerPos "sector_home"];
_text_marker setMarkerShape "ICON";
_text_marker setMarkerType "mil_dot";
_text_marker setMarkerText (markerText "sector_home");

_sectorCounter = 1;
while {_sectorCounter < 999} do 
{
	_sectorMarker = "sector_" + str(_sectorCounter);
	if (((getMarkerPos _sectorMarker) select 0) != 0) then
	{	
		_text_marker = createMarker [_sectorMarker + "_text", getMarkerPos _sectorMarker];
		_text_marker setMarkerShape "ICON";
		_text_marker setMarkerType "mil_dot";
		_text_marker setMarkerText (markerText _sectorMarker);
		
		_sectorMarker setMarkerAlpha 0;
		_text_marker setMarkerAlpha 0;
		
		sectorList pushBack _sectorMarker;
	};	
	
	_sectorCounter = _sectorCounter + 1;
};