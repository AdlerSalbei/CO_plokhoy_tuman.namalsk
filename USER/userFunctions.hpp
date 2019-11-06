/*
*   Hier können eigene Funktionen eingebunden werden.
*   Ist in CfgFunctions included.
*/

class GRAD_USER {
    class effects {
        file = "USER\functions\effects";
        
        class sparkEffect {};
        class startEffectEMP {};
        class targetEffect {};
        class visualEffect {};
    };
    class init {
        file = "USER\functions\init";
        
        class intro {};
        class replaceTrees {};
    };
    class outro {
        file = "USER\functions\outro";
        
        class chairCircle {};
        class closingCredits {};
        class shuffleText {};
        class seatPlayers {};
    };
};