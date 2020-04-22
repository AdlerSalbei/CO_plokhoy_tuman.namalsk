params ["_helo"];

{
	[{
		params ["_unit", "_helo"];

		_unit action ["Eject", _helo];
	}, [_x, _helo], (1 + _forEachIndex)/2] call CBA_fnc_waitAndExecute;
}forEach (fullCrew [_helo, "cargo", false]);

[
	{
		params ["_helo"];

		private _crew = fullCrew [_helo, "cargo", false];

		(_crew isEqualTo []) 
	},
	{
		params ["_helo"];

		private _grp = group driver _helo;
		if (currentWaypoint _grp <= 2) then {
			_grp setCurrentWaypoint [_grp, 3];
		};

		_helo flyInHeight 100;
		_helo limitSpeed 300;

		_helo animate ["ramp_bottom", 0];
		_helo animate ["ramp_top", 0];
	},
	[_helo]
] call CBA_fnc_waitUntilAndExecute;