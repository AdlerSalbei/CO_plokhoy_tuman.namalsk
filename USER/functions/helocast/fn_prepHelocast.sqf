params ["_helo"];

//Add conditional here to use decel function or the commands below
//BIS hasn't added getFlyInHeight command, TODO use altitude when prep was called as the value to return to when done
[_helo, 8] remoteExec ["limitSpeed", _helo];
[_helo, 6] remoteExec ["flyInHeight", _helo];

private _ramp = _helo getVariable "grad_helocast_ramp";
if(count _ramp > 0) then	
{
	{
		_helo animate [_x, 1];
		_helo animateDoor [_x, 1];
	} forEach _ramp;
};

_helo setVariable ["grad_helocast_readyHelocast", true, true];

