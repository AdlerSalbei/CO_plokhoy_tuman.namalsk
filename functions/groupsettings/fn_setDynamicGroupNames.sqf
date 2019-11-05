#include "component.hpp"

params ["_allgroups"];

//set names
{
    {
        private _callsign = [_x] call grad_groupsettings_fnc_getCallsign;
        ["RegisterGroup", [_x, leader _x, [nil, _callsign, false]]] call BIS_fnc_dynamicGroups;

        false
    } count _x;

    false
} count _allgroups;
