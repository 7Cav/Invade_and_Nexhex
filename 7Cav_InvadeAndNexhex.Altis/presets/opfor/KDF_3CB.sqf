/*
    File: KDF_3CB.sqf
    Author: 7th Cav Dev Team

    Description:
       Defines presets for OPFOR faction.

*/
// OPFOR Infantry - General
rf_rifleman =                 "UK3CB_KDF_O_RIF_1";
rf_autorifleman =             "UK3CB_KDF_O_AR";
rf_grenadier =                "UK3CB_KDF_O_GL";
rf_lat =                      "UK3CB_KDF_O_LAT";
rf_cls =                      "UK3CB_KDF_O_MD";
rf_tl =                       "UK3CB_KDF_O_TL";
rf_sl =                       "UK3CB_KDF_O_SL";

// OPFOR Infantry - Special Forces
rf_sf_rifleman =              "UK3CB_KDF_O_SF_RIF_1";
rf_sf_autorifleman =          "UK3CB_KDF_O_SF_AR";
rf_sf_grenadier =             "UK3CB_KDF_O_SF_GL";
rf_sf_lat =                   "UK3CB_KDF_O_SF_LAT";
rf_sf_cls =                   "UK3CB_KDF_O_SF_MD";
rf_sf_tl =                    "UK3CB_KDF_O_SF_TL";
rf_sf_sl =                    "UK3CB_KDF_O_SF_SL";

// OPFOR Infantry - Sniper Team
rf_sniper =                   "UK3CB_KDF_O_SF_SNI";
rf_spotter =                  "UK3CB_KDF_O_SF_SPOT";

// OPFOR Infantry - Weapons Team
rf_wp_machinegunner =         "UK3CB_KDF_O_MG";
rf_wp_ammobearer =            "UK3CB_KDF_O_MG_ASST";

// OPFOR Infantry - AT Team
rf_at_at =                    "UK3CB_KDF_O_AT";
rf_at_ammobearer =            "UK3CB_KDF_O_AT_ASST";

// OPFOR Infantry - AA Team
rf_aa_aa =                    "UK3CB_KDF_O_AA";
rf_aa_ammobearer =            "UK3CB_KDF_O_AA_ASST";

// OPFOR Crew
rf_ground_crew =              "UK3CB_KDF_O_RIF_2";
rf_armor_crew =               "UK3CB_KDF_O_CREW";
rf_rotary_crew =              "UK3CB_KDF_O_HELI_PILOT";
rf_fixed_crew =               "UK3CB_KDF_O_JET_PILOT";

// OPFOR Turret - Mortar Team
rf_mortar =                   "UK3CB_KDF_O_2b14_82mm"; 

// OPFOR Ground Vehicles

rf_trooptransport =           "UK3CB_KDF_O_Ural"; // Requires 9 seats minimum
rf_motorized =                "UK3CB_KDF_O_UAZ_MG"; // Must have turret
rf_mrap =                     "rhsgref_BRDM2_vdv"; // Must have turret
rf_apc =                      "rhs_btr70_vdv";
rf_ifv =                      "rhs_bmp2e_vdv";
rf_tank_light =               "rhs_t72ba_tv";
rf_tank_heavy =               "rhs_t90_tv";
rf_sp_aa_gun =                "rhs_zsu234_aa";
rf_sp_aa_missle =             "UK3CB_O_2S6M_Tunguska_VPV";

// OPFOR Rotary Vehicles
rf_rotary_transport =         "RHS_Mi8T_vdv"; // Requires 9 seats minimum
rf_rotary_gunship =           "RHS_Mi8mt_vdv";
rf_rotary_attack_light =      "RHS_Mi24P_vdv";
rf_rotary_attack_heavy =      "RHS_Mi24P_vdv";

//OPFOR Fixed Wing
rf_fw_recon =                 "rhs_mig29sm_vvsc";
rf_fw_cas =                   "rhs_mig29sm_vvsc";
rf_fw_cap =                   "rhs_mig29sm_vvsc";

//OPFOR Misc
rf_sp_artillery =             "RHS_BM21_VDV_01";
rf_radar =                    "Land_Radar_Small_F";
rf_officer =                  "UK3CB_KDF_O_OFF";
rf_officer_staff =            "UK3CB_KDF_O_JNR_OFF";
rf_radioman =                 "UK3CB_KDF_O_RADIO";
rf_hq_building =              "CampEast_EP1";

/* GROUP ARRAYS - No Touchy */

rf_sentry_team = [

   rf_tl,
   rf_autorifleman

];

rf_fireteam = [

   rf_tl,
   rf_autorifleman,
   rf_lat,
   rf_grenadier

];

rf_squad = [

   rf_sl,
   rf_tl,
   rf_autorifleman,
   rf_lat,
   rf_grenadier,
   rf_tl,
   rf_autorifleman,
   rf_lat,
   rf_cls

];

rf_gun_team = [

   rf_tl,
   rf_wp_machinegunner,
   rf_wp_machinegunner,
   rf_wp_ammobearer

];

rf_at_team = [

   rf_tl,
   rf_at_at,
   rf_at_at,
   rf_at_ammobearer

];

rf_aa_team = [

   rf_tl,
   rf_aa_aa,
   rf_aa_aa,
   rf_aa_ammobearer

];

rf_hq_team = [

   rf_officer,
   rf_officer_staff,
   rf_officer_staff,
   rf_radioman

];