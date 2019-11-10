// by ALIAS

if (!hasInterface) exitWith {};

params ["_obj"];

private _bbr = 0 boundingBoxReal vehicle _obj;
_bbr params ["_p1", "_p2"];
private _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
private _maxLength = abs ((_p2 select 1) - (_p1 select 1));
private _maxHeight = abs ((_p2 select 2) - (_p1 select 2));

private _effect = "#particlesource" createVehicleLocal (getPos _obj);

if (_obj isKindOf "MAN") then {
	_effect setParticleCircle [0,[0,0,0]];
	_effect setParticleRandom [0.2,[_maxWidth/4,_maxLength/4,_maxHeight],[0,0,0],0,0.001,[0,0,0,1],1,0];
	_effect setParticleParams [["\A3\data_f\blesk1",1,0,1],"","SpaceObject",1,0.1,[0,0,0],[0,0,0],0,10,7.9,0,[0.002,0.002],[[1,1,0.1,1],[1,1,1,1]],[0.08], 1, 0, "", "", _obj];
};

if (_obj isKindOf "LandVehicle") then {
	_effect setParticleCircle [_maxWidth-0.5,[0,0,0]];
	_effect setParticleRandom [0.2,[0.2,0.2,_maxHeight/2-0.5],[0,0,0],0,0.02,[0,0,0,1],1,0];
	_effect setParticleParams [["\A3\data_f\blesk1",1,0,1],"","SpaceObject",1,0.1,[0,0,0],[0,0,0],0,10,7.9,0,[0.003,0.003],[[1,1,0.1,1],[1,1,1,1]],[0.08], 1, 0, "", "", _obj];
};

_effect setDropInterval 0.001;
[{
	params ["_effect"];

	deleteVehicle _effect;
}, [_effect], 0.7] call CBA_fnc_waitAndExecute;