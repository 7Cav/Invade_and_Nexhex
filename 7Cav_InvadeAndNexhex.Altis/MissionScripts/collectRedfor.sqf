redfor_squad_deploymentData = [];
redfor_crewman_deploymentData = [];
redfor_vehicle_vsHumvee_deploymentData = [];
redfor_vehicle_vsMRAP_deploymentData = [];
redfor_vehicle_vsAPC_deploymentData = [];
redfor_vehicle_vsIFV_deploymentData = [];
redfor_vehicle_vsMBT_deploymentData = [];
redfor_mortar_deploymentData = [];
redfor_grenadier_deploymentData = [];
redfor_gunAA_deploymentData = [];
redfor_spGunAA_deploymentData = [];
redfor_samAA_deploymentData = [];
redfor_spSAMAA_deploymentData = [];
redfor_infantryAALong_deploymentData = [];
redfor_infantryAAShort_deploymentData = [];
redfor_atgm_deploymentData = [];
redfor_infantryATGM_deploymentData = [];
redfor_commando_deploymentData = [];
redfor_sniper_deploymentData = [];
redfor_marksman_deploymentData = [];
redfor_officer_deploymentData = [];
redfor_fieldGun_deploymentData = [];
redfor_weaponsTeam_deploymentData = [];
redfor_compoundWall_deploymentData = [];
redfor_supply_deploymentData = [];
redfor_logisticsSpecialist_deploymentData = [];
redfor_hq_deploymentData = [];
redfor_hqStaff_deploymentData = [];
redfor_commTower_deploymentData = [];
redfor_commSpecialist_deploymentData = [];
redfor_vehicle_replacement_vsHumvee_deploymentData = [];
redfor_vehicle_replacement_vsMRAP_deploymentData = [];
redfor_vehicle_replacement_vsAPC_deploymentData = [];
redfor_vehicle_replacement_vsIFV_deploymentData = [];
redfor_vehicle_replacement_vsMBT_deploymentData = [];
redfor_rotary_vsHumvee_deploymentData = [];
redfor_rotary_vsMRAP_deploymentData = [];
redfor_rotary_vsAPC_deploymentData = [];
redfor_rotary_vsIFV_deploymentData = [];
redfor_rotary_vsMBT_deploymentData = [];
redfor_fixedWing_deploymentData = [];

fnc_collect_vehicle = {
	params["_veh"];

	_data = [];
	
	if (typeOf(_veh) != "") then
	{
		_className = typeOf _veh;
		_appearance = [_veh,""] call BIS_fnc_exportVehicle;
		_pylons = GetPylonMagazines _veh;		
		_pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};	
				
		_data pushBack _className;
		_data pushBack _appearance;
		_data pushBack _pylons;
		_data pushBack _pylonPaths;
	};
	
	_data
};

fnc_collect_squad = {
	params["_squadVariableString","_deploymentData", "_removeSecondaryRocket"];
	
	_squadMemberCounter = 1;
	while {_squadMemberCounter < 999} do
	{
		_squadMember = missionNamespace getVariable [format["%1_%2", _squadVariableString, _squadMemberCounter],objNull];
		if (typeOf _squadMember != "") then
		{
			_className = typeOf _squadMember;				
			_loadout = getUnitLoadout _squadMember;
			_deploymentData pushBack [_className,_loadout];
			deleteVehicle _squadMember;
		};
		
		_squadMemberCounter = _squadMemberCounter + 1;
	};	
};

fnc_collect_individual = {
	params["_individualVariableString","_deploymentData"];
	
	_individual = missionNamespace getVariable [_individualVariableString,objNull];
	_individual_className = typeOf _individual;	
	_individual_loadout = getUnitLoadout _individual;
	_deploymentData pushBack _individual_className;
	_deploymentData pushBack _individual_loadout;
	deleteVehicle _individual;
};

["redfor_squad", redfor_squad_deploymentData, false] call fnc_collect_squad;
["redfor_crewman", redfor_crewman_deploymentData] call fnc_collect_individual;

