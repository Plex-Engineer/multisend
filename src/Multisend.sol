// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "solmate/utils/SafeTransferLib.sol";

/// @notice Transfer Ether to multiple addresses
contract Multisend {
    event botSend(address _recipient);

    function multisend(address payable[] calldata _addresses, uint256 _amount) external payable returns (bool) {
        if (_addresses.length == 0) revert("No addresses in array!");

        uint256 _value = msg.value;
        for (uint8 i; i < _addresses.length; i++) {
            _value = _value - _amount;
            SafeTransferLib.safeTransferETH(_addresses[i], _amount);
            emit botSend(_addresses[i]);
        }
        return true;
    }
}
