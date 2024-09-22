include "../../../node_modules/circomlib/circuits/poseidon.circom";

template Circuit() {
    signal private input R[2];
    signal private input S;
    signal private input Rand;
    signal input h_cert;
    signal input h_msg;
    signal output out;

    component poseidon = Poseidon(4);
    poseidon.inputs[0] <== Rand;
    poseidon.inputs[1] <== R[0];
    poseidon.inputs[2] <== R[1];
    poseidon.inputs[3] <== S;

    h_cert === poseidon.out;

    out <== h_msg;
}

component main = Circuit();
