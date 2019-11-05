#ifdef NIGHTVISION
  #define NVITEM "rhsusf_ANPVS_15"
#else
  #define NVITEM ""
#endif

#ifdef LASERS
  #define LLITEM "rhsusf_acc_anpeq15_bk"
#else
  #define LLITEM ""
#endif

#ifdef GUNLIGHTS
  #define LLITEM "rhsusf_acc_anpeq15_bk_light"
#endif

#ifdef SUPPRESSORS
  #define SUPPRESSORITEM "rhsusf_acc_nt4_black"
#else
  #define SUPPRESSORITEM ""
#endif

class gm_westDeutschland {
    class AllUnits {
        uniform = "gm_ge_army_uniform_soldier_80_ols";
		vest = "gm_ge_army_vest_80_rifleman";
        backpack = "";
		headgear = "gm_ge_headgear_m62_net";
        primaryWeapon = "gm_g3a3_oli";
        primaryWeaponMagazine = "gm_20Rnd_762x51mm_B_DM41_g3_blk";
        primaryWeaponMuzzle = SUPPRESSORITEM;
        primaryWeaponOptics = "";
        primaryWeaponPointer = LLITEM;
        primaryWeaponUnderbarrel = "";
        primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
        secondaryWeaponMuzzle = "";
        secondaryWeaponOptics = "";
        secondaryWeaponPointer = "";
        secondaryWeaponUnderbarrel = "";
        secondaryWeaponUnderbarrelMagazine = "";
        handgunWeapon = "";
        handgunWeaponMagazine = "";
        handgunWeaponMuzzle = "";
        handgunWeaponOptics = "";
        handgunWeaponPointer = "";
        handgunWeaponUnderbarrel = "";
        handgunWeaponUnderbarrelMagazine = "";
        goggles = "";
        nvgoggles = NVITEM;
        binoculars = "";
		map = "ItemMap";
        compass = "gm_ge_army_conat2";
        watch[] = {"ItemWatch", "gm_watch_kosei_80"};
        gps = "";
        radio = "";
    };
    class Type {
		//Rifleman
        class Soldier_F {
            addItemsToUniform[] = {
                LIST_1("ACE_MapTools"),

                LIST_4("ACE_packingBandage"),
                LIST_4("ACE_elasticBandage"),
                LIST_4("ACE_quikclot"),
                LIST_4("ACE_tourniquet"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_epinephrine"),

                LIST_1("gm_ge_headgear_hat_80_m62_oli")
            };
            addItemsToVest[] = {
                LIST_5("gm_20Rnd_762x51mm_B_DM41_g3_blk"),
                LIST_2("gm_handgrenade_frag_dm51a1")
            };
        };
		//Anti-Tank
        class soldier_LAT_F: Soldier_F {
            backpack = "gm_ge_army_backpack_80_pzf44_oli";
            secondaryWeapon = "gm_pzf44_2_oli_feroz2x17";
            secondaryWeaponMagazine = "gm_1Rnd_44x537mm_heat_dm32_pzf44_2";
            secondaryWeaponOptics = "gm_feroz2x17_pzf44_2_blk";

            addItemsToVest[] = {
                LIST_5("gm_20Rnd_762x51mm_B_DM41_g3_blk"),
                LIST_2("gm_handgrenade_frag_dm51a1")
            };
            addItemsToBackpack[] = {
                LIST_3("gm_1Rnd_44x537mm_heat_dm32_pzf44_2")
            };
        };
		//Anti-Tank Assistant
        class soldier_LAT2_F: Soldier_F {
            backpack = "gm_ge_army_backpack_80_pzf44_oli";

            addItemsToVest[] = {
                LIST_5("gm_20Rnd_762x51mm_B_DM41_g3_blk"),
                LIST_2("gm_handgrenade_frag_dm51a1")
            };
            addItemsToBackpack[] = {
                LIST_3("gm_1Rnd_44x537mm_heat_dm32_pzf44_2")
            };
        };
		// ATGM Gunner
        class support_GMG_F: Soldier_F {
            backpack = "gm_milan_launcher_weaponBag";

