 /*
 =============================== INFORMATION ===========================

  -- addCRRC.sqf - This function adds a boat to a helo if conditions are suitable. Declared as function in config.cpp (fatLurch_fnc_addCRRC)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-24
 -- Last Edit: 2019-12-25
 -- Parameters: [helo] - the helo to add the boat to 
 -- Returns: Nothing

 -- Usage:
 
[helo] call fatLurch_fnc_addCRRC;

 ================================== START ==============================
*/


 = [];
params ["_helo"];								

private _boat = "";
private _hasBoat = _helo getVariable ["grad_helocast_boat", false];
private _boatCoords = _helo getVariable ["grad_helocast_boatCoords", []];
if ((!_hasBoat) && {!(_boatCoords isEqualTo [])}) then
{
	_boat = "B_Boat_Transport_01_F" createVehicle [0,0,0];
	_boat attachTo [_helo, _helo getVariable "grad_helocast_boatCoords"]; 
	_helo setVariable ["grad_helocast_boat", _boat, true];		//associate the specific boat being used with the helo for use in other scripts
};


[_boat, _helo] remoteExec ["disableCollisionWith", 0];	
[_helo, _boat] remoteExec ["disableCollisionWith", 0];	//Needs to run on the owner of boat and helo
