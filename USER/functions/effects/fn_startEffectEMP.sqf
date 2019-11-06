// by ALIAS

if (!isServer) exitWith {};

params ["_obj", "_range", "_visualEffect", "_playerEffect"];

if (_visualEffect || _playerEffect) then {
	[_obj, _visualEffect, _playerEffect] remoteExecCall ["grad_user_fnc_visualEffect", 0, false];
};

[{
	params ["_obj"];

	private _max = 1 + floor (random 5);
	private _count = 0;
	private _time = 0;

	while {_count < _max} do {
		_time = _time + 0.1 + (random 2);
		_count = _count + 1;
		
		[{
			_this remoteExecCall ["grad_user_fnc_sparkEffect", 0, false];
		}, [_obj, _time], _time] call CBA_fnc_waitAndExecute;
	};
}, [_obj], 0.1 + (random 0.1)] call CBA_fnc_waitAndExecute;
