/*
*   Hier können eigene Funktionen eingebunden werden.
*   Ist in CfgFunctions included.
*/

class GRAD_USER {
    class helocast {
        file = "USER\functions\helocast";
        
        class dropBoats {};
        class dropPlayers {};
        class initHelo {};
        class slowHelo {};
    };
    class init {
        file = "USER\functions\init";
        
        class intro {};
        class replaceTrees {postInit = 1;};
    };
    class outro {
        file = "USER\functions\outro";
        
        class chairCircle {};
        class closingCredits {};
        class seatPlayers {};
    };
};