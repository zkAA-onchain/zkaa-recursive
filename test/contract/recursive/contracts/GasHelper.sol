// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.9.0;

import {KeysWithPlonkVerifier as Verifier} from "./verifier.sol";

contract GasHelper is Verifier {
    uint256 public gasUsed;

    function verifyAggregatedProofBenchmark(
        uint256[] memory _recursiveInput,
        uint256[] memory _proof,
        uint8[] memory _vkIndexes,
        uint256[] memory _individualVksInputs,
        uint256[16] memory _subproofsLimbs
    ) external {
        uint256 startGas = gasleft();
        // bool res = 
        verifyAggregatedProofPublic(
            _recursiveInput,
            _proof,
            _vkIndexes,
            _individualVksInputs,
            _subproofsLimbs
        );
        gasUsed = startGas - gasleft();

        // require(res, "Fail to verify.");
    }

    function verifyAggregatedProofPublic(
        uint256[] memory _recursiveInput,
        uint256[] memory _proof,
        uint8[] memory _vkIndexes,
        uint256[] memory _individualVksInputs,
        uint256[16] memory _subproofsLimbs
    ) public view returns (bool) {
        for (uint256 i = 0; i < _individualVksInputs.length; ++i) {
            uint256 commitment = _individualVksInputs[i];
            _individualVksInputs[i] = commitment;
        }

        VerificationKey memory vk = getVkAggregated();

        return
            verify_serialized_proof_with_recursion(
                _recursiveInput,
                _proof,
                VK_TREE_ROOT,
                VK_MAX_INDEX,
                _vkIndexes,
                _individualVksInputs,
                _subproofsLimbs,
                vk
            );
    }
}