            addItemsToVest[] = {
                LIST_5("gm_20Rnd_762x51mm_B_DM41_g3_blk"),
                LIST_2("gm_handgrenade_frag_dm51a1")
            };
        };
		//Crew
        class crew_F: Soldier_F {
            uniform = "gm_ge_army_uniform_crew_80_oli";
            vest = "gm_ge_army_vest_80_crew";
            backpack = "";
            headgear = "gm_ge_headgear_crewhat_80_blk";
            primaryWeapon = "gm_mp2a1_blk";
            primaryWeaponMagazine = "gm_32Rnd_9x19mm_B_DM11_mp2_blk";
            binoculars = "gm_ferod16_oli";
            addItemsToUniform[] = {
                LIST_1("ACE_MapTools"),

                LIST_4("ACE_packingBandage"),
                LIST_4("ACE_elasticBandage"),
                LIST_4("ACE_quikclot"),
                LIST_4("ACE_tourniquet"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_epinephrine"),

                LIST_3("gm_32Rnd_9x19mm_B_DM11_mp2_blk")
            };
            addItemsToVest[] = {
                LIST_2("gm_32Rnd_9x19mm_B_DM11_mp2_blk"),
                LIST_2("gm_handgrenade_frag_dm51a1")
            };
        };
		//Demolition
        class soldier_exp_F: Soldier_F {
            vest = "gm_ge_army_vest_80_demolition";
            backpack = "gm_ge_army_backpack_80_demolition_oli";
            primaryWeapon = "gm_g3a4_oli";
            binoculars = "";

            addItemsToVest[] = {
                LIST_5("gm_20Rnd_762x51mm_B_DM41_g3_blk"),
                LIST_1("gm_smokeshell_red_dm23"),
                LIST_1("gm_smokeshell_grn_dm21"),
                LIST_1("gm_smokeshell_yel_dm26"),
                LIST_1("gm_smokeshell_wht_dm25")
            };
            addItemsToBackpack[] = {
                LIST_1("gm_repairkit_01"),
                LIST_3("gm_explosive_petn_charge")
            };
        };
		//Grendaier
        class Soldier_GL_F: Soldier_F {
            backpack = "gm_ge_army_backpack_80_grenadier_oli";

            addItemsToVest[] = {
                LIST_5("gm_20Rnd_762x51mm_B_DM41_g3_blk"),
                LIST_3("gm_1rnd_67mm_heat_dm22a1_g3")
            };
            addItemsToBackpack[] = {
                LIST_6("gm_1rnd_67mm_heat_dm22a1_g3")
            };
        };
		//Heavy Anti-Tank
        class soldier_AT_F: Soldier_F {
            secondaryWeapon = "gm_pzf84_oli_feroz2x17";
            secondaryWeaponMagazine = "gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf";
            secondaryWeaponOptics = "gm_feroz2x17_pzf84_blk";

            addItemsToVest[] = {
                LIST_5("gm_20Rnd_762x51mm_B_DM41_g3_blk"),
                LIST_2("gm_handgrenade_frag_dm51a1")
            };
        };
		//Heavy Anti-Tank
        class soldier_AAT_F: Soldier_F {
            backpack = "gm_ge_army_backpack_80_pzf84_oli";

            addItemsToVest[] = {
                LIST_5("gm_20Rnd_762x51mm_B_DM41_g3_blk"),
                LIST_2("gm_handgrenade_frag_dm51a1")
            };
            addItemsToBackpack[] = {
                LIST_3("gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf")
            };
        };
		//MG
        class soldier_AR_F: Soldier_F {
            vest = "gm_ge_army_vest_80_machinegunner";
            primaryWeapon = "gm_mg3_blk";
            primaryWeaponMagazine = "gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn";
            addItemsToUniform[] = {
                LIST_1("ACE_MapTools"),

                LIST_4("ACE_packingBandage"),
                LIST_4("ACE_elasticBandage"),
                LIST_4("ACE_quikclot"),
                LIST_4("ACE_tourniquet"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_epinephrine"),

                LIST_1("gm_ge_headgear_hat_80_m62_oli"),
                LIST_2("gm_handgrenade_frag_dm51a1")
            };
            addItemsToVest[] = {
                LIST_3("gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn")
            };
        };
		//MG Assistant
        class soldier_AAR_F: Soldier_F {
            backpack = "gm_ge_army_backpack_80_mg3_oli";

            addItemsToVest[] = {
                LIST_5("gm_20Rnd_762x51mm_B_DM41_g3_blk"),
                LIST_4("gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn")
            };
            addItemsToBackpack[] = {
                LIST_3("gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn")
            };
        };
		//Medic
        class medic_F: Soldier_F {
            vest = "gm_ge_army_vest_80_medic";
            backpack = "gm_ge_army_backpack_80_mg3_oli";

