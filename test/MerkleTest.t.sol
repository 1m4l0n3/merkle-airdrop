// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Test} from "../lib/forge-std/src/Test.sol";
import {MerkleAirdrop} from "../src/MerkleAirdrop.sol";
import {BagelToken} from "../src/BagelToken.sol";
import {MerkleDeploy} from "../script/MerkleDeploy.s.sol";

contract MerkleTest is Test {
    bytes32 private root;
    MerkleAirdrop private merkleAirdrop;
    BagelToken private bagelToken;
    MerkleDeploy private deployer;

    function setUp () external {
        deployer = new MerkleDeploy();
        (bagelToken,merkleAirdrop,root) = deployer.deployMerkleAirdrop();
    }

    function testTokenInformation() external view {
        string memory expectedName = "Bagel Token";
        string memory expectedSymbol = "BT";

        assertEq(expectedName,bagelToken.name());
        assertEq(expectedSymbol,bagelToken.symbol());
    }
}