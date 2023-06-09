#include "..\script_component.hpp";
/*
 * Author: CPL.Brostrom.A
 * This function adds equipment to a given item baserd on company type.
 *
 * Arguments:
 * 0: Crate <OBJECT>
 * 1: Set company type. <STRING> ["none","alpha","bravo","charlie","medical","full"]
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [this] call cScripts_fnc_doStarterCrateSupplies;
 * [this,"none"] call cScripts_fnc_doStarterCrateSupplies;
 *
 */

if (!isServer) exitWith {};

params [
    ["_crate", objNull, [objNull]],
    ["_companySelector", "NONE"]
];

// Set upper case
_companySelector = toUpper(_companySelector);

// Create categories
private _officer = ["OFFICER"];
private _alpha   = ["ALPHA", "BUFFALO", "TITAN", "RAIDER", "SPARROW"];
private _bravo   = ["BRAVO", "LANCER", "VIKING", "SABER", "BANSHEE", "ATLAS"];
private _charlie = ["CHARLIE", "BANDIT", "MISFIT"];

if !(_companySelector in (["NONE", "FULL", "ALL"] + _officer + _alpha + _bravo + _charlie)) exitWith {
    [format["%1 (Starter Crate Supplies) is using a unsupported cartegory '%2'.", _crate, _companySelector]] call FUNC(error);
};

// Full selector handler
private _alwaysAvalible = if (_companySelector == 'FULL' or _companySelector == 'ALL') then {true} else {false};

// Clear the crate
clearweaponcargoGlobal _crate;
clearmagazinecargoGlobal _crate;
clearitemcargoGlobal _crate;
clearbackpackcargoGlobal _crate;

if (_companySelector == "" OR _companySelector == "NONE") exitWith {};

//          Starter crate inventory

//          G L O B A L   C A R G O
if !(_companySelector == 'NONE') then {
    // TEMP REMOVED THIS RELEASE

    // // Radios
    // _crate addItemCargoGlobal ["ACRE_PRC152",10];
    // _crate addItemCargoGlobal ["ACRE_PRC117F",10];
    // _crate addItemCargoGlobal ["ACRE_PRC343",20];

    // // Magazines
    // _crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",250];
    // _crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",250];
    // _crate addMagazineCargoGlobal ["rhsusf_200rnd_556x45_mixed_box",250];
    // _crate addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m61_ap",250];

    // // Grenades
    // _crate addMagazineCargoGlobal ["ACE_Chemlight_HiBlue",50];
    // _crate addMagazineCargoGlobal ["ACE_Chemlight_HiGreen",50];
    // _crate addMagazineCargoGlobal ["ACE_Chemlight_HiRed",50];
    // _crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite",50];
    // _crate addMagazineCargoGlobal ["ACE_Chemlight_HiYellow",50];

    // _crate addMagazineCargoGlobal ["SmokeShell",50];
    // _crate addMagazineCargoGlobal ["SmokeShellBlue",50];
    // _crate addMagazineCargoGlobal ["SmokeShellGreen",50];
    // _crate addMagazineCargoGlobal ["SmokeShellOrange",50];
    // _crate addMagazineCargoGlobal ["SmokeShellPurple",50];
    // _crate addMagazineCargoGlobal ["SmokeShellRed",50];
    // _crate addMagazineCargoGlobal ["SmokeShellYellow",50];

    // _crate addMagazineCargoGlobal ["HandGrenade",50];
    // _crate addMagazineCargoGlobal ["ACE_M84",50];

    // _crate addMagazineCargoGlobal ["B_IR_Grenade",50];
    // _crate addMagazineCargoGlobal ["ACE_Chemlight_IR",50];

    // // Barrel grenades flares and smokes
    // _crate addMagazineCargoGlobal ["rhs_mag_M441_HE",50];
    // _crate addMagazineCargoGlobal ["rhs_mag_M433_HEDP",50];
    // _crate addMagazineCargoGlobal ["rhs_mag_M397_HET",50];

    // _crate addMagazineCargoGlobal ["ACE_40mm_Flare_white",50];
    // _crate addMagazineCargoGlobal ["ACE_40mm_Flare_green",50];
    // _crate addMagazineCargoGlobal ["ACE_40mm_Flare_red",50];
    // _crate addMagazineCargoGlobal ["rhs_mag_m713_Red",50];
    // _crate addMagazineCargoGlobal ["rhs_mag_m714_White",50];
    // _crate addMagazineCargoGlobal ["rhs_mag_m715_Green",50];
    // _crate addMagazineCargoGlobal ["rhs_mag_m716_yellow",50];

    // _crate addMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell",50];
    // _crate addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell",50];
    // _crate addMagazineCargoGlobal ["1Rnd_SmokeOrange_Grenade_shell",50];
    // _crate addMagazineCargoGlobal ["1Rnd_SmokePurple_Grenade_shell",50];
    // _crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell",50];
    // _crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",50];
    // _crate addMagazineCargoGlobal ["1Rnd_SmokeYellow_Grenade_shell",50];

    // _crate addMagazineCargoGlobal ["ACE_HUNTIR_M203",50];

    // // Medical Equipment
    // _crate addItemCargoGlobal ["ACE_quikclot",250];
    // _crate addItemCargoGlobal ["ACE_tourniquet",50];

    // // Gear and protection
    // _crate addItemCargoGlobal ["rhs_googles_black",25];
    // _crate addItemCargoGlobal ["rhs_googles_clear",25];
    // _crate addItemCargoGlobal ["rhsusf_oakley_goggles_blk",25];
    // _crate addItemCargoGlobal ["rhsusf_oakley_goggles_clr",25];
};