            addItemsToVest[] = {
                LIST_5("gm_20Rnd_762x51mm_B_DM41_g3_blk")
            };

            class Rank {
                class PRIVATE {
                    GRAD_FACTIONS_MEDICITEMS_PT
                };
                class CORPORAL: PRIVATE {};
                class SERGEANT: PRIVATE {};
                class LIEUTENANT: PRIVATE {};
                class CAPTAIN: PRIVATE {};
                class MAJOR: PRIVATE {};
                class COLONEL: PRIVATE {};
            };
        };
		//Feldjäger
        class RangeMaster_F: Soldier_F {
            uniform = "gm_ge_army_uniform_soldier_80_oli";
            vest = "gm_ge_army_vest_80_mp_wht";
            headgear = "gm_ge_headgear_beret_red_militarypolice";
            handgunWeapon = "gm_p1_blk";
            handgunWeaponMagazine = "gm_8Rnd_9x19mm_B_DM11_p1_blk";
            inoculars = "gm_ferod16_oli";
            addItemsToUniform[] = {
                LIST_1("ACE_MapTools"),

                LIST_4("ACE_packingBandage"),
                LIST_4("ACE_elasticBandage"),
                LIST_4("ACE_quikclot"),
                LIST_4("ACE_tourniquet"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_epinephrine"),

                LIST_1("gm_ge_headgear_hat_80_m62_oli"),
                LIST_1("gm_8Rnd_9x19mm_B_DM11_p1_blk")
            };
        };
		//Officer
        class officer_F: Soldier_F {
            uniform = "gm_ge_army_uniform_soldier_80_oli";
            vest = "gm_ge_army_vest_80_officer";
            handgunWeapon = "gm_p1_blk";
            handgunWeaponMagazine = "gm_8Rnd_9x19mm_B_DM11_p1_blk";
            binoculars = "gm_ferod16_oli";
            addItemsToUniform[] = {
                LIST_1("ACE_MapTools"),

                LIST_4("ACE_packingBandage"),
                LIST_4("ACE_elasticBandage"),
                LIST_4("ACE_quikclot"),
                LIST_4("ACE_tourniquet"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_epinephrine"),

                LIST_1("gm_ge_headgear_hat_80_m62_oli"),
                LIST_1("gm_8Rnd_9x19mm_B_DM11_p1_blk")
            };
        };
		//Pioneer
        class engineer_F: Soldier_F {
            vest = "gm_ge_army_vest_80_leader";
            backpack = "gm_ge_army_backpack_80_engineer_oli";
            primaryWeapon = "gm_g3a4_oli";

            addItemsToVest[] = {
                LIST_1("gm_repairkit_01"),
                LIST_5("gm_20Rnd_762x51mm_B_DM41_g3_blk"),
                LIST_1("gm_smokeshell_red_dm23"),
                LIST_1("gm_smokeshell_grn_dm21"),
                LIST_1("gm_smokeshell_yel_dm26"),
                LIST_1("gm_smokeshell_wht_dm25")
            };
            addItemsToBackpack[] = {
                LIST_1("gm_mine_at_dm21")
            };
        };
		//SQL
        class Soldier_SL_F: Soldier_F {
            vest = "gm_ge_army_vest_80_leader";
            handgunWeapon = "gm_p2a1_blk";
            handgunWeaponMagazine = "gm_1Rnd_265mm_flare_single_wht_DM15";
            binoculars = "gm_ferod16_oli";

            addItemsToVest[] = {
                LIST_5("gm_20Rnd_762x51mm_B_DM41_g3_blk"),
                LIST_1("gm_smokeshell_red_dm23"),
                LIST_1("gm_smokeshell_grn_dm21"),
                LIST_1("gm_smokeshell_yel_dm26"),
                LIST_1("gm_smokeshell_wht_dm25"),
                LIST_1("gm_1Rnd_265mm_flare_single_wht_DM15"),
                LIST_1("gm_1Rnd_265mm_flare_multi_red_DM23"),
                LIST_1("gm_1Rnd_265mm_flare_multi_grn_DM21"),
                LIST_1("gm_1Rnd_265mm_flare_multi_yel_DM20")
            };
        };
    };
};
