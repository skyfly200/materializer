// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract PhysNFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    mapping(uint256 => string) authPublicKeys;
    mapping(uint256 => bool) isRedeemed;

    constructor() ERC721("PhysNFT", "PHYS") {}

    function create(address _to, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(_to, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
    
    function redeem(id) {
        require(balanceOf(msg.sender, id) == 1 , "must own token");
        isRedeemed[id] = true;
    }
}
