params ["_helo"];

_helo animate ["ramp_bottom", 0.5];
_helo animate ["ramp_top", 1];

[{
	params ["_helo"];

	private _boat = _helo getVariable ["grad_user_boats", []] select 0;
	detach _boat;

	[{
		params ["_args", "_handle"];
		_args params ["_boat", "_helo"];

		if ((getposASL _boat select 2) > 0.4) exitWith {
			_helo setVariable ["grad_user_pushed", [true, false]];
		};

		playSound3D ["a3\sounds_f\vehicles\soft\noises\slipping_tires_05.wss", _boat, false, getPosASL _boat, 3]; 
		[_boat, [(velocityModelSpace _boat select 0), (velocityModelSpace _helo select 1) - 6, (velocity _boat select 2)]] remoteExec ["setVelocityModelSpace", _boat]; 
	}, 0.25, [_helo, _boat]] call CBA_fnc_addPerFrameHandler;

	[
		{
			((this select 0) getVariable ["grad_user_pushed"] select 0)
		}, 
		{
			params ["_helo"];

			private _boat = _helo getVariable ["grad_user_boats", []] select 0;
			detach _boat;

			[{
				params ["_args", "_handle"];
				_args params ["_boat", "_helo"];

				if ((getposASL _boat select 2) > 0.4) exitWith {
					_helo setVariable ["grad_user_pushed", [true, true]];
				};

				playSound3D ["a3\sounds_f\vehicles\soft\noises\slipping_tires_05.wss", _boat, false, getPosASL _boat, 3]; 
				[_boat, [(velocityModelSpace _boat select 0), (velocityModelSpace _helo select 1) - 6, (velocity _boat select 2)]] remoteExec ["setVelocityModelSpace", _boat]; 
			}, 0.25, [_helo, _boat]] call CBA_fnc_addPerFrameHandler;
		},
		[_helo]
	] call CBA_fnc_waitUntilAndExecute;
}, [_helo] , 2] call CBA_fnc_waitAndExecute;
