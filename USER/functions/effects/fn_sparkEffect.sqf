// by ALIAS

if (!hasInterface) exitWith {};

params ["_obj", "_time"];

private _bbr = 0 boundingBoxReal vehicle _obj;
_bbr params ["_p1", "_p2"];

private _maxHeight = abs ((_p2 select 2) - (_p1 select 2));
private _sparkPozRel = (_maxHeight/2)-0.45;
private _sparkType = ["spark1", "spark2", "spark3", "spark4", "spark5", "spark11", "spark22"] call BIS_fnc_selectRandom;
private _sparkColor = ["white", "orange"] call BIS_fnc_selectRandom;

private _drop = 0.001+(random 0.05);
private _spark = "#particlesource" createVehicleLocal (getPosATL _obj);
_spark setParticleCircle [0, [0, 0, 0]];

if (_sparkColor == "orange") then {
	_spark setParticleRandom [1, [0.1, 0.1, 0.1], [0, 0, 0], 0, 0.25, [0, 0, 0, 0], 0, 0];
	_spark setParticleParams [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0,_sparkPozRel], [0, 0, 0], 0, 15, 7.9, 0, [0.5,0.5,0.05], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _obj,0,true,0.3,[[0,0,0,0]]];
	_spark setDropInterval _drop;
} else {
	_spark setParticleRandom [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0];
	_spark setParticleParams [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0,_sparkPozRel], [0, 0, 0], 0, 20, 7.9, 0, [0.5,0.5,0.05], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", _obj,0,true,0.3,[[0,0,0,0]]];
	_spark setDropInterval 0.001;	
		
	_time = 0.1 + (random 0.4);
};

_obj say3D [_sparkType, 350];

[{
	params ["_spark"];

	deleteVehicle _spark;
}, [_spark], _time] call CBA_fnc_waitAndExecute;