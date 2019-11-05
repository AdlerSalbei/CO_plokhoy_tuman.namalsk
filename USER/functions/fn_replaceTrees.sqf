private _trees = nearestTerrainObjects [player, ["Tree", "SMALL TREE", "Bush"], worldSize]; 

systemChat str(count _trees);
private _unkownTypes = [];
 
{ 
	private _splitt = (str _x) splitString " ";
	_splitt = (_splitt select 1) splitString ".";
	private _configName = _splitt select 0;


	if (isClass (missionConfigFile >> "treeReplacement" >> _configName)) then {

		private _pos = getPosATL _x;
		private _dir = vectorDir _x;
		private _up = vectorUp _x;
		
		private _newTree = createVehicle ["gm_t_picea_abies_01_winter", _pos, [], 0, "CAN_COLLIDE"]; 
		_newTree setVectorDirAndUp [_dir, _up];
		_newTree setPosATL _pos;
	} else {
		if !(_configName in _unkownTypes) then {
			diag_log format ["Tree not in missionConfig: %1, %2", _configName, _x];
			_unkownTypes pushBack _configName;
		};
	};
}forEach _trees;



