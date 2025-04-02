// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {APIConsumer} from "../src/APIConsumer.sol";

contract InteractAPIConsumer is Script {
    function run() external {
        
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address apiConsumerAddress = vm.envAddress("API_CONSUMER_ADDRESS");

        vm.startBroadcast(deployerPrivateKey);
        
        APIConsumer apiConsumer = APIConsumer(apiConsumerAddress);
       
        console.log("Requesting posts data...");
        bytes32 requestId1 = apiConsumer.requestAPIData("posts", "");
        console.log("Request ID for posts:", vm.toString(requestId1));
        
       
        console.log("Requesting specific post data...");
        bytes32 requestId2 = apiConsumer.requestAPIData("posts", "1");
        console.log("Request ID for post 1:", vm.toString(requestId2));
        
        
        
        vm.stopBroadcast();
    }
}
