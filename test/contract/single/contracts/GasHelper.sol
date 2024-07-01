// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.9.0;

import {KeyedVerifier as Verifier} from "./verifier.sol";

contract GasHelper is Verifier {
    uint256 public gasUsed;

    function verify_serialized_proof_benchmark(
        uint256[] memory public_inputs,
        uint256[] memory serialized_proof
    ) external {
        uint256 startGas = gasleft();
        // bool res =
        verify_serialized_proof(public_inputs, serialized_proof);
        gasUsed = startGas - gasleft();

        // require(res, "Fail to verify.");
    }
}
