class LivoniaRebels {
    class AllUnits {
        uniform[] = {"U_I_L_Uniform_01_tshirt_sport_F", "U_C_E_LooterJacket_01_F", "U_O_R_Gorka_01_black_F", "U_I_L_Uniform_01_tshirt_black_F", "U_C_HunterBody_grn", "U_I_L_Uniform_01_tshirt_olive_F", "U_I_L_Uniform_01_tshirt_skull_F"};
        vest = "";
        backpack[] = {"B_Messenger_Black_F", "B_Messenger_Coyote_F", "B_Messenger_Olive_F", "B_Messenger_Gray_F"};
        headgear[] = {"H_Hat_tan", "H_Bandanna_blu", "H_Shemag_olive", "H_Bandanna_khk", "gm_ge_headgear_hat_80_oli", "H_Cap_blu", "H_Cap_oli"};
        primaryWeapon = "";
        primaryWeaponMagazine = "";
        primaryWeaponMuzzle = "";
        primaryWeaponOptics = "";
        primaryWeaponPointer = "";
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
        nvgoggles = "";
        binoculars = "";
        map = "";
        gps = "";
        compass = "ItemCompass";
        watch = "ItemWatch";
        radio = "";
    };
    class Type {
        class soldier_F {
            primaryWeapon = "rhs_weap_aks74u";
            primaryWeaponMagazine = "rhs_30Rnd_545x39_7N6M_AK";
            primaryWeaponMuzzle = "rhs_acc_dtk1983";
            addItemsToUniform[] = {
                LIST_1("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_8("rhs_30Rnd_545x39_7N6M_AK")
            };
        };

        class Soldier_SL_F: soldier_F {
            primaryWeapon = "rhs_weap_m1garand_sa43";
            primaryWeaponMagazine = "rhsgref_8Rnd_762x63_M2B_M1rifle";

            addItemsToBackpack[] = {
                LIST_8("rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle")
            };
        };

        class Soldier_LAT_F: soldier_F {
            primaryWeapon = "SMG_03C_black";
            primaryWeaponMagazine = "50Rnd_570x28_SMG_03";


            addItemsToBackpack[] = {
                LIST_8("50Rnd_570x28_SMG_03")
            };
        };
        class Soldier_M_F: soldier_F {
            primaryWeapon = "rhs_weap_m3a1";
            primaryWeaponMagazine = "rhsgref_30rnd_1143x23_M1T_2mag_SMG";

            addItemsToBackpack[] = {
                LIST_8("rhsgref_30rnd_1143x23_M1T_2mag_SMG")
            };
        };
        class Soldier_TL_F: soldier_F {
            primaryWeapon = "rhs_weap_M590_8RD";
            primaryWeaponMagazine = "rhsusf_8Rnd_00Buck";

            addItemsToBackpack[] = {
                LIST_8("rhsusf_8Rnd_00Buck")
            };
        };
        class Soldier_AR_F: soldier_F {
            primaryWeapon = "sgun_HunterShotgun_01_F";
            primaryWeaponMagazine = "2Rnd_12Gauge_Pellets";

            addItemsToBackpack[] = {
                LIST_8("2Rnd_12Gauge_Pellets")
            };
        };
        class Soldier_A_F: soldier_F {
            primaryWeapon = "SMG_05_F";
            primaryWeaponMagazine = "30Rnd_9x21_Mag_SMG_02";
            primaryWeaponOptics = "optic_ACO_grn";

            addItemsToBackpack[] = {
                LIST_6("30Rnd_9x21_Mag_SMG_02")
            };
        };
        class medic_F: soldier_F {
            primaryWeapon = "rhs_weap_l1a1_wood";
            primaryWeaponMagazine = "rhs_mag_20Rnd_762x51_m80_fnfal";
            primaryWeaponMuzzle = "rhsgref_acc_falMuzzle_l1a1";

            addItemsToBackpack[] = {
                LIST_6("rhs_mag_20Rnd_762x51_m62_fnfal")
            };
        };

        class Soldier_GL_F: soldier_F {
            primaryWeapon = "LOP_Weap_LeeEnfield_railed";
            primaryWeaponMagazine = "LOP_10rnd_77mm_mag";
            addItemsToBackpack[] = {
                LIST_8("LOP_10rnd_77mm_mag")
            };
        };
    };
};
