// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Script} from "../lib/forge-std/src/Script.sol";
import {MerkleAirdrop} from "../src/MerkleAirdrop.sol";
import {BagelToken} from "../src/BagelToken.sol";

contract MerkleDeploy is Script {
    bytes32 private root = 0xaa5d581231e596618465a56aa0f5870ba6e20785fe436d5bfb82b08662ccc7c4;
    MerkleAirdrop private merkleAirdrop;
    BagelToken private bagelToken;


    function run() external returns(BagelToken,MerkleAirdrop,bytes32){
        vm.startBroadcast();
        bagelToken = new BagelToken();
        merkleAirdrop = new MerkleAirdrop(root,bagelToken);
        vm.stopBroadcast();

        return (bagelToken,merkleAirdrop,root);
    }

}
