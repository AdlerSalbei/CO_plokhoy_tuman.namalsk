/*  Adds limited virtual arsenal to an object
*
*   Parameters:
*   0:  Object
*/

#include "component.hpp"

params [["_box",objNull],["_arsenalClass",""]];

if (isNull _box) exitWith {};
if (_arsenalClass == "") exitWith {};

private _create = ["AmmoboxInit", [_box, false, {true}]] spawn BIS_fnc_arsenal;

[{scriptDone (_this select 0)}, {
    params ["", "_box"];

    private _backpacks = [missionConfigFile >> "missionSettings" >> "restrictedArsenal" >> _arsenalClass,"backpacks",[]] call BIS_fnc_returnConfigEntry;
    private _items = [missionConfigFile >> "missionSettings" >> "restrictedArsenal" >> _arsenalClass,"items",[]] call BIS_fnc_returnConfigEntry;
    private _magazines = [missionConfigFile >> "missionSettings" >> "restrictedArsenal" >> _arsenalClass,"magazines",[]] call BIS_fnc_returnConfigEntry;
    private _weapons = [missionConfigFile >> "missionSettings" >> "restrictedArsenal" >> _arsenalClass,"weapons",[]] call BIS_fnc_returnConfigEntry;


    [_box, _backpacks] call BIS_fnc_addVirtualBackpackCargo;
    [_box, _items] call BIS_fnc_addVirtualItemCargo;
    [_box, _magazines] call BIS_fnc_addVirtualMagazineCargo;
    [_box, _weapons] call BIS_fnc_addVirtualWeaponCargo;

}, [_create,_box]] call CBA_fnc_waitUntilAndExecute;
