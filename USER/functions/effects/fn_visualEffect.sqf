// by ALIAS

if (!hasInterface) exitWith {};

params ["_obj", "_visualEffect", "_playerEffect"];

enableCamShake true;
addCamShake [1,50,27];

if (_visualEffect) then {

	private _pos = getPosATL _obj;

	private _ripple = "#particlesource" createVehicleLocal _pos;
	_ripple setParticleCircle [0,[0,0,0]];
	_ripple setParticleRandom [0,[0.25,0.25,0],[0.175,0.175,0],0,0.25,[0,0,0,0.1],0,0];
	_ripple setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d",1,0,1], "", "Billboard", 1, 0.5, [0, 0, 0], [0, 0, 0],0,10,7.9,0, [30,1000], [[1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _obj];
	_ripple setDropInterval 0.1;

	[{
		params ["_effect"];

		deleteVehicle _effect;
	}, [_ripple], 1] call CBA_fnc_waitAndExecute;

	private _blast = "#particlesource" createVehicleLocal _pos;
	_blast setParticleCircle [0, [0, 0, 0]];
	_blast setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
	_blast setParticleParams [["\A3\data_f\koule", 1, 0, 1], "", "SpaceObject", 1,1,[0,0,0],[0,0,1],3,10,7.9,0,[50,1000],[[1, 1, 1, 0.1], [1, 1, 1, 0]], [1], 1, 0, "", "", _obj];
	_blast setDropInterval 50;
	[{
		params ["_effect"];

		deleteVehicle _effect;
	}, [_blast], 1] call CBA_fnc_waitAndExecute;

	private _light = "#lightpoint" createVehiclelocal _pos; 
	_light lightAttachObject [_obj, [0,0,3]];
	_light setLightAmbient [1,1,1];  
	_light setLightColor [1,1,1];
	_light setLightBrightness 0;
	_light setLightDayLight true;
	_light setLightAttenuation [10, 10, 50, 0, 50, 2000];
	
	private _brightness = 0;
	
	while {_brightness < 50} do {
		
		_brightness = _brightness + 2;

		[{
			params ["_light", "_brightness"];

			_light setLightBrightness _brightness;
		}, [_light, _brightness], (_brightness/2 * 0.01)] call CBA_fnc_waitAndExecute;
	};
	
	[{
		params ["_effect"];

		deleteVehicle _effect;
	}, [_light], (_brightness/2 * 0.01) + 0.01] call CBA_fnc_waitAndExecute;
};

if (_playerEffect) then 
{
	[{
		cutText ["", "WHITE OUT", 1];

		[{
			titleCut ["", "WHITE IN", 1];
			"dynamicBlur" ppEffectEnable true;   
			"dynamicBlur" ppEffectAdjust [5];   
			"dynamicBlur" ppEffectCommit 0;

			[{    
				"dynamicBlur" ppEffectAdjust [1];
				"dynamicBlur" ppEffectCommit 1; 

				[{ 
					playsound "tiuit";
					"dynamicBlur" ppEffectAdjust [0];
					"dynamicBlur" ppEffectCommit 10;
					
					[{
						"dynamicBlur" ppEffectEnable false;
					}, [], 10] call CBA_fnc_waitAndExecute;
				}, [], 5] call CBA_fnc_waitAndExecute;
			}, [], 1] call CBA_fnc_waitAndExecute;
		}, [], 0.1] call CBA_fnc_waitAndExecute;
	}, [], 1] call CBA_fnc_waitAndExecute;
};