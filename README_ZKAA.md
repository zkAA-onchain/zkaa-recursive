# Prerequirements

```bash
$ sudo apt install nlohmann-json3-dev
$ sudo apt-get install libgmp3-dev
$ sudo apt-get install nasm
```

# Test zkAA

```bash
(test) $ ./test_zkaa_plonk_recursive.sh
```

# Clean

```bash
(test) $ ./clean_zkaa_plonk_recursive.sh
```

<!--
---

Each proof in the aggregated one should have three elements (i.e., two inputs and one output).
-->

# Benchmark

## Gas Usage

```bash
  Plonk
    ✓ Should return true when proof is correct

·-------------------------|---------------------------|--------------|-----------------------------·
|   Solc version: 0.8.4   ·  Optimizer enabled: true  ·  Runs: 1000  ·  Block limit: 30000000 gas  │
··························|···························|··············|······························
|  Methods                                                                                         │
··············|···········|·············|·············|··············|···············|··············
|  Contract   ·  Method   ·  Min        ·  Max        ·  Avg         ·  # calls      ·  eur (avg)  │
··············|···········|·············|·············|··············|···············|··············
|  Deployments            ·                                          ·  % of limit   ·             │
··························|·············|·············|··············|···············|··············
|  KeysWithPlonkVerifier  ·          -  ·          -  ·     3936596  ·       13.1 %  ·          -  │
·-------------------------|-------------|-------------|--------------|---------------|-------------·

  1 passing (2s)
```
