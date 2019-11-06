private _trees = nearestTerrainObjects [[worldSize/2, worldSize/2, 0], ["Tree", "SMALL TREE", "Bush"], worldSize]; 

systemChat str(count _trees);
private _unkownTypes = [];
 
{ 
	private _splitt = (str _x) splitString " ";
	_splitt = (_splitt select 1) splitString ".";
	private _configName = _splitt select 0;


	if (isClass (missionConfigFile >> "cfgTreeReplacment" >> _configName)) then {
		private _replacement = [missionConfigFile >> "cfgTreeReplacment" >> _configName >> "replacement", "STRING", ""] call CBA_fnc_getConfigEntry;
		private _index = -1;
		
		if (_replacement isEqualTo "") then {
			private _replacements = [missionConfigFile >> "cfgTreeReplacment" >> _configName >> "replacement", "ARRAY", []] call CBA_fnc_getConfigEntry;
			_replacement = selectRandom _replacements;
			_index = _replacements find _replacement;
		};

		private _offset = [missionConfigFile >> "cfgTreeReplacment" >> _configName >> "offset", "ARRAY", []] call CBA_fnc_getConfigEntry;
		if (_index >= 0) then {
			_offset = _offset select _index;
		};
		
		private _pos = (getPosASL _x vectorAdd _offset);
		private _dir = getDir _x;
		private _vectorDir = vectorDir _x;
		private _vectorUp = vectorUp _x;

		private _newTree = objNull;

		if (isClass (configFile >> "cfgVehicles" >> _configName)) then {
			_newTree = createVehicle [_replacement, _pos]; 
		} else {
			_newTree = createSimpleObject [_replacement, _pos];
		};

		if (isNull _newTree) exitWith {};
		_x hideObjectGlobal true;

		_newTree setDir _dir;
		_newTree setVectorDirAndUp [_vectorDir, _vectorUp];
		_newTree setPosASL _pos;
	} else {
		if !(_configName in _unkownTypes) then {
			diag_log format ["Tree not in missionConfig: %1, %2", _configName, _x];
			_unkownTypes pushBack _configName;
		};
	};
}forEach _trees;



