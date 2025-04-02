// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script,console} from "forge-std/Script.sol";
import {APIConsumer} from "../src/APIConsumer.sol";

contract DeployAPIConsumer is Script {
    function run() external {
    
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address router = vm.envAddress("FUNCTIONS_ROUTER");
        bytes32 donId = vm.envBytes32("DON_ID");
        uint64 subscriptionId = uint64(vm.envUint("SUBSCRIPTION_ID"));

        vm.startBroadcast(deployerPrivateKey);
        
        APIConsumer apiConsumer = new APIConsumer(
            router,
            donId,
            subscriptionId
        );
        
        vm.stopBroadcast();

        console.log("APIConsumer deployed at:", address(apiConsumer));
    }
}