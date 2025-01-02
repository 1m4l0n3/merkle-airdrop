# BagelToken Airdrop Project

This project consists of two smart contracts, **BagelToken** and **MerkleAirdrop**, that work together to create an ERC20 token and facilitate a Merkle-based airdrop distribution of the tokens.

---

## What is the project about?
The project implements:
1. **BagelToken**: A custom ERC20 token named "Bagel Token" (symbol: BT) with minting functionality restricted to the contract owner.
2. **MerkleAirdrop**: A contract that enables secure and efficient token distribution using a Merkle tree. Users can claim their allocated tokens by proving their inclusion in the Merkle tree.

---

## What is a Merkle-based airdrop?
A Merkle-based airdrop uses a **Merkle tree** data structure to verify the eligibility of participants. Instead of storing all participant data on-chain, a Merkle root is stored. Participants provide a proof (Merkle proof) to verify their eligibility and claim their tokens.

This approach reduces gas costs and ensures secure and scalable token distribution.

---

## Key Features
### BagelToken Contract
- ERC20-compliant token named "Bagel Token" with minting functionality.
- Minting is restricted to the contract owner, ensuring controlled token supply.

### MerkleAirdrop Contract
- Enables token distribution to eligible users via Merkle proofs.
- Prevents double-claims using a mapping to track claimed addresses.
- Emits an event `Claim` for transparency and tracking.
- Uses OpenZeppelin's `SafeERC20` for secure token transfers.

---

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