//          O F F I C E R   C A R G O
if (_companySelector in _officer or _alwaysAvalible) then {
};

//          A L P H A   C O M P A N Y   C A R G O
if (_companySelector in _alpha or _alwaysAvalible) then {

    // Container Buffalo
    if (_companySelector in ['ALPHA', 'BUFFALO'] or _alwaysAvalible) then {
    };
    // Container Titan
    if (_companySelector in ['ALPHA', 'TITAN'] or _alwaysAvalible) then {
    };
    // Container Raider
    if (_companySelector in ['ALPHA', 'RAIDER'] or _alwaysAvalible) then {
    };
    // Container Sparrow
    if (_companySelector in ['ALPHA', 'SPARROW'] or _alwaysAvalible) then {
    };

    // Old Container
    if (_companySelector in ['ALPHA', 'BUFFALO', 'TITAN', 'RAIDER', 'SPARROW' ] or _alwaysAvalible) then {
        //================== RADIOS ==================\\
        //_crate addItemCargoGlobal ["ACRE_PRC152",50];
        //_crate addItemCargoGlobal ["ACRE_PRC117F",10];
        //_crate addItemCargoGlobal ["ACRE_PRC343",12];

        //================== WEAPONS ==================\\
        _crate addWeaponCargoGlobal ["rhs_weap_m4a1_m320",2];
        _crate addWeaponCargoGlobal ["rhs_weap_m249_pip_L",2];
        _crate addWeaponCargoGlobal ["rhs_weap_m240B",2];
        _crate addWeaponCargoGlobal ["rhs_weap_M136_hp",6];
        _crate addItemCargoGlobal ["acc_flashlight",50];
        _crate addItemCargoGlobal ["rhsusf_acc_anpeq15_bk_light",50];
        _crate addItemCargoGlobal ["rhsusf_acc_acog_mdo",50];
        _crate addItemCargoGlobal ["rhsusf_acc_ELCAN",50];
        _crate addItemCargoGlobal ["rhsusf_acc_compm4",50];
        _crate addItemCargoGlobal ["rhsusf_acc_acog3",50];
        _crate addItemCargoGlobal ["rhsusf_acc_eotech_xps3",50];

        //================== AMMO ==================\\
        _crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",250];
        _crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",50];
        _crate addMagazineCargoGlobal ["rhsusf_200rnd_556x45_mixed_box",250];
        _crate addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m62_tracer",250];
        _crate addMagazineCargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP",30];

        //================== GRENADES ==================\\
        _crate addMagazineCargoGlobal ["rhs_mag_m67",50];
        _crate addMagazineCargoGlobal ["SmokeShell",50];
        _crate addMagazineCargoGlobal ["SmokeShellRed",25];
        _crate addMagazineCargoGlobal ["SmokeShellBlue",25];
        _crate addMagazineCargoGlobal ["SmokeShellGreen",25];
        _crate addMagazineCargoGlobal ["SmokeShellOrange",25];
        _crate addMagazineCargoGlobal ["SmokeShellYellow",25];
        _crate addMagazineCargoGlobal ["SmokeShellPurple",25];
        _crate addMagazineCargoGlobal ["B_IR_Grenade",25];
        _crate addMagazineCargoGlobal ["ACE_M84",25];
        _crate addMagazineCargoGlobal ["rhs_mag_M441_HE",25];
        _crate addMagazineCargoGlobal ["rhs_mag_M433_HEDP",25];
        _crate addMagazineCargoGlobal ["rhs_mag_m714_White",25];
        _crate addMagazineCargoGlobal ["rhs_mag_m715_Green",25];
        _crate addMagazineCargoGlobal ["rhs_mag_m716_yellow",25];
        _crate addMagazineCargoGlobal ["rhs_mag_m713_Red",25];
        _crate addMagazineCargoGlobal ["ACE_HUNTIR_M203",25];
        _crate addMagazineCargoGlobal ["ACE_40mm_Flare_red",250];
        _crate addMagazineCargoGlobal ["Chemlight_green",25];
        _crate addMagazineCargoGlobal ["Chemlight_red",25];
        _crate addMagazineCargoGlobal ["Chemlight_yellow",25];

        //================== ITEMS ==================\\
        _crate addItemCargoGlobal ["Toolkit",50];
        _crate addItemCargoGlobal ["ACE_Flashlight_MX991",50];
        _crate addItemCargoGlobal ["itemcTabHCam",50];
        _crate addItemCargoGlobal ["ACE_CableTie",50];
        _crate addItemCargoGlobal ["ACE_Chemlight_Shield",25];
        _crate addItemCargoGlobal ["ACE_VMH3",20];
        _crate addItemCargoGlobal ["ACE_VMM3",20];
        _crate addItemCargoGlobal ["Flagstack_Red",20];
        _crate addItemCargoGlobal ["Signpack_Mines",20];

        //================== MEDICAL ==================\\
        _crate addItemCargoGlobal ["ACE_EarPlugs",250];
        _crate addItemCargoGlobal ["ACE_quikclot",250];
        _crate addItemCargoGlobal ["ACE_packingBandage",250];
        _crate addItemCargoGlobal ["ACE_tourniquet",250];
        _crate addItemCargoGlobal ["ACE_splint",250];
        _crate addItemCargoGlobal ["ACE_epinephrine",250];
        _crate addItemCargoGlobal ["ACE_personalAidKit",250];
        _crate addItemCargoGlobal ["ACE_bodyBag",250];
        _crate addItemCargoGlobal ["kat_IV_16",250];
        _crate addItemCargoGlobal ["kat_carbonate",250];
        _crate addItemCargoGlobal ["kat_naloxone",250];
        _crate addMagazineCargoGlobal ["kat_Painkiller",250];

        //================== HELMETS ==================\\
        _crate addItemCargoGlobal ["rhsusf_ihadss",12];
        _crate addItemCargoGlobal ["rhsusf_hgu56p_visor",12];
        _crate addItemCargoGlobal ["rhsusf_hgu56p_visor_green",12];
        _crate addItemCargoGlobal ["rhsusf_hgu56p_visor_mask_black",12];
        _crate addItemCargoGlobal ["H_PilotHelmetFighter_B",6];
        _crate addItemCargoGlobal ["DAR_Beret_Mar",50];
        _crate addItemCargoGlobal ["rhsusf_patrolcap_ocp",50];
    };
};


