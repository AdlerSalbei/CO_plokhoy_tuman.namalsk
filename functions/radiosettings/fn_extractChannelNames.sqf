#include "component.hpp"

private _radioCfg = missionConfigFile >> "missionSettings" >> "radioSettings";
private _shortRangeChannels = "true" configClasses (_radioCfg >> "shortrange");
private _longRangeChannels = "true" configClasses (_radioCfg >> "longrange");

private _channelNames = [];
{
    {
        private _freq = [_x,"freq",-1] call BIS_fnc_returnConfigEntry;
        private _name = [_x,"name",""] call BIS_fnc_returnConfigEntry;

        if (_freq > 0 && count _name > 0) then {
            _channelNames pushBack [_freq,_name];
        };
    } forEach _x;
} forEach [_shortRangeChannels,_longRangeChannels];

_channelNames
