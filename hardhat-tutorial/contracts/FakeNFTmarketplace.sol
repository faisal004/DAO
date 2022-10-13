// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract FakeNFTmarketplace {
    mapping(uint256 => address) public tokens;
    uint256 nftprice = 0.1 ether;

    function purchase(uint256 _tokenID) external payable {
        require(msg.value == nftprice, "This NFT cost 0.1 ether");
        tokens[_tokenID] = msg.sender;
    }

    function getPrice() external view returns (uint256) {
        return nftprice;
    }

    function available(uint256 _tokenID) external view returns (bool) {
        if (tokens[_tokenID] == address(0)) {
            return true;
        }
        return false;
    }
}
