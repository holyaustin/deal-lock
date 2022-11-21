// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import { MarketAPI } from "./MarketAPI.sol";
import { CommonTypes } from "./typeLibraries/CommonTypes.sol";
import { MarketTypes } from "./typeLibraries/MarketTypes.sol";

contract Timelock {
    address public owner;
    address marketApiAddress = 0xC35A0a19857945cE7AbCA072D60617f5C921D003;
    mapping(address => uint) public balances;
    mapping(address => uint) public lockTime;

    MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

    constructor()  {
        owner = msg.sender;
    }

    // bytes memory addr = bytes("0x1111");
    // MarketTypes.WithdrawBalanceParams memory params = MarketTypes.WithdrawBalanceParams(addr, 1);
    //MarketTypes.WithdrawBalanceReturn memory response = marketApiInstance.withdraw_balance(params);

    function LockDeal(uint _secondsToIncrease) external payable {
        uint256 LockTime = _secondsToIncrease;
        //updates locktime in seconds
        lockTime[msg.sender] = block.timestamp + LockTime;
    }

    function currentTimestamp() external view returns (uint256 ) {
            return block.timestamp;
    }
    
    function increaseLockTime(uint _secondsToIncrease) public {
         lockTime[msg.sender] = lockTime[msg.sender] + (_secondsToIncrease);
    }

    function withdraw() public payable{
        require(balances[msg.sender] > 0, "insufficient funds");

        // check that the now time is > the time saved in the lock time mapping
        require(block.timestamp > lockTime[msg.sender], "lock time has not expired");

        // update the balance
        uint amount = balances[msg.sender];

        // send the ether back to the sender
        payable(msg.sender).transfer(amount);
       balances[msg.sender] = 0;

    }
// My inputs
    function add_balance(MarketTypes.AddBalanceParams memory params) public payable {

        bytes memory payload = abi.encodeWithSignature("add_balance(string)", params);
        (bool success, bytes memory returnData) = address(marketApiInstance).call(payload);
        require(success);
    }

    function get_balance(string memory addr) public returns (bytes memory) {
              bytes memory payload = abi.encodeWithSignature("get_balance(string)", addr);
            (bool success, bytes memory returnData) = address(marketApiInstance).call(payload);
            require(success);
            return returnData;
    }


    function withdraw_balance(MarketTypes.WithdrawBalanceParams memory params
    ) public returns (bytes memory) {
        require(block.timestamp > lockTime[msg.sender], "lock time has not expired");

            bytes memory payload = abi.encodeWithSignature("withdraw_balance)", params);
            (bool success, bytes memory returnData) = address(marketApiInstance).call(payload);
            require(success);
            return returnData;

        //return marketApiInstance.withdraw_balance();
        //return resp;
    }

/**
    // FIXME set data values correctly
    function get_deal_data_commitment(
        string memory params
    ) public view returns (string memory) {
        return
             marketApiInstance.get_deal_data_commitment(params);
    }

    function get_deal_client(
        string memory params
    ) public view returns (string memory) {
        return marketApiInstance.get_deal_client(params);
    }

    function get_deal_provider(
        string memory params
    ) public view returns (string memory) {
        return marketApiInstance.get_deal_provider(params);
    }

    function get_deal_label(
        string memory params
    ) public view returns (string memory) {
        return marketApiInstance.get_deal_label(params);
    }

    function get_deal_term(
        string memory params
    ) public view returns (string memory) {
        return
            marketApiInstance.get_deal_term(params);
    }

    function get_deal_epoch_price(
        string memory params
    ) public view returns (string memory) {
        return
                 marketApiInstance.get_deal_epoch_price(params);
    }

    function get_deal_client_collateral(
       string memory params
    ) public view returns (string memory) {

        return
                 marketApiInstance.get_deal_client_collateral(params);
    }

    function get_deal_provider_collateral(
        string memory params
    ) public view returns (string memory) {
     
        return
            marketApiInstance.get_deal_provider_collateral(params);
    }

    function get_deal_verified(
        string memory params
    ) public view returns (string memory) {

        return marketApiInstance.get_deal_verified(params);
    }

    function get_deal_activation(
        string memory params
    ) public view returns (string memory) {
  
        return
            marketApiInstance.get_deal_activation(params);
    }

    function publish_deal(bytes memory raw_auth_params, address callee) public {
        // calls standard filecoin receiver on message authentication api method number
        (bool success, ) = callee.call(
            abi.encodeWithSignature(
                "handle_filecoin_method(uint64,uint64,bytes)",
                0,
                2643134072,
                raw_auth_params
            )
        );
        require(success, "client contract failed to authorize deal publish");
    }
    
    */
}