_vsHumveeVehicle = missionNamespace getVariable ["redfor_vehicle_vsHumvee",objNull];
redfor_vehicle_vsHumvee_deploymentData = [_vsHumveeVehicle] call fnc_collect_vehicle;
deleteVehicle _vsHumveeVehicle;

_vsMRAPVehicle = missionNamespace getVariable ["redfor_vehicle_vsMRAP",objNull];
redfor_vehicle_vsMRAP_deploymentData = [_vsMRAPVehicle] call fnc_collect_vehicle;
deleteVehicle _vsMRAPVehicle;

_vsAPCVehicle = missionNamespace getVariable ["redfor_vehicle_vsAPC",objNull];
redfor_vehicle_vsAPC_deploymentData = [_vsAPCVehicle] call fnc_collect_vehicle;
deleteVehicle _vsAPCVehicle;

_vsIFVVehicle = missionNamespace getVariable ["redfor_vehicle_vsIFV",objNull];
redfor_vehicle_vsIFV_deploymentData = [_vsIFVVehicle] call fnc_collect_vehicle;
deleteVehicle _vsIFVVehicle;

_vsMBTVehicle = missionNamespace getVariable ["redfor_vehicle_vsMBT",objNull];
redfor_vehicle_vsMBT_deploymentData = [_vsMBTVehicle] call fnc_collect_vehicle;
deleteVehicle _vsMBTVehicle;

_mortar = missionNamespace getVariable ["redfor_mortar",objNull];
redfor_mortar_deploymentData = [_mortar] call fnc_collect_vehicle;
deleteVehicle _mortar;

["redfor_grenadier", redfor_grenadier_deploymentData, false] call fnc_collect_squad;

_gunAA = missionNamespace getVariable ["redfor_gunAA",objNull];
redfor_gunAA_deploymentData = [_gunAA] call fnc_collect_vehicle;
deleteVehicle _gunAA;

_spGunAA = missionNamespace getVariable ["redfor_spGunAA",objNull];
redfor_spGunAA_deploymentData = [_spGunAA] call fnc_collect_vehicle;
deleteVehicle _spGunAA;

_samAA = missionNamespace getVariable ["redfor_samAA",objNull];
redfor_samAA_deploymentData = [_samAA] call fnc_collect_vehicle;
deleteVehicle _samAA;

_spSAMAA = missionNamespace getVariable ["redfor_spSAMAA",objNull];
redfor_spSAMAA_deploymentData = [_spSAMAA] call fnc_collect_vehicle;
deleteVehicle _spSAMAA;

["redfor_infantryAALong", redfor_infantryAALong_deploymentData, false] call fnc_collect_squad;
["redfor_infantryAAShort", redfor_infantryAAShort_deploymentData, false] call fnc_collect_squad;

_atgm = missionNamespace getVariable ["redfor_atgm",objNull];
redfor_atgm_deploymentData = [_atgm] call fnc_collect_vehicle;
deleteVehicle _atgm;

["redfor_infantryATGM", redfor_infantryATGM_deploymentData, false] call fnc_collect_squad;
["redfor_commando", redfor_commando_deploymentData, false] call fnc_collect_squad;
["redfor_sniper", redfor_sniper_deploymentData, false] call fnc_collect_squad;
["redfor_marksman", redfor_marksman_deploymentData, false] call fnc_collect_squad;
["redfor_officer", redfor_officer_deploymentData] call fnc_collect_individual;

_fieldGun = missionNamespace getVariable ["redfor_fieldGun",objNull];
redfor_fieldGun_deploymentData = [_fieldGun] call fnc_collect_vehicle;
deleteVehicle _fieldGun;

["redfor_weaponsTeam", redfor_weaponsTeam_deploymentData, false] call fnc_collect_squad;

_supply = missionNamespace getVariable ["redfor_supply",objNull];
redfor_supply_deploymentData = [_supply] call fnc_collect_vehicle;
deleteVehicle _supply;

["redfor_logisticsSpecialist", redfor_logisticsSpecialist_deploymentData, false] call fnc_collect_squad;

