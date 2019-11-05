if !(isServer) exitWith {};

params [
	"_pos", 
	"_distance", 
	["_type", "Land_CampingChair_V2_F"], 
	["_count", count (playableUnits + switchableUnits)]
];

private _positions = [];
private _angle = 360/_count;
private _direction = 0;

for "_i" from 1 to _count do {

	private _newPos = _pos getPos [_distance, _direction];

	_positions pushBack _newPos;

	_direction = _direction + _angle;
};

private _chairs = [];

{
  	private _chair = createVehicle [_type, _x, [], 0, "CAN_COLLIDE"];
  	_chair setDir ((_chair getRelDir _pos) - 180);
  	_chairs pushBack _chair;
} forEach _positions;

createVehicle ["Land_Campfire_burning", _pos, [], 0, "CAN_COLLIDE"];

_chairs
