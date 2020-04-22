if !(isServer) exitWith {};

params ["_chairs", ["_unitsToSeat", (playableUnits + switchableUnits)]];

{
    if (_chairs isEqualTo []) exitWith {};

    if (isNull (getAssignedCuratorLogic _x)) then {
        private _chair = _chairs select 0;
        _chairs deleteAT 0;
        ["GRAD_seatPlayer", [_x, _chair], _x] call CBA_fnc_targetEvent;
    };
}forEach _unitsToSeat;
