// SPDX-License-Identifier: Unlicensed
pragma solidity 0.8.16;

import "contracts/abstract/BaseTrigger.sol";

contract MinimalTrigger is BaseTrigger {
  bool public testAcknowledged;

  constructor(IManager _manager, ISet[] memory _sets) BaseTrigger(_manager) {
    sets = _sets;
    state = MarketState.ACTIVE;
  }

  function TEST_HOOK_updateTriggerState(MarketState _newState) public {
    _updateTriggerState(_newState);
  }

  function TEST_HOOK_isValidTriggerStateTransition(MarketState _oldState, MarketState _newState) public returns (bool) {
    return _isValidTriggerStateTransition(_oldState, _newState);
  }

  function TEST_HOOK_acknowledge(bool _acknowledgement) public {
    testAcknowledged = _acknowledgement;
  }

  function acknowledged() public view override returns (bool) {
    return testAcknowledged;
  }
}
