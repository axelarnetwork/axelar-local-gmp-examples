//SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import {IAxelarExecutable} from "@axelar-network/axelar-cgp-solidity/contracts/interfaces/IAxelarExecutable.sol";
import {IAxelarGasService} from "@axelar-network/axelar-cgp-solidity/contracts/interfaces/IAxelarGasService.sol";

contract MessageReceiver is IAxelarExecutable {
    string public message = "no data";
    string public sourceChain;

    constructor(address gateway, address _gasReceiver)
        IAxelarExecutable(gateway)
    {}

    event Executed(address indexed _from, string _value);

    function _execute(
        string memory sourceChain_,
        string memory,
        bytes calldata payload
    ) internal override {
        message = abi.decode(payload, (string));
        sourceChain = sourceChain_;
        emit Executed(msg.sender, message);
    }
}
