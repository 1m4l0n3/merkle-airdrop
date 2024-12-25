
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
    address private user;
    uint256 private privateKey;
    bytes32 private proofOne;
    bytes32 private proofTwo;
    bytes32[] private proof;
    uint256 private constant AMOUNT_TO_CLAIM = 25 * 1e18;
    uint256 private constant INITIAL_SUPPLY = AMOUNT_TO_CLAIM * 4;

    function setUp () external {
        deployer = new MerkleDeploy();
        (bagelToken,merkleAirdrop,root) = deployer.deployMerkleAirdrop();

        (user,privateKey) = makeAddrAndKey("user");
        proofOne = 0x0fd7c981d39bece61f7499702bf59b3114a90e66b51ba2c53abdf7b62986c00a;
        proofTwo = 0xe5ebd1e1b5a5478a944ecab36a9a954ac3b6b8216875f6524caa7a1d87096576;
        proof = [proofOne,proofTwo];
    }

    function testTokenInformation() external view {
        string memory expectedName = "Bagel Token";
        string memory expectedSymbol = "BT";

        assertEq(expectedName,bagelToken.name());
        assertEq(expectedSymbol,bagelToken.symbol());
    }

    function testUserToClaimToken() external {
        uint256 startingBalance = bagelToken.balanceOf(user);

        vm.prank(user);
        merkleAirdrop.claim(user,AMOUNT_TO_CLAIM,proof);

        uint256 endingBalance = bagelToken.balanceOf(user);
        assertEq(startingBalance + AMOUNT_TO_CLAIM , endingBalance);
    }
}