_hq = missionNamespace getVariable ["redfor_hq",objNull];
redfor_hq_deploymentData = [_hq] call fnc_collect_vehicle;
deleteVehicle _hq;

["redfor_hqStaff", redfor_hqStaff_deploymentData, false] call fnc_collect_squad;

_commTower = missionNamespace getVariable ["redfor_commTower",objNull];
redfor_commTower_deploymentData = [_commTower] call fnc_collect_vehicle;
deleteVehicle _commTower;

["redfor_commSpecialist", redfor_commSpecialist_deploymentData, false] call fnc_collect_squad;

_compoundWall = missionNamespace getVariable ["redfor_compoundWall",objNull];
redfor_compoundWall_deploymentData = [typeOf _compoundWall, ((0 boundingBoxReal _compoundWall) select 1) select 0];
deleteVehicle _compoundWall;

_replacementVsHumveeVehicle = missionNamespace getVariable ["redfor_vehicle_replacement_vsHumvee",objNull];
redfor_vehicle_replacement_vsHumvee_deploymentData = [_replacementVsHumveeVehicle] call fnc_collect_vehicle;
deleteVehicle _replacementVsHumveeVehicle;

_replacementVsMRAPVehicle = missionNamespace getVariable ["redfor_vehicle_replacement_vsMRAP",objNull];
redfor_vehicle_replacement_vsMRAP_deploymentData = [_replacementVsMRAPVehicle] call fnc_collect_vehicle;
deleteVehicle _replacementVsMRAPVehicle;

_replacementVsAPCVehicle = missionNamespace getVariable ["redfor_vehicle_replacement_vsAPC",objNull];
redfor_vehicle_replacement_vsAPC_deploymentData = [_replacementVsAPCVehicle] call fnc_collect_vehicle;
deleteVehicle _replacementVsAPCVehicle;

_replacementVsIFVVehicle = missionNamespace getVariable ["redfor_vehicle_replacement_vsIFV",objNull];
redfor_vehicle_replacement_vsIFV_deploymentData = [_replacementVsIFVVehicle] call fnc_collect_vehicle;
deleteVehicle _replacementVsIFVVehicle;

_replacementVsMBTVehicle = missionNamespace getVariable ["redfor_vehicle_replacement_vsMBT",objNull];
redfor_vehicle_replacement_vsMBT_deploymentData = [_replacementVsMBTVehicle] call fnc_collect_vehicle;
deleteVehicle _replacementVsMBTVehicle;

_rotaryVsHumvee = missionNamespace getVariable ["redfor_rotary_vsHumvee",objNull];
redfor_rotary_vsHumvee_deploymentData = [_rotaryVsHumvee] call fnc_collect_vehicle;
deleteVehicle _rotaryVsHumvee;

_rotaryVsMRAP = missionNamespace getVariable ["redfor_rotary_vsMRAP",objNull];
redfor_rotary_vsMRAP_deploymentData = [_rotaryVsMRAP] call fnc_collect_vehicle;
deleteVehicle _rotaryVsMRAP;

_rotaryVsAPC = missionNamespace getVariable ["redfor_rotary_vsAPC",objNull];
redfor_rotary_vsAPC_deploymentData = [_rotaryVsAPC] call fnc_collect_vehicle;
deleteVehicle _rotaryVsAPC;

_rotaryVsIFV = missionNamespace getVariable ["redfor_rotary_vsIFV",objNull];
redfor_rotary_vsIFV_deploymentData = [_rotaryVsIFV] call fnc_collect_vehicle;
deleteVehicle _rotaryVsIFV;

_rotaryVsMBT = missionNamespace getVariable ["redfor_rotary_vsMBT",objNull];
redfor_rotary_vsMBT_deploymentData = [_rotaryVsMBT] call fnc_collect_vehicle;
deleteVehicle _rotaryVsMBT;

_fixedWing = missionNamespace getVariable ["redfor_fixedWing",objNull];
redfor_fixedWing_deploymentData = [_fixedWing] call fnc_collect_vehicle;
deleteVehicle _fixedWing;