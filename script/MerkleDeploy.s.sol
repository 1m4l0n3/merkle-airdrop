// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Script} from "../lib/forge-std/src/Script.sol";
import {MerkleAirdrop} from "../src/MerkleAirdrop.sol";
import {BagelToken} from "../src/BagelToken.sol";

contract MerkleDeploy is Script {
    bytes32 private constant ROOT = 0xaa5d581231e596618465a56aa0f5870ba6e20785fe436d5bfb82b08662ccc7c4;
    uint256 private constant INITIAL_SUPPLY = 100 * 1e18;
    MerkleAirdrop private merkleAirdrop;
    BagelToken private bagelToken;

    function deployMerkleAirdrop() public returns(BagelToken,MerkleAirdrop,bytes32) {
        vm.startBroadcast();
        bagelToken = new BagelToken();
        merkleAirdrop = new MerkleAirdrop(ROOT,bagelToken);
        bagelToken.mint(address(merkleAirdrop),INITIAL_SUPPLY);
        vm.stopBroadcast();

        return (bagelToken,merkleAirdrop,ROOT);
    }
    function run() external returns(BagelToken,MerkleAirdrop,bytes32){
        return deployMerkleAirdrop();
    }
}
