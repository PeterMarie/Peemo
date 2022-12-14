//SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PlayerManager is Ownable {
    address token;
    address stake_manager;
    address unclaimed_peem_holder;
    uint player_count;

    //Players Metadata
    struct Players {
        uint player_id;
        bytes unique_id;
        string hashed_password;
        string username;
        string email;
        string first_name;
        string last_name;
        uint time_joined;
        VERIFIED_STATUS verifiedstatus;
        uint unclaimedpeem;
    }
    mapping(uint=>Players) playeridtodetails;
    mapping(string=>uint) playeremailtoid;

    mapping(uint=>address) playeridtoaddress;
    mapping(uint=>string) playeridtousername;
    mapping(uint=>string) playeridtoemail;
    mapping(uint=>uint8) playeridtoverifiedstatus;
    mapping(uint=>uint) playeridtounclaimedpeem;
    enum VERIFIED_STATUS {
        NONE,
        EMAIL_VERIFIED,
        KYC_VERIFIED,
        ADDRESS_VERIFIED
    }

    constructor(address _token, address _unclaimed_peem_holder){
        token = _token;
        unclaimed_peem_holder = _unclaimed_peem_holder;
    }

    function addPlayer(string memory _email, string memory _username) public onlyOwner {
        VERIFIED_STATUS verified_status;
        verified_status = VERIFIED_STATUS.NONE;
        uint new_player_id = player_count;
        Players memory new_player = Players(new_player_id, 'password', _username, _email, uint8(verified_status), 0);
        playeridtodetails[new_player_id] = new_player;
        player_count = player_count + 1;
    }

    /**verifyPlayer transfers all unclaimed peem of a player from the unclaimed peem address to the player's verified address */
    function verifyPlayerAddress(uint _playerId, address _playerAddress) public onlyOwner {

    }

    function verifyPlayer(uint _playerId) public {

    }

    function isVerified(uint _playerId) public view returns(uint8){
        return playeridtodetails[_playerId].verifiedstatus;
    }

    function getPlayerId(string calldata _email) public view returns(uint){
        return playeremailtoid[_email];
    }

    function getPlayerUsername(uint _playerId) public view returns(string memory){
        return playeridtodetails[_playerId].username;
    }
}
