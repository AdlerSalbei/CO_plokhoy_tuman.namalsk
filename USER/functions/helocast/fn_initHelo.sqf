{ 
 _helo = _x; 
  
 [{ 
    params ["_helo"]; 
   
    _helo setFuel 1; 
	_helo animate ["ramp_bottom", 0];
	_helo animate ["ramp_top", 0];
   
 },[_helo], _forEachIndex * 3] call CBA_fnc_waitAndExecute; 
   
}forEach [ 
    helo_1, 
    helo_2
];