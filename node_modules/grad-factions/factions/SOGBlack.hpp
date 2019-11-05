class SOGBLACK {
    class AllUnits {
        uniform = "rhs_uniform_g3_blk";
        vest = "V_PlateCarrier2_blk";
        backpack = "";
        headgear = "rhsusf_opscore_bk_pelt";
        primaryWeapon = "rhs_weap_SCARH_STD";
        primaryWeaponMagazine = "rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk";
        primaryWeaponMuzzle = "hlc_muzzle_300blk_KAC";
        primaryWeaponPointer = "acc_pointer_IR";
        primaryWeaponOptics = "optic_Holosight_blk_F";
		primaryWeaponUnderbarrel = "rhsusf_acc_grip1";
		primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
        handgunWeapon = "rhsusf_weap_glock17g4";
		handgunWeaponMuzzle = "hlc_muzzle_Octane9";
        handgunWeaponMagazine = "rhsusf_mag_17Rnd_9x19_FMJ";
        handgunWeaponPointer = "hlc_acc_DBALPL";
        binoculars = "ACE_Vector";
        map = "ItemMap";
        compass = "ItemCompass";
        watch = "ACE_Altimeter";
        gps = "ItemGPS";
        radio = "tfar_anprc152";
        nvgoggles = "NVGoggles_OPFOR";
        goggles = "G_Balaclava_TI_blk_F";
    };
    class Type {
        //Rifleman
        class Soldier_F {
            addItemsToUniform[] = {
                LIST_1("ACE_MapTools"),
                LIST_2("ACE_CableTie"),
                LIST_1("ACE_Flashlight_MX991"),

                LIST_4("ACE_packingBandage"),
                LIST_4("ACE_elasticBandage"),
                LIST_4("ACE_quikclot"),
                LIST_4("ACE_tourniquet"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_epinephrine")
            };
            addItemsToVest[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell"),
                LIST_1("rhsusf_mag_17Rnd_9x19_FMJ"),
                LIST_6("rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk")
            };
        };

        //Asst. Autorifleman
        class soldier_AAR_F: Soldier_F {
			vest = "V_PlateCarrier1_blk";
            backpack = "ga_kitbag_black";
            addItemsToBackpack[] = {
                LIST_2("rhs_200rnd_556x45_M_SAW")
            };
        };

        //Asst. Gunner (MMG) / Ammo Bearer
        class soldier_A_F: Soldier_F {
			vest = "V_PlateCarrier1_blk";
            backpack = "ga_kitbag_black";
            addItemsToBackpack[] = {
                LIST_4("rhsusf_100Rnd_762x51_m62_tracer"),
                "rhsusf_100Rnd_762x51"
            };
        };

        //Asst. Gunner (HMG/GMG)
        class support_AMG_F: Soldier_F {
			vest = "V_PlateCarrier1_blk";
            backpack = "RHS_M2_MiniTripod_Bag";
        };

        //Asst. Missile Specialist (AA)
        class soldier_AAA_F: Soldier_F {
			vest = "V_PlateCarrier1_blk";
            backpack = "B_ViperHarness_blk_F";
            addItemsToBackpack[] = {
                "rhs_fim92_mag"
            };
        };

        //Asst. Missile Specialist (AT)
        class soldier_AAT_F: Soldier_F {
			vest = "V_PlateCarrier1_blk";
            backpack = "B_ViperHarness_blk_F";
            addItemsToBackpack[] = {
                "rhs_fgm148_magazine_AT"
            };
        };

        //Autorifleman
        class soldier_AR_F: Soldier_F {
            primaryWeapon = "rhs_weap_m249_pip_S_para";
            primaryWeaponMagazine = "rhs_200rnd_556x45_M_SAW";
            primaryWeaponPointer = LLITEM_MG;
            handgunWeapon = "";
            handgunWeaponMagazine = "";
            addItemsToVest[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell"),
				LIST_2("rhs_200rnd_556x45_M_SAW"),
                "rhsusf_100Rnd_556x45_soft_pouch"
            };
        };

        //Combat Life Saver
        class medic_F: Soldier_F {
			vest = "V_TacVestIR_blk";
            backpack = "ga_kitbag_black_medic";
            addItemsToUniform[] = {
                "ACE_MapTools",
                "ACE_Flashlight_MX991"
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

        //Explosive Specialist
        class soldier_exp_F: Soldier_F {
			vest = "V_PlateCarrier1_blk";
            backpack = "ga_kitbag_black";
            addItemsToBackpack[] = {
                "ACE_Clacker",
                "ACE_M26_Clacker",
                "SatchelCharge_Remote_Mag",
                LIST_3("DemoCharge_Remote_Mag")
            };
        };

        //Grenadier
        class Soldier_GL_F: Soldier_F {
            primaryWeapon = "rhs_weap_mk18_m320";
            addItemsToVest[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell"),
                LIST_1("rhsusf_mag_17Rnd_9x19_FMJ"),
                LIST_8("rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk"),
                LIST_6("rhs_mag_M441_HE"),
                LIST_2("rhs_mag_m713_Red")
            };
        };

        //Heavy Gunner (MMG)
        class HeavyGunner_F: Soldier_F {
            primaryWeapon = "rhs_weap_m240B";
            primaryWeaponMagazine = "rhsusf_100Rnd_762x51";
            handgunWeapon = "";
            handgunWeaponMagazine = "";
            backpack = "ga_kitbag_black";
            addItemsToBackpack[] = {
                LIST_2("rhsusf_100Rnd_762x51_m62_tracer"),
                "rhsusf_100Rnd_762x51"
            };
            addItemsToVest[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell"),
				LIST_2("rhsusf_100Rnd_762x51_m62_tracer"),
                "rhsusf_100Rnd_762x51"
            };
        };

        //Gunner (HMG/GMG)
        class support_MG_F: Soldier_F {
			vest = "V_PlateCarrier1_blk";
            backpack = "RHS_M2_Gun_Bag";
        };

        //Marksman
        class soldier_M_F: Soldier_F {
            primaryWeapon = "rhs_weap_sr25_ec";
            primaryWeaponMagazine = "rhsusf_20Rnd_762x51_m118_special_Mag";
			primaryWeaponMuzzle = SUPPRESSORITEM_MARKSMAN;
            primaryWeaponPointer = LLITEM;
            primaryWeaponOptics = "optic_DMS";
            primaryWeaponUnderbarrel = "bipod_01_F_blk";
            addItemsToVest[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell"),
                LIST_1("rhsusf_mag_17Rnd_9x19_FMJ"),
                LIST_7("rhsusf_20Rnd_762x51_m118_special_Mag")
            };
        };

        //Missile Specialist (AA)
        class soldier_AA_F: Soldier_F {
            secondaryWeapon = "rhs_weap_fim92";
            secondaryWeaponMagazine = "rhs_fim92_mag";
			vest = "V_PlateCarrier1_blk";
            backpack = "B_ViperHarness_blk_F";
            addItemsToBackpack[] = {
                "rhs_fim92_mag"
            };
        };

        //Missile Specialist (AT)
        class soldier_AT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_fgm148";
            secondaryWeaponMagazine = "rhs_fgm148_magazine_AT";
			vest = "V_PlateCarrier1_blk";
            backpack = "B_ViperHarness_blk_F";
            addItemsToBackpack[] = {
                "rhs_fgm148_magazine_AT"
            };
        };

        //Repair Specialist
        class soldier_repair_F: Soldier_F {
			vest = "V_PlateCarrier1_blk";
            backpack = "ga_kitbag_black";
            addItemsToBackpack[] = {
                "ToolKit",
                "ACE_wirecutter"
            };
        };

        //Rifleman (AT)
        class soldier_LAT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_M136";
        };

        //Squad Leader
        class Soldier_SL_F: Soldier_F {
			vest = "V_PlateCarrier1_blk";
            backpack = "tfar_rt1523g_black";
            addItemsToBackpack[] = {
                LIST_2("SmokeShellBlue"),
                LIST_2("SmokeShellGreen"),
                LIST_2("SmokeShellOrange"),
                LIST_2("SmokeShellPurple"),
                LIST_2("SmokeShellRed"),
                LIST_2("SmokeShell")
            };
        };

        //Team Leader
        class Soldier_TL_F: Soldier_F {};

        //Officer
        class officer_F: Soldier_F {
            vest = "";
            backpack = "";
            headgear = "rhs_beret_vdv2";
            primaryWeapon = "";
            primaryWeaponMagazine = "";
            primaryWeaponMuzzle = "";
            primaryWeaponPointer = "";
            primaryWeaponOptics = "";
    		primaryWeaponUnderbarrel = "";
    		primaryWeaponUnderbarrelMagazine = "";
            secondaryWeapon = "";
            secondaryWeaponMagazine = "";
            handgunWeapon = "";
    		handgunWeaponMuzzle = "";
            handgunWeaponMagazine = "";
            handgunWeaponPointer = "";
            nvgoggles = "";
            goggles = "";
            binoculars = "";
        };
    };
};
