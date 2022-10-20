//SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GamesManager is Ownable {
    address token;
    mapping(uint=>uint) playeridtocurrentlocation;
    mapping(uint=>Games) gameidtodetails;
    enum GAME_CATEGORY {
        DICE,
        BOOK
    }
    enum EVENT_CATEGORY{
        GO_BACK,
        SKIP_AHEAD,
        DIE,
        OBTAIN_ARTIFACT,
        PATH_BREAK,
        FREEZE,
        ACQUIRE_KEY,
        CHANGE_PATH,
        UNLOCK_SECRET_PATH,
        OBTAIN_RELIC
    }
    enum EVENT_TRIGGER{
        FIRE,
        ICE,
        CREATURE,
        OTHER
    }
    enum VISIBILITY{
        OPEN,
        HIDDEN
    }

    //Player Game Structs
    struct Player_Games{
        Current_Game current_game;
        Previous_Games[] previous_games;
    }
    struct Previous_Games {
        uint game_id;
        uint time_started;
        uint time_ended;
        uint no_of_rolls;
        string final_position;
    }
    struct Current_Game{
        uint game_id;
        uint time_started;
        uint time_ended;
        uint no_of_rolls;
        bytes current_path;
        uint current_position;
    }

    //Game Details Structs
    struct Games {
        string title;
        GAME_CATEGORY category;
        uint time_created;
        uint length;
        uint current_player_count;
        Position_Events[] position_events;
        Game_Positions[] positions;
        Winners[] winners;
    }
    struct Game_Positions {
        bytes path;
        uint starting_position;
        uint ending_position;
        VISIBILITY visibility;
    }
    struct Position_Events {
        uint position;
        bytes path;
        uint special_event_value;
        bytes new_path;
        string description;
        string saved_description;
        EVENT_CATEGORY category;
        EVENT_TRIGGER trigger;
    }
    struct Winners {
        uint player;
        uint time_won;
        uint gameplay_duration;
    }

    function start_game() public {
        
    }
}