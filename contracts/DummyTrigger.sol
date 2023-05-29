// SPDX-License-Identifier: Unlicensed
pragma solidity 0.8.16;

import "contracts/abstract/BaseTrigger.sol";

contract DummyTrigger is BaseTrigger {
  constructor(IManager manager_) BaseTrigger(manager_) {}

  function acknowledged() public pure override returns (bool) {
    return true;
  }
}
