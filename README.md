# zkAA Recursive Proofs

This project contains scripts and commands to build and test zk-SNARKs using `plonkit`.

The main tasks include generating recursive proofs for zkAA, and verifying them through a Solidity-written smart contract verifier.
For detailed information, please refer to [zkAA-README.md](./README_ZKAA.md).

---

# plonkit!
![ci](https://github.com/fluidex/plonkit/actions/workflows/unit-test.yaml/badge.svg)
[![codecov](https://codecov.io/gh/fluidex/plonkit/branch/master/graph/badge.svg?token=2GVjdWgRZC)](https://codecov.io/gh/fluidex/plonkit)

A zkSNARK toolkit to work with [circom](https://github.com/iden3/circom) zkSNARKs DSL in [plonk](https://eprint.iacr.org/2019/953) proof system. Based on [zkutil](https://github.com/poma/zkutil) and [bellman_ce](https://github.com/matter-labs/bellman).

## Prerequisites

1. install [circom](https://docs.circom.io/getting-started/installation/) into $PATH
2. install snarkit2 into $PATH: `npm install -g snarkit2`

## Features

 + [x] Proof Generation
 + [x] Verification key generation
 + [x] Proof verification
 + [x] Solidity verifier generation
 + [x] Local key setup for developement
 + [x] Proof Aggregation

## Usage examples

The script [test_poseidon_plonk.sh](./test/test_poseidon_plonk.sh) gives an end-to-end example using `plonkit` to setup circuits / generate proving keys and validation keys / prove circuits / validate proof in Solidity.

You can also follow the step-by-step commands below.

```shell script
# Getting help
> plonkit --help
plonkit 
A zkSNARK toolkit to work with circom zkSNARKs DSL in plonk proof system

USAGE:
    plonkit <SUBCOMMAND>

FLAGS:
    -h, --help       Prints help information
    -V, --version    Prints version information

SUBCOMMANDS:
    analyse                              Analyse the circuit and output some stats
    check-aggregation                    Check proofs aggregation
    dump-lagrange                        Dump "SRS in lagrange form" from a "SRS in monomial form"
    export-recursive-verification-key    Export Recursive verifying key
    export-verification-key              Export verifying key
    generate-verifier                    Generate verifier smart contract
    help                                 Prints this message or the help of the given subcommand(s)
    prove                                Generate a SNARK proof
    recursive-prove                      Aggregate multiple proofs
    recursive-verify                     Verify recursive proof
    setup                                Trusted locally set up Plonk universal srs in monomial form
    verify                               Verify a SNARK proof

# Getting help for a subcommand
> plonkit prove --help
plonkit-prove 
Generate a SNARK proof

USAGE:
    plonkit prove [OPTIONS] --srs_monomial_form <srs-monomial-form>

FLAGS:
    -h, --help       Prints help information
    -V, --version    Prints version information

OPTIONS:
    -c, --circuit <circuit>                        Circuit R1CS or JSON file [default: circuit.r1cs|circuit.json]
    -p, --proof <proof>                            Output file for proof BIN [default: proof.bin]
    -l, --srs_lagrange_form <srs-lagrange-form>    Source file for Plonk universal setup srs in lagrange form
    -m, --srs_monomial_form <srs-monomial-form>    Source file for Plonk universal setup srs in monomial form
    -w, --witness <witness>                        Witness JSON file [default: witness.json]

# Suppose we have circuit file and a sample inputs, plus a plonk universal setup SRS (the '.key' file)
# The key file can either be downloaded from a finished third party setup or generated locally (development only)
> ls
circuit.circom  input.json  setup_2^20.key

# generate witness for this circuit
# another option here is use the snarkjs/circom cli like contrib/process_circom_circuit.sh
> snarkit2 check . --witness_type bin --backend wasm


# Generate a snark proof using the universal setup monomial-form SRS
> plonkit prove --srs_monomial_form setup_2^20.key --circuit circuit.r1cs --witness witness.wtns --proof proof.bin
Loading circuit...
Proving...
Proof saved to proof.bin
Proof json saved to proof.json
Public input json saved to public.json

# Export verification key
> plonkit export-verification-key --srs_monomial_form setup_2^20.key --circuit circuit.r1cs --vk vk.bin
Verification key saved to vk.bin

# Generate verifier smart contract, which can be used to verify public.json & proof.json
> plonkit generate-verifier --verification_key vk.bin --sol verifier.sol
Contract saved to saved to verifier.sol

# Verify the proof
> plonkit verify --proof proof.bin --verification_key vk.bin
Proof is correct

# Here's a list of files that we have after this
> ls
circuit.circom  circuit.r1cs  circuit.sym  circuit.wasm  input.json  proof.bin  proof.json  public.json  setup_2^20.key  verifier.sol  vk.bin  witness.wtns
```

If you want to set up a SRS locally for testing, you can make use of `setup` subcommand:

```
plonkit-setup 
Trusted locally set up Plonk universal srs in monomial form

USAGE:
    plonkit setup --power <power> --srs_monomial_form <srs-monomial-form>

FLAGS:
    -h, --help       Prints help information
    -V, --version    Prints version information

OPTIONS:
    -p, --power <power>                            Power_of_two exponent
    -m, --srs_monomial_form <srs-monomial-form>    Output file for Plonk universal setup srs in monomial form
```

You may also want to manually edit and lower down `plonk::SETUP_MIN_POW2` in the codes to fast generate a relatively small-sized SRS.

Moreover, you can make use of the `analyse` subcommand to print out the statistics of a circuit (num of inputs, num of constraints, num of gates...):
```
plonkit-analyse 
Analyse the circuit and output some stats

USAGE:
    plonkit analyse [OPTIONS]

FLAGS:
    -h, --help       Prints help information
    -V, --version    Prints version information

OPTIONS:
    -c, --circuit <circuit>    Circuit R1CS or JSON file [default: circuit.r1cs|circuit.json]
    -o, --output <output>      Output file [default: analyse.json]
```

### Proof Aggregation
Plonkit also supports Proof Aggregation. You can aggregate multiple proofs into one, see [test_poseidon_plonk_recursive.sh](./test/test_poseidon_plonk_recursive.sh) for a workflow example.

## Installation

Install Rust

```shell script
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Install plonkit globally

```shell script
cargo install --git https://github.com/fluidex/plonkit
# Make sure `~/.cargo/bin` is in $PATH (should be added automatically during Rust installation)
```

Or alternatively you can compile and run it instead:

```shell script
git clone https://github.com/fluidex/plonkit
cd plonkit
cargo run --release -- prove --help
```
