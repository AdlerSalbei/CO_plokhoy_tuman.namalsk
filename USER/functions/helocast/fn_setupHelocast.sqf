

if (!isDedicated && !isServer) exitwith {};

params ["_helo"];

// ===== VEHICLE TYPE DETECTION =====

//push: does the boat need to be slid aft until it falls out of the helo?
//ramp: an array of the animation name of the ramp (if the helo has a ramp, otherwise set as empty array)
//jumpOffset: offsets from vehicle center of where to jump from (OBE 2019-12-24)
//boatCoords: where does the boat go relative to the helo center
//recover: can the helo reasonably recover a CRRC

switch(typeof _helo) do
{
	//RHS CH-47 series
	case "RHS_CH_47F_10";
	case "RHS_CH_47F_light";
	case "RHS_CH_47F": 
	{
		_helo setvariable ["grad_helocast_boatCoords", [0,-3.4,-1.3], true];
		_helo setvariable ["grad_helocast_push", true, true];
		_helo setvariable ["grad_helocast_ramp", ["ramp"], true];
		_helo setVariable ["grad_helocast_jumpOffset", [0,-5,1], true];
		_helo setVariable ["grad_helocast_recover", true, true];
	};
	
	//RHS CH-53 series
	case "rhsusf_CH53E_USMC";
	case "rhsusf_CH53E_USMC_D": 
	{
		_helo setvariable ["grad_helocast_boatCoords", [0,0.5,-2.65], true];
		_helo setvariable ["grad_helocast_push", true, true];
		_helo setvariable ["grad_helocast_ramp", ["ramp_bottom", "ramp_top"], true];
		_helo setVariable ["grad_helocast_jumpOffset", [0,-5,1], true];
		_helo setVariable ["grad_helocast_recover", true, true];
	};
	
	//RHS UH-60 Series
	case "RHS_UH60M";
	case "RHS_UH60M_d";
	case "RHS_UH60M_ESSS_d";
	case "RHS_UH60M_ESSS";
	case "RHS_UH60M_ESSS2_d";
	case "RHS_UH60M_ESSS2";
	case "RHS_UH60M2_d";
	case "RHS_UH60M2";
	case "RHS_UH60M_MEV2_d";
	case "RHS_UH60M_MEV_d";
	case "RHS_UH60M_MEV2";
	case "RHS_UH60M_MEV": 
	{
		_helo setvariable ["grad_helocast_boatCoords", [0, 1.8, -1.4], true];
		_helo setvariable ["grad_helocast_push", false, true];
		_helo setvariable ["grad_helocast_ramp", [], true];
		_helo setVariable ["grad_helocast_jumpOffset", [2.5,1,0], true];
		_helo setVariable ["grad_helocast_recover", false, true];
	};
	
	//Vanilla CH-67 Series
	case "B_Heli_Transport_03_F";
	case "B_Heli_Transport_03_unarmed_F";
	case "B_Heli_Transport_03_black_F";	
	case "B_Heli_Transport_03_unarmed_green_F ": 
	{
		_helo setvariable ["grad_helocast_boatCoords", [0, -2.1, -0.6], true];
		_helo setvariable ["grad_helocast_push", true, true];
		_helo setvariable ["grad_helocast_ramp", ["Door_rear_source"], true];
		_helo setVariable ["grad_helocast_jumpOffset", [0,-6.2,0.3], true];
		_helo setVariable ["grad_helocast_recover", false, true];	//This SHOULD work but the -67s sink when they touch a boat...
	};

	default {
		diag_log format["grad_helocast_---Fat_Lurch debug - Exited Helocast because of unsupported type: %1", typeOf _helo];
	};		
};
















