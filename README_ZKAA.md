# Prerequirements

```bash
$ sudo apt install nlohmann-json3-dev
$ sudo apt-get install libgmp3-dev
$ sudo apt-get install nasm
```

# Test zkAA

Single publication:

```bash
(test) $ ./test_zkaa_plonk.sh
```

Multiple publication:

<!--
Each proof in the aggregated one should have three elements (i.e., two inputs and one output).
-->

```bash
(test) $ ./test_zkaa_plonk_recursive.sh
```

# Clean

```bash
(test) $ ./clean_zkaa_plonk.sh
(test) $ ./clean_zkaa_plonk_recursive.sh
```

# Benchmark

Aggregating 15 proofs:

## System

- AMD Ryzen 9 5950X 16-Core Processor (32 threads)
- Ubuntu 22.04.4 LTS
- 131819944 kB (128GB) RAM

## Number of Gates

```bash
Step: generate recursive proof

[2024-06-30T12:43:31Z INFO  plonkit::recursive] Raw number of gates: 28480464
[2024-06-30T12:43:35Z INFO  plonkit::recursive] Padded number of gates: 33554431

        User time (seconds): 6939.93
        System time (seconds): 144.97
        Percent of CPU this job got: 799%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 14:45.74
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 130082948
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 112294
        Minor (reclaiming a frame) page faults: 71597205
        Voluntary context switches: 128326
        Involuntary context switches: 17253
        Swaps: 0
        File system inputs: 4710024
        File system outputs: 24
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0
```

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
