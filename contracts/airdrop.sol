// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IXRC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
}

interface IXSWAPv3 {
    // Define interface method for checking interaction with XSWAP v3.
    // This is a placeholder. Actual implementation will depend on XSWAP v3 contract design.
    function hasInteracted(address account) external view returns (bool);
}

contract Airdrop {
    IXRC20 public xrc20Token;
    IXSWAPv3 public xswapV3;
    address public admin;
    uint256 public constant MIN_XDC_BALANCE = 100 ether; // Using ether unit for simplicity
    uint256 public constant AIRDROP_AMOUNT = 100 * 1e18; // Assuming XRC20 uses 18 decimals
    uint256 public startTime;
    uint256 public endTime;

    constructor(address _xrc20Token, address _xswapV3) {
        xrc20Token = IXRC20(_xrc20Token);
        xswapV3 = IXSWAPv3(_xswapV3);
        admin = msg.sender;
        startTime = block.timestamp;
        endTime = startTime + 60 days;
    }

    function airdropTo(address recipient) external {
        require(block.timestamp >= startTime && block.timestamp <= endTime, "Airdrop period has ended or not started");
        // require(xswapV3.hasInteracted(recipient), "Recipient has not interacted with XSWAP v3");
        require(address(recipient).balance >= MIN_XDC_BALANCE, "Recipient does not hold minimum required XDC balance");

        bool success = xrc20Token.transfer(recipient, AIRDROP_AMOUNT);
        require(success, "Airdrop transfer failed");
    }

    // Allow admin to withdraw tokens after airdrop ends
    function withdrawTokens(address to, uint256 amount) external {
        require(msg.sender == admin, "Only admin can withdraw tokens");
        require(block.timestamp > endTime, "Airdrop period is still active");

        bool success = xrc20Token.transfer(to, amount);
        require(success, "Withdrawal failed");
    }
}
