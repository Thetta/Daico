pragma solidity ^0.4.24;
// import ERC20


contract Daico {
	address public investorsContract;
	ERC20 public token;
	uint public momentAmountReceived;
	address prowectOwner;

	uint public stagesCount;
	uint public stageAmount;
	uint public stageDays;

	modifier onlyProjectOwner() {
		require(msg.sender==projectOwner);
		_;
	}

	enum Decision {
		OK,
		NoDecision,
		Pause,
		Remove
	}

	constructor(uint _stagesCount, uint _stageAmount, uint _stageDays, ERC20 _token) {
		stagesCount = _stagesCount;
		stageAmount = _stageAmount;
		stageDays = _stageDays;
		token = _token;
		prowectOwner = msg.sender;
	}

	function getNeededAmount() public view returns(uint) {
		return stagesCount*stageAmount;
	}

	function approveTokens() public {
		token.transferFrom(msg.sender, address(this), getNeededAmount());
		momentAmountReceived = now;
		investorsContract = msg.sender;
	}

	// function getAvailableAmount() ???

	function receiveAmount(uint _amount) public onlyProjectOwner {
		token.transfer(prowectOwner, _amount);
	}

	function setInvestorsDecision(Decision decision) public onlyInvestorsContract {

	}
}