//          B R A V O   C O M P A N Y   C A R G O
if (_companySelector in _bravo or _alwaysAvalible) then {


    // Container Viking
    if (_companySelector in ['BRAVO', 'VIKING'] or _alwaysAvalible) then {
    //================== RADIOS ==================\\

        _crate addItemCargoGlobal ["ACRE_PRC152",10];
        _crate addItemCargoGlobal ["ACRE_PRC117F",5];
        _crate addItemCargoGlobal ["ACRE_PRC343",12];

        //================== LAUNCHERS ==================\\

        _crate addWeaponCargoGlobal ["rhs_weap_M136_hedp",3];
        _crate addWeaponCargoGlobal ["launch_MRAWS_olive_F",2];
        _crate addWeaponCargoGlobal ["rhs_weap_fgm148",1];
        _crate addWeaponCargoGlobal ["rhs_weap_m240G",2];
        _crate addWeaponCargoGlobal ["dzn_MG_Tripod_M122A1_M240Mount_Carry",2];
        _crate addWeaponCargoGlobal ["ace_csw_carryMortarBaseplate",5];
        _crate addWeaponCargoGlobal ["ace_compat_rhs_usf3_m252_carry",5];
        

        //================== OPTICS ==================\\

        _crate addItemCargoGlobal ["rhsusf_acc_eotech_552",10];
        _crate addItemCargoGlobal ["rhsusf_acc_anpeq15_bk_light",50];
        _crate addItemCargoGlobal ["acc_flashlight",50];
        _crate addItemCargoGlobal ["optic_hamr",50];
        _crate addItemCargoGlobal ["rhsusf_acc_g33_xps3",50];
        _crate addItemCargoGlobal ["rhsusf_acc_g33_t1",50];
        _crate addItemCargoGlobal ["rhsusf_acc_t1_high",50];
        _crate addItemCargoGlobal ["rhsusf_acc_su230_mrds",50];
        _crate addItemCargoGlobal ["rhsusf_acc_ELCAN",50];
        _crate addItemCargoGlobal ["rhsusf_acc_compm4",50];
        _crate addItemCargoGlobal ["rhsusf_acc_acog3",50];
        _crate addItemCargoGlobal ["rhsusf_acc_eotech_xps3",50];
        _crate addItemCargoGlobal ["rhsusf_acc_eotech",50];
        _crate addItemCargoGlobal ["optic_MRCO",50];

        //================== AMMO ==================\\

        _crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_PMAG",56];
        _crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",56];
        _crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_M995_AP_mag",56];
        _crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk262_PMAG",56];
        _crate addMagazineCargoGlobal ["rhsusf_200Rnd_556x45_soft_pouch",30];
        _crate addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m62_tracer",30];
        _crate addMagazineCargoGlobal ["rhs_fgm148_magazine_AT",3];
        _crate addMagazineCargoGlobal ["rhs_mag_maaws_HE",4];
        _crate addMagazineCargoGlobal ["rhs_mag_maaws_HEAT",4];
        _crate addMagazineCargoGlobal ["MAA_MAAWS_ASM509",4];
        _crate addMagazineCargoGlobal ["MAA_MAAWS_GMM_MT",4];
        
        _crate addMagazineCargoGlobal ["rhs_mag_M397_HET",36];
        _crate addMagazineCargoGlobal ["rhs_mag_M433_HEDP",36];
        _crate addMagazineCargoGlobal ["ACE_HuntIR_M203",4];
        _crate addMagazineCargoGlobal ["ACE_40mm_Flare_white",20];
        _crate addMagazineCargoGlobal ["ACE_40mm_Flare_red",20];
        _crate addMagazineCargoGlobal ["rhs_mag_m664_red_cluster",20];
        _crate addMagazineCargoGlobal ["rhs_mag_m713_Red",10];
        _crate addMagazineCargoGlobal ["rhs_mag_m716_yellow",10];
        _crate addMagazineCargoGlobal ["rhs_mag_M663_green_cluster",20];
        _crate addMagazineCargoGlobal ["ACE_40mm_Flare_ir",20];
        
        _crate addMagazineCargoGlobal ["NDS_M_6Rnd_60mm_HE_0",10];
        _crate addMagazineCargoGlobal ["NDS_M_6Rnd_60mm_HE",10];
        _crate addMagazineCargoGlobal ["NDS_M_6Rnd_60mm_SMOKE",10];
        _crate addMagazineCargoGlobal ["NDS_M_6Rnd_60mm_ILLUM",10];
        _crate addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_HE",40];
        _crate addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_Illum",10];
        _crate addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_HE_LaserGuided",10];
        _crate addMagazineCargoGlobal ["ACE_1Rnd_82mm_Mo_Smoke",10];
        

        //================== GRENADES ==================\\

        _crate addMagazineCargoGlobal ["HandGrenade",36];
        _crate addMagazineCargoGlobal ["SmokeShell",36];
        _crate addMagazineCargoGlobal ["SmokeShellRed",36];
        _crate addMagazineCargoGlobal ["SmokeShellBlue",36];
        _crate addMagazineCargoGlobal ["SmokeShellGreen",36];
        _crate addMagazineCargoGlobal ["SmokeShellYellow",36];
        _crate addMagazineCargoGlobal ["B_IR_Grenade",250];
        _crate addMagazineCargoGlobal ["ACE_M84",25];
        _crate addMagazineCargoGlobal ["ACE_Chemlight_HiYellow",250];
        _crate addMagazineCargoGlobal ["ACE_Chemlight_HiBlue",250];
        _crate addMagazineCargoGlobal ["ACE_Chemlight_HiRed",250];

        //================== EXPLOSIVES ==================\\


        //================== ITEMS ==================\\

        _crate addItemCargoGlobal ["USP_PVS15",20];
        _crate addItemCargoGlobal ["ACE_Flashlight_MX991",50];
        _crate addItemCargoGlobal ["ACE_CableTie",100];
        _crate addItemCargoGlobal ["ACE_wirecutter",5];
        _crate addItemCargoGlobal ["ACE_EntrenchingTool",20];
        _crate addItemCargoGlobal ["B_UavTerminal",20];
        _crate addItemCargoGlobal ["ItemAndroid", 10];
        _crate addItemCargoGlobal ["ItemcTab", 10];
        _crate addItemCargoGlobal ["ItemcTabHCam", 10];

        //================== MEDICAL ==================\\

        _crate addItemCargoGlobal ["ACE_EarPlugs",250];
        _crate addItemCargoGlobal ["ACE_quikclot",250];
        _crate addItemCargoGlobal ["ACE_packingBandage",250];
        _crate addItemCargoGlobal ["ACE_tourniquet",48];
        _crate addItemCargoGlobal ["ACE_splint",36];
        _crate addItemCargoGlobal ["ACE_bodyBag",12];
        _crate addMagazineCargoGlobal ["kat_Painkiller",20];


        //================== BACKPACKS ==================\\

        //================== HELMETS ==================\\
        
    };
    
    // Container ATLAS
    if (_companySelector in ['BRAVO', 'ATLAS'] or _alwaysAvalible) then {
        //================== RADIOS ==================\\

        _crate addItemCargoGlobal ["ACRE_PRC152",10];
        _crate addItemCargoGlobal ["ACRE_PRC117F",5];
        _crate addItemCargoGlobal ["ACRE_PRC343",12];

        //================== LAUNCHERS ==================\\



        //================== OPTICS ==================\\

        _crate addItemCargoGlobal ["rhsusf_acc_eotech_552",10];
        _crate addItemCargoGlobal ["rhsusf_acc_anpeq15_bk_light",50];
        _crate addItemCargoGlobal ["acc_flashlight",50];
        _crate addItemCargoGlobal ["rhsusf_acc_ELCAN",50];
        _crate addItemCargoGlobal ["rhsusf_acc_compm4",50];
        _crate addItemCargoGlobal ["rhsusf_acc_acog3",50];
        _crate addItemCargoGlobal ["rhsusf_acc_eotech_xps3",50];
        _crate addItemCargoGlobal ["rhsusf_acc_eotech",50];

        //================== AMMO ==================\\

        _crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_PMAG",56];
        _crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",56];
        _crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_M995_AP_mag",56];
        

        //================== GRENADES ==================\\

        _crate addMagazineCargoGlobal ["HandGrenade",36];
        _crate addMagazineCargoGlobal ["SmokeShell",36];
        _crate addMagazineCargoGlobal ["SmokeShellRed",36];
        _crate addMagazineCargoGlobal ["SmokeShellBlue",36];
        _crate addMagazineCargoGlobal ["SmokeShellGreen",36];
        _crate addMagazineCargoGlobal ["SmokeShellYellow",36];
        _crate addMagazineCargoGlobal ["B_IR_Grenade",10];
        _crate addMagazineCargoGlobal ["ACE_Chemlight_HiYellow",250];
        _crate addMagazineCargoGlobal ["ACE_Chemlight_HiBlue",250];
        _crate addMagazineCargoGlobal ["ACE_Chemlight_HiRed",250];

        //================== EXPLOSIVES ==================\\


        //================== ITEMS ==================\\
        
        _crate addItemCargoGlobal ["ACE_Flashlight_MX991",50];
        _crate addItemCargoGlobal ["ACE_CableTie",100];
        _crate addItemCargoGlobal ["ACE_wirecutter",10];
        _crate addItemCargoGlobal ["ACE_EntrenchingTool",20];
        _crate addItemCargoGlobal ["ACE_IR_Strobe_Item",20];
        _crate addItemCargoGlobal ["ItemAndroid", 10];
        _crate addItemCargoGlobal ["ItemcTab", 10];
        

        //================== MEDICAL ==================\\
        _crate addItemCargoGlobal ["ACE_EarPlugs",250];

        _crate addItemCargoGlobal ["ACE_quikclot",250];
        _crate addItemCargoGlobal ["ACE_packingBandage",250];
        _crate addItemCargoGlobal ["ACE_elasticBandage",250];
        _crate addItemCargoGlobal ["ACE_tourniquet",250];
        _crate addItemCargoGlobal ["ACE_splint",250];
    };
    // Container Sabre
    if (_companySelector in ['BRAVO', 'SABER'] or _alwaysAvalible) then {
    };
};

