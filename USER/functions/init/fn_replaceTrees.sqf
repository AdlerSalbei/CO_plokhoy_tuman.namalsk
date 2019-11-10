if !(isServer) exitWith {};

private _trees = nearestTerrainObjects [[worldSize/2, worldSize/2, 0], [
		"TREE",
		"SMALL TREE"
	], worldSize]; 

systemChat str(count _trees);
private _unkownTypes = [];
 
{ 
	private _tree = _x;
	if (!(isObjectHidden _tree) && {selectRandom [false, true, true, true]}) then {
		private _splitt = (str _tree) splitString " ";
		_splitt = (_splitt select 1) splitString ".";
		private _configName = _splitt select 0;

		if (isClass (missionConfigFile >> "cfgTreeReplacment" >> _configName)) then {
			private _replacement = [missionConfigFile >> "cfgTreeReplacment" >> _configName >> "replacement", "STRING", ""] call CBA_fnc_getConfigEntry;
			private _index = -1;
			
			if (_replacement isEqualTo "") then {
				private _replacements = [missionConfigFile >> "cfgTreeReplacment" >> _configName >> "replacement", "ARRAY", []] call CBA_fnc_getConfigEntry;
				if (_replacement isEqualTo []) exitWith {_replacement = objNull;};
				_replacement = selectRandom _replacements;
				_index = _replacements find _replacement;
			};

			private _offset = [missionConfigFile >> "cfgTreeReplacment" >> _configName >> "offset", "ARRAY", [0,0,0]] call CBA_fnc_getConfigEntry;
			if (_index >= 0 && {(_offset select 0) isEqualType []}) then {
				_offset = _offset select _index;
			};
			
			private _pos = (getPosASL _tree vectorAdd _offset);
			private _dir = getDir _tree;
			private _vectorDir = vectorDir _tree;
			private _vectorUp = vectorUp _tree;

			private _newTree = objNull;

			if (isClass (configFile >> "cfgVehicles" >> _configName)) then {
				_newTree = createVehicle [_replacement, _pos]; 
			} else {
				_newTree = createSimpleObject [_replacement, _pos];
			};

			if (isNull _newTree) exitWith {diag_log format ["No Tree created, old: %1", _tree];};
			_tree hideObjectGlobal true;

			_newTree setDir _dir;
			_newTree setVectorDirAndUp [_vectorDir, _vectorUp];
			_newTree setPosASL _pos;
		};
	};
}forEach _trees;


