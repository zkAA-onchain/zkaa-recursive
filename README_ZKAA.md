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

---

# Benchmark

## System

- AMD Ryzen 9 5950X 16-Core Processor (32-Thread)
- Ubuntu 22.04.4 LTS
- 131819944 kB (128GB) RAM

## Single

### Generate Proof

```bash
        User time (seconds): 1.01
        System time (seconds): 0.66
        Percent of CPU this job got: 287%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.58
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 143772
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 1
        Minor (reclaiming a frame) page faults: 36532
        Voluntary context switches: 12818
        Involuntary context switches: 67
        Swaps: 0
        File system inputs: 0
        File system outputs: 24
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0
```

### Gas Usage

```bash
Gas used: 376802
```

## Recursive

Aggregating 15 proofs:

### Generate Recursive Proof

```bash
Step: generate recursive proof

[2024-06-30T12:43:31Z INFO  plonkit::recursive] Raw number of gates: 28480464
[2024-06-30T12:43:35Z INFO  plonkit::recursive] Padded number of gates: 33554431

        User time (seconds): 6907.27
        System time (seconds): 145.91
        Percent of CPU this job got: 798%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 14:43.37
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 130094112
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 113733
        Minor (reclaiming a frame) page faults: 71615784
        Voluntary context switches: 129398
        Involuntary context switches: 14457
        Swaps: 0
        File system inputs: 4731568
        File system outputs: 24
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0
```

### Gas Usage

```bash
Step: verify via smart contract

Gas used: 558138
```
