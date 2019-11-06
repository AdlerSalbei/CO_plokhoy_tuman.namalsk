params [["_songsArray", []], ["_dankArray", []], ["_color", "#FFFFFF"]];

//Create Text
private _headerText =  format ["<t color='%1' size = '1.5'>", _color];
private _bodyText = format ["<t color='%1' size = '.8'>", _color];
private _breakLine = " <br />";
private _endStructuredText = " </t>";

private _text = [(format ["<t color='%1' size = '2'>Abspann", _color])];
private _return = [_headerText + "Zeus" + _bodyText];
private _number = 0;
{
    if (!(isNull (getAssignedCuratorUnit _x)) && !(str _x in ["zeusModule_adminLogged", "zeusModule_adminVoted"])) then {
        _number = _number +1;
        _return pushBack (format["Zeus %1: %2", _number, name (getAssignedCuratorUnit _x)]);
    };
}forEach allCurators;

if (count _return > 1) then {
    _text pushBack (_return joinString _breakLine);
    _text pushBack (_headerText + " ");
};

if !(_songsArray isEqualTo []) then {
    _text pushBack (_headerText + "Songs");
    {
        _text pushBack (_bodyText + _x);
    }forEach _songsArray;
    _text pushBack (_headerText + " ");
};

if !(_dankArray isEqualTo []) then {
    _text pushBack (_headerText + "Dankesagung");
    {
        _text pushBack (_bodyText + _x);
    }forEach _songsArray;
    _text pushBack (_headerText + " ");
};

_text pushBack (_headerText + "Helden des Abends");

_return = [];

private _groups = ["GetAllGroupsOfSide", [WEST,EAST]] call BIS_fnc_dynamicGroups;

{
    private _group = _x;
    _return pushBack " ";
    _return pushBack (format ["<t color='%1' size = '1'>", _color] + (groupId _group) + _endStructuredText + _bodyText);
    {
            private _description = roleDescription _x;
            if (_description == "") then {
                _description = getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
            };
            _return pushBack (format ["%1: %2", _description, name _x]);
    }forEach (units _group);
} forEach _groups;

_text pushBack (_bodyText + (_return joinString _breakLine));

private _fullText = _text joinString (_endStructuredText + _breakLine);

//Create Dynamic Text
[
    _fullText,
    -1,
	safezoneY +1.8,
    20,
    1,
    -5
] spawn BIS_fnc_dynamicText;

[{
    cutText ["", "BLACK IN", 2];
}, [], 20] call CBA_fnc_waitAndExecute;
