params ["_boat", "_helo"];

[{
	params ["_args", "_handle"];
	_args params ["_boat", "_helo"];

	if ((getposASL _boat select 2) < 0.4) exitWith {

		[_handle] call CBA_fnc_removePerFrameHandler;
		[{_this setVelocity [0,0,0];}, _boat, 1] call CBA_fnc_waitAndExecute;
		
	};

	_boat setVelocityModelSpace [(velocityModelSpace _boat select 0), (velocityModelSpace _helo select 1)-6,(velocity _boat select 2)];
	
}, 0.25, [_boat, _helo]]call CBA_fnc_addPerFrameHandler;