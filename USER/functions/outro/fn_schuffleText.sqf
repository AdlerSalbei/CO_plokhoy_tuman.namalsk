/*
["Вот что командир Владивостока Михаил Цаплин. Его задача состоит в сохранении K-137 Красный Oktabr шедший пред абхазскому побережью свое и не может возникнуть сама по себе. Обеспечить при любых обстоятельствах, что ни абхазские силы не приближается подводную лодку. Успешная заявка маловероятно после наступления темноты, так что вам не терять время.",
"Hier spricht der Kommandant der Vladivostok, Mikhail Tsaplin. Ihr Auftrag ist es, die K-137 Krasny Oktabr zu sichern, die vor der abchasischen Küste auf Grund gelaufen ist und nicht aus eigener Kraft auftauchen kann. Stellen Sie unter allen Umständen sicher, dass sich keine abchasischen Kräfte dem U-Boot nähern. Ein erfolgreicher Einsatz wird nach Einbruch der Nacht sehr unwahrscheinlich, also verlieren Sie keine Zeit.",
] execVM "common\fx\translateArray.sqf";
*/

params ["_string1", "_string2", ["_formating", ""]];

private _array1 = _string1 splitString "";
private _array2 = _string2 splitString "";

private _ctrl = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
_ctrl ctrlSetPosition [ 
    safeZoneX + safeZoneW/2 - safeZoneW/2, 
    (safezoneY + safeZoneH)/3, 
    safezoneWAbs, 
    safeZoneH/10
];

_ctrl ctrlSetBackgroundColor [0, 0, 0, 0]; 
_ctrl ctrlSetFade 1;
_ctrl ctrlCommit 0;

[_ctrl, 1.2, 30] spawn BIS_fnc_ctrlSetScale;

_ctrl ctrlSetFade 0;
_ctrl ctrlCommit 3;

_ctrl ctrlSetStructuredText parseText (_formating + _string1 + "</t>");

[{
	params ["_ctrl", "_array1", "_array2", "_string1", "_string2", "_formating"];

	private _usedIndexes = [];
	{
		_usedIndexes pushBackUnique _forEachIndex;
	} forEach _array1;

	private _shuffledArray = _usedIndexes call BIS_fnc_arrayShuffle;
	private _time = 0;

	for "_i" from 0 to (count _array1) do {
		private _randomIndex = _shuffledArray select 0;
		_shuffledArray deleteAt 0;
		private _newCharacter = _array2 select _randomIndex;

		_array1 set [_randomIndex, _newCharacter];
		private _result = _formating + (_array1 joinString " ") + "</t>"; 

		if (_newCharacter != " " && count _newCharacter == 1) then {
			_time = _time + 2;        
		};

		[{
			params [ "_ctrl", "_result"];

			_ctrl ctrlSetStructuredText parseText _result;
		}, [_ctrl, _result], _time] call CBA_fnc_waitAndExecute;
	};

	[{
		params ["_ctrl"];

		_ctrl ctrlSetFade 1;
		_ctrl ctrlCommit 3;

		0 cutText ["", "PLAIN"];

		ctrlDelete _ctrl;
	}, [_ctrl], _time + 5] call CBA_fnc_waitAndExecute;

}, [_ctrl, _array1, _array2,  _string1, _string2, _formating], 7] call CBA_fnc_waitAndExecute;