//          C H A R L I E   C O M P A N Y   C A R G O
if (_companySelector in _charlie or _alwaysAvalible) then {
    // Loadouts Bandit & Misfit
    if (_companySelector in ['CHARLIE', 'BANDIT', 'MISFIT'] or _alwaysAvalible) then {
    };

    //==================    WEAPONS    ==================\\
        _crate addWeaponCargoGlobal ["rhs_weap_M136_hp",10];
        _crate addWeaponCargoGlobal ["rhs_weap_M136_hedp",10];
        _crate addWeaponCargoGlobal ["rhs_weap_m72a7",50];
        _crate addWeaponCargoGlobal ["dzn_MG_Tripod_M122A1_M240Mount_Carry",5];

    //==================    HEAD GEAR    ==================\\


    //==================    OPTICS    ==================\\
        _crate addItemCargoGlobal ["rhsusf_acc_eotech_xps3",10];
        _crate addItemCargoGlobal ["rhsusf_acc_eotech",10];
        _crate addItemCargoGlobal ["rhsusf_acc_compm4",10];
        _crate addItemCargoGlobal ["rhsusf_acc_acog_rmr",10];

    //==================    MEDICAL    ==================\\
        _crate addItemCargoGlobal ["ACE_quikclot",250];
        _crate addItemCargoGlobal ["ACE_tourniquet",50];
        _crate addMagazineCargoGlobal ["kat_Painkiller",20];

    //==================    AMMO    ==================\\
        _crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_PMAG",250];
        _crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",250];
        _crate addMagazineCargoGlobal ["ACE_30Rnd_556x45_Stanag_M995_AP_mag",56];
        _crate addMagazineCargoGlobal ["rhsusf_200Rnd_556x45_soft_pouch",100];
        _crate addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m62_tracer",50];
        _crate addMagazineCargoGlobal ["rhs_mag_M433_HEDP",100];
        _crate addMagazineCargoGlobal ["rhs_mag_M397_HET",25];
        _crate addMagazineCargoGlobal ["rhs_mag_m714_White",25];
        _crate addMagazineCargoGlobal ["rhs_mag_m715_Green",25];
        _crate addMagazineCargoGlobal ["rhs_mag_m716_yellow",25];
        _crate addMagazineCargoGlobal ["rhs_mag_m713_Red",25];
        _crate addMagazineCargoGlobal ["ACE_40mm_Flare_green",25];
        _crate addMagazineCargoGlobal ["ACE_40mm_Flare_red",25];
        _crate addMagazineCargoGlobal ["ACE_40mm_Flare_ir",25];
        _crate addMagazineCargoGlobal ["ACE_HUNTIR_M203",25];
        _crate addMagazineCargoGlobal ["rhs_mag_maaws_HE",50];
        _crate addMagazineCargoGlobal ["rhs_mag_maaws_HEAT",50];
        _crate addMagazineCargoGlobal ["rhs_mag_maaws_HEAT",50];
        _crate addMagazineCargoGlobal ["rhs_fim92_mag",10];
        _crate addMagazineCargoGlobal ["rhs_fgm148_magazine_AT",10];
        _crate addMagazineCargoGlobal ["NDS_M_6Rnd_60mm_HE_0",10];
        _crate addMagazineCargoGlobal ["NDS_M_6Rnd_60mm_HE",10];
        _crate addMagazineCargoGlobal ["NDS_M_6Rnd_60mm_SMOKE",10];
        _crate addMagazineCargoGlobal ["NDS_M_6Rnd_60mm_ILLUM",10];

    //==================    GRENADES    ==================\\
        _crate addMagazineCargoGlobal ["rhs_mag_m67",50];
        _crate addMagazineCargoGlobal ["SmokeShell",50];
        _crate addMagazineCargoGlobal ["SmokeShellBlue",25];
        _crate addMagazineCargoGlobal ["SmokeShellGreen",25];
        _crate addMagazineCargoGlobal ["SmokeShellYellow",25];
        _crate addMagazineCargoGlobal ["SmokeShellRed",25];
        _crate addMagazineCargoGlobal ["ACE_Chemlight_HiWhite",25];
        _crate addMagazineCargoGlobal ["ACE_Chemlight_HiBlue",25];
        _crate addMagazineCargoGlobal ["ACE_Chemlight_HiGreen",25];
        _crate addMagazineCargoGlobal ["ACE_Chemlight_HiYellow",25];
        _crate addMagazineCargoGlobal ["ACE_Chemlight_HiRed",25];
        _crate addMagazineCargoGlobal ["ACE_Chemlight_IR",25];
        _crate addMagazineCargoGlobal ["B_IR_Grenade",25];
        _crate addMagazineCargoGlobal ["ACE_M84",50];


    //==================    RADIOS    ==================\\
        //_crate addItemCargoGlobal ["ACRE_PRC343",10];
        //_crate addItemCargoGlobal ["ACRE_PRC152",10];

   //==================    ITEMS    ==================\\
        _crate addItemCargoGlobal ["ACE_Clacker",10];
        _crate addItemCargoGlobal ["ACE_DefusalKit",10];
        _crate addItemCargoGlobal ["ACE_M26_Clacker",20];
        _crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag",50];
        _crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag",50];
        _crate addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag",25];
        _crate addItemCargoGlobal ["ACE_CableTie",100];
        _crate addItemCargoGlobal ["USP_PVS15",50];
        _crate addItemCargoGlobal ["ACE_EntrenchingTool",10];
        _crate addItemCargoGlobal ["ACE_wirecutter",10];
        _crate addItemCargoGlobal ["rhs_weap_rsp30_green",10];
        _crate addItemCargoGlobal ["rhs_weap_rsp30_red",10];
        _crate addItemCargoGlobal ["ACE_SpareBarrel", 4];
    
    //==================    BACKPACKS    ==================\\
        _crate addItemCargoGlobal ["B_TacticalPack_mcamo",10];
        _crate addItemCargoGlobal ["B_Kitbag_mcamo",10];
};
