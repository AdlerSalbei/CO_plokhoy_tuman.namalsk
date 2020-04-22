if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus", 2, false];
};

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating", {0}];

/*
["CBA_loadingScreenDone", {
    cutText ["","BLACK FADED", 999];
    [{time > (_this + 10)},{
        if (!(didJIP) || {(didJIP && !(isNil "GRAD_USER_introOver"))}) then {
            if (isNull (getAssignedCuratorLogic ace_player)) then {
                [] call GRAD_USER_fnc_intro;
            };
        };
    }, time,] call CBA_fnc_waitUntilAndExecute;

    [
        {
            didJIP && 
            {!(isNil "GRAD_USER_introOver")} && 
            {GRAD_USER_introOver}
        },
        {
            cutText ["","BLACK IN", 1];
        }, 
        [], 
        5,
        {}
    ] call CBA_fnc_waitAndExecute;


}] call CBA_fnc_addEventHandler;
*/

[
	"GRAD_seatPlayer", 
	{
		params ["_unit", "_chair"];
		
		[_chair, _unit] call acex_sitting_fnc_sit;
	}
] call CBA_fnc_addEventHandler;

[{!(isNil "GRAD_hiddenObjects")}, {
    [{
        {
            if !(isObjectHidden _x) then {
                _x hideObject true;
            };
        }forEach GRAD_hiddenObjects;
    }, [], 5] call CBA_fnc_waitAndExecute;
}, []] call CBA_fnc_waitUntilAndExecute;