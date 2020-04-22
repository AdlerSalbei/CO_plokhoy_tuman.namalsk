params ["_helo"];


[{
	params ["_helo", "_grp"];

	(_helo distance2D (waypointPosition [_grp, 2]) < 4500)
},{
	params ["_helo"];

	_helo limitSpeed 150;
	_helo flyInHeight 20;
},[_helo, group driver _helo]] call CBA_fnc_waitUntilAndExecute;

[{
	params ["_helo", "_grp"];

	(_helo distance2D (waypointPosition [_grp, 2]) < 2600)
},{
	params ["_helo"];
	
	private _speed = speed _helo;  
	private _counter = 10;  
	_helo flyInHeight 9;  
	
	while {(_speed - 1) > 8} do {  
		if ((_speed - 1) > 8) then {  
			_speed = _speed - 2;  
		}else{  
			_speed = 8;  
		};  
	
		[{  
			params ["_helo", "_speed"];  
	
			_helo limitSpeed _speed;  
		}, [_helo, _speed], _counter] call CBA_fnc_waitAndExecute;  
	
		_counter = _counter +1;  
	};

	[
		{
			params ["_helo"];

			private _speed = round (speed _helo);  
			private _hight = round ((getPosASL _helo) select 2); 

			(_hight <= 10 && {_speed <= 10})
		}, 
		{
			params ["_helo"];

			[_helo] call grad_user_fnc_dropBoats;
			[{
				params ["_helo"];

				[_helo] call grad_user_fnc_dropPlayers;
			}, [_helo], 3] call CBA_fnc_waitAndExecute;
		}, 
		[_helo]
	] call CBA_fnc_waitUntilAndExecute;

},[_helo, group driver _helo]] call CBA_fnc_waitUntilAndExecute;
