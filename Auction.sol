// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Auction
 * @custom:dev-run-script ./scripts/deploy.py
 */
contract Auction {

    // the bidders
    mapping(address=>uint) biddersData;

    uint highestBidAmount;

    address highestBidder;

    // put new bid
    function putBid() public payable
    {
        uint calculateAmount = biddersData[msg.sender] + msg.value;
        require(msg.value > 0, "Bid amount cannot be zero");
        require(calculateAmount > highestBidAmount, "Please bid more than highest bid");
        biddersData[msg.sender] = calculateAmount;
        highestBidder = msg.sender;
    }

    // get how much a bidder bid
    function getBiddersBid(address _addr) public view returns(uint)
    {
        return biddersData[_addr];
    }

    // get highest bid amount
    function getHighestBid() public view returns(uint)
    {
        return highestBidAmount;
    }

    // get highest bidder address
    function getHighestBidder() public view returns(address)
    {
        return highestBidder;
    }
}
