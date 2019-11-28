STHud_UIMode = 0;
diwako_dui_main_toggled_off = true;

["BlackAndWhite", 0, false] call BIS_fnc_setPPeffectTemplate;

0 fadeMusic 0;

playMusic ["intro", 0];

[{3 fadeMusic 1;},[]] call CBA_fnc_execNextFrame;

cutText ["","BLACK FADED", 999];

ace_player switchMove "amovpercmstpslowwrfldnon";

[{
[ 
parseText "<t font='PuristaBold' size='7' color='#8b0000'>O</t><t font='PuristaBold' size='7' color='#ffffff'>peration </t><t font='PuristaBold' size='7' color='#8b0000'>L</t><t font='PuristaBold' size='7' color='#ffffff'>ions </t><t font='PuristaBold' size='7' color='#8b0000'>K</t><t font='PuristaBold' size='7' color='#ffffff'>iss </t><t font='PuristaBold' size='7' color='#8b0000'>4</t>", 
[ 
safezoneX + 0.18 * safezoneW, 
safezoneY + 0.35 * safezoneH, 
2, 
1 
], 
nil, 
5, 
[4,1], 
0 
] spawn BIS_fnc_textTiles;
[{
titleText [
"<t font='PuristaBold' size='3'>Was bisher geschah ... </t>", 
"PLAIN", 
1, 
true, 
true
];

[{

private _filmgrain = ppEffectCreate ["FilmGrain", 2000];
_filmgrain ppEffectEnable true;
_filmgrain ppEffectAdjust [0.3, 0.3, 0.12, 0.12, 0.12, true];
_filmgrain ppEffectCommit 0;

private _camera = "camera" camCreate (getPosASL camPos_01);
_camera camSetPos (getPos camPos_01);
_camera camCommand "inertia on";
_camera camSetTarget camTarget_01;
_camera cameraEffect ["internal", "back"];
_camera camSetFov 0.1;
_camera camCommit 0;
_camera camSetPos (getPos camPos_01);
_camera camSetTarget camTarget_01;

showCinemaBorder true;

private _date = date;
_date set [3, 1];
_date set [4, 0];

if (isNil "GRAD_Weather_change_1") then {
    GRAD_Weather_change_1 = true;
    publicVariable "GRAD_Weather_change_1";

    ["grad_changeWeather", [_date, 1, 0.3, nil, [0.505533,0.0170761,400]]] call CBA_fnc_serverEvent;
};

[{
cutText ["", "BLACK IN", 3];

[{
params ["_camera"];

[
    "<t color='#ff0000' size = '.8'></t>",
    -1,
    -1, 
    10, 
    3, 
    0
] spawn BIS_fnc_dynamicText;

[{[getPosATL lightningPos_01] call grad_user_fnc_doLightning;},[]] call CBA_fnc_execNextFrame;
[{[getPosATL lightningPos_04] call grad_user_fnc_doLightning;},[],4] call CBA_fnc_waitAndExecute;

_camera camSetFov 1;
_camera camCommit 8;

[{
params ["_camera"];

[{[getPosATL lightningPos_02] call grad_user_fnc_doLightning;},[]] call CBA_fnc_execNextFrame;
[{[getPosATL lightningPos_03] call grad_user_fnc_doLightning;},[],2] call CBA_fnc_waitAndExecute;
_camera camSetPos (getPos camPos_02);
_camera camCommit 5;

[{
params ["_camera"];

[{[getPosATL lightningPos_01] call grad_user_fnc_doLightning;},[]] call CBA_fnc_execNextFrame;
[{[getPosATL lightningPos_03] call grad_user_fnc_doLightning;},[],2] call CBA_fnc_waitAndExecute;
_camera camSetPos (getPos camPos_03);
_camera camCommit 5;

[{
cutText ["", "BLACK OUT", 1];
[{
    params ["_camera"];
    _camera camSetPos (getPos camPos_04);
_camera camSetTarget camTarget_02;
_camera camSetFov 1;
_camera camCommit 0;

[{
    cutText ["", "BLACK IN", 3];

[{
params ["_camera"];
_camera camSetFov 0.3;
_camera camCommit 10;

[
    "<t color='#ff0000' size = '.8'></t>",
    safeZoneX,
    safeZoneY, 
    10, 
    3, 
    0
] spawn BIS_fnc_dynamicText;

[{
params ["_camera"];
cutText ["", "BLACK OUT", 1];

[{
params ["_camera", "_filmgrain"];


GRAD_USER_introOver = true;
publicVariable "GRAD_USER_introOver";

_filmgrain ppEffectEnable false;
ppEffectDestroy _filmgrain;
_camera cameraEffect ["terminate", "back"];
camDestroy _camera;

["Default", 0, false] call BIS_fnc_setPPeffectTemplate;

[{
cutText ["", "BLACK IN", 5];
[ace_player, "amovpercmstpslowwrfldnon", 1] call ace_common_fnc_doAnimation;

10 fadeMusic 0;
STHud_UIMode = 1;
diwako_dui_main_toggled_off = false;

[{
playMusic "";
0 fadeMusic 1;
}, [], 11] call CBA_fnc_waitAndExecute;
}, [], 4] call CBA_fnc_waitAndExecute;
}, [], 2] call CBA_fnc_waitAndExecute;
}, _this, 1] call CBA_fnc_waitAndExecute;
}, _this, 10] call CBA_fnc_waitAndExecute;
}, _this, 10] call CBA_fnc_waitAndExecute;
}, _this, 10] call CBA_fnc_waitAndExecute;
}, [_camera, _filmgrain], 1] call CBA_fnc_waitAndExecute;
}, [], 12] call CBA_fnc_waitAndExecute;
