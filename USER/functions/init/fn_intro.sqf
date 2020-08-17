["BlackAndWhite", 0, false] call BIS_fnc_setPPeffectTemplate;
playMusic ["Music_Hostile_Drone_Close_01", 0];

0.5 fadeSound 1;

[{
    private _filmgrain = ppEffectCreate ["FilmGrain", 2000];
    _filmgrain ppEffectEnable true;
    _filmgrain ppEffectAdjust [0.3, 0.3, 0.12, 0.12, 0.12, true];
    _filmgrain ppEffectCommit 0;

    private _camera = "camera" camCreate (getPosASL camPos_01);
    _camera attachTo [(vehicle player), [5, -50, 0]];
    _camera camCommand "inertia on";
    _camera camSetTarget (vehicle player);
    _camera cameraEffect ["internal", "back"];
    _camera camSetFov 1;
    _camera camCommit 0;
    _camera camSetTarget (vehicle player);
    _camera camCommit 1;

    showCinemaBorder true;

    [{
        params ["_camera"];
        cutText ["", "BLACK IN", 2];

        [{
            params ["_camera"];

            ["Default", 20, false] call BIS_fnc_setPPeffectTemplate;

            _camera camSetPos (getPosASL camPos_02);
            _camera camCommit 5;

            [{
                    params ["_camera"];

                    

                    [{
                        cutText ["", "BLACK OUT", 1];
                        [{
                            params ["_camera"];
                            _camera camSetPos (getPos camPos_04);
                            _camera camSetTarget camTarget_02;
                            _camera camCommit 0;

                            [{
                                cutText ["", "BLACK IN", 3];

                                [{
                                    params ["_camera"];
                                    _camera camSetFov 0.3;
                                    _camera camCommit 10;

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
                    }, _this, 10] call CBA_fnc_waitAndExecute;
            }, _this, 10] call CBA_fnc_waitAndExecute;
        }, _this, 28] call CBA_fnc_waitAndExecute;
    }, [_camera, _filmgrain], 1] call CBA_fnc_waitAndExecute;
}, [], 1] call CBA_fnc_waitAndExecute;
