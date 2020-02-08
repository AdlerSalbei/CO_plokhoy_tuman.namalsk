params ["_helo"]; 

private _boat = _helo getVariable "grad_helocast_boat";

[_boat, false] remoteExec ["allowDamage", owner _boat];	
[_helo, false] remoteExec ["allowDamage", owner _helo];	


detach _boat;	

//===== Add Marker to boat =====
private _marker = createSimpleObject ["chemlight_green", [0,0,0]]; 
_marker attachTo [_boat, [0,0,1.2], "drivingwheel"];

_boat setVariable ["grad_helocast_marker", _marker, true];

[_boat, false] remoteExec ["allowDamage",owner _boat];	

//Depeding on the type of helo, the boat may need to be slid out the back. The variable push is the boolean for this
if(_helo getVariable "grad_helocast_push") then 
{
	[_boat, _helo] remoteExecCall ["grad_helocast_fnc_handleBoat", owner _boat];
};

[{
	params ["_helo", "_boat"];

	private _jumpOffset = _helo getVariable ["grad_helocast_jumpOffset", []];
	private _jumpers = fullCrew [_helo, "cargo", false];

	_helo setvariable ["grad_helocast_boat", nil, true];
	_helo setVariable ["grad_helocast_readyHelocast", nil, true];

	[_boat, _helo] remoteExec ["enableCollisionWith", owner _boat];	
	[_boat, _helo] remoteExec ["enableCollisionWith", owner _helo];	//Needs to run on the owner of boat and helo

	{
		[{
			//Eject all non-flight crew
			//===== Begin clusterfuck to eject crew =====

			params ["_unit", "_helo", "_jumpOffset"];

			unassignvehicle _unit;
			_anim = selectRandom ["AdvePercMstpSnonWnonDnon", "AsdvPercMstpSnonWnonDnon_relax", "AfalPercMstpSnonWnonDnon", "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon", "AsdvPercMstpSnonWnonDnon_goup"];
			[_unit] remoteExec ["unassignVehicle", _unit];
			_unit allowdamage false;

			private _dir = getDir _helo - 180;
			private _vDir = vectorDir _helo;
			private _jDir = [sin (_dir + 90), cos (_dir + 90), 0];
			private _vUp = vectorUp _helo;
			private _pos = getPosASL _helo vectorAdd (_jDir vectorMultiply (_jumpOffset select 0)) vectorAdd(_vDir vectormultiply (_jumpOffset select 1)) vectorAdd (_vUp vectorMultiply (_jumpOffset select 2));	//TODO: Incorperate customer position to dismount from, including tandem for each side of aircraft.
			private _vel = velocity _helo;

			_unit action ["EJECT", _helo]; 
				
			[_unit, _vel] remoteExec ["setVelocity", 0];
			[_unit, _anim] remoteExec ["switchMove", owner _unit];
			_unit playMove _anim;
			
			// ===== End cluster fuck =====
			[{
			_this allowDamage true;
			}, 1, _unit] call CBA_fnc_waitAndExecute;
		}, (_forEachIndex / 10) + random 0.4, [_x, _helo, _jumpOffset]] call CBA_fnc_waitAndExecute;
	} forEach _jumpers;	//have all of the non-aircrew exit the helo

	[{
		params ["_helo", "_boat"];

		[_helo, 500] remoteExec ["limitSpeed",owner _helo];	//TODO: Change to the helo's values when event started 
		[_helo, 50] remoteExec ["flyInHeight",owner _helo];	//TODO: Change to the helo's values when event started (Use altitude helo was at when prep was called)
			
		{
			if(group driver _helo != group _x) then 
			//Reset Animation State
			{
					[_x, ""] remoteExec ["switchMove", owner _x];
					_x playMove "";
					sleep 0.5+random 0.5;
			};

		} forEach _jumpers;	//have all of the non-aircrew exit the helo

		if(count(_helo getVariable "ramp") >0) then		
		{
			_ramp = _helo getVariable "ramp";
			{
				_helo animate [_x, 0];
				_helo animateDoor [_x, 0];
			} forEach _ramp;
		};

		[_boat, true] remoteExec ["allowDamage",0];	//These need to be remoteExec (Local Arguments) - 2019-12-08
	}, [_helo, _boat], 1] call CBA_fnc_waitAndExecute;
}, [_helo, _boat], 1] call CBA_fnc_waitAndExecute;
