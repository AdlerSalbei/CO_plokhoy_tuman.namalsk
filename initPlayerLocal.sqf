if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus", 2, false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

["CBA_loadingScreenDone", {
    cutText ["","BLACK FADED", 999];
    [{time > (_this + 10)},{
        if (!(didJIP) || {(didJIP && !(isNil "GRAD_USER_introOver"))}) then {
            if (isNull (getAssignedCuratorLogic ace_player)) then {
                [] call GRAD_USER_fnc_intro;
            };
        };
    }, time,] call CBA_fnc_waitUntilAndExecute;

    [{
        cutText ["","BLACK IN", 1];
    }, [], 1] call CBA_fnc_waitAndExecute;

}] call CBA_fnc_addEventHandler;