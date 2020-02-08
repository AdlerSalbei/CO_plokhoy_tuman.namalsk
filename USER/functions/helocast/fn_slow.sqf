params ["_helo"]; 
 
[{ 
    params ["_args", "_handle"]; 
    _args params ["_helo", "_startPos", "_time"]; 
 
    private _speed = round (speed _helo); 
    private _hight = round ((getPosASL _helo) select 2); 
 
    if (_hight <= 10 && {_speed <= 10}) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler; 
        private _text = format ["Distance: %1, Time: %2", _startPos distance2D getPosASL _helo, time - _time]; 
        systemChat _text;
        diag_log _text;
    }; 
 
    systemChat format ["Speed: %1 Hight: %2", _speed, _hight]; 
 
}, 1, [_helo, getPosASL _helo, time]] call CBA_fnc_addPerFrameHandler; 
 
private _speed = speed _helo; 
private _counter = 30; 
_helo flyInHeight 6; 
 
while {(_speed - 1) > 8} do { 
    if ((_speed - 1) > 8) then { 
        _speed = _speed - 1; 
     }else{ 
        _speed = 8; 
    }; 
 
    [{ 
        params ["_helo", "_speed"]; 
 
        _helo limitSpeed _speed; 
    }, [_helo, _speed], _counter] call CBA_fnc_waitAndExecute; 
 
    _counter = _counter +1; 
};