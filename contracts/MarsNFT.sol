// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MarsNFT is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    // string _baseURI;

    constructor() ERC721("MarsEnergy", "DOG") {
        s_tokenCounter = 0;
    }

    // _mint()
    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter = 0;
    }

    /**
     * Hint: Whenever you want to look at what the NFT looks like, it is this function that will be called. VIP: When you interact with the tokenURI of any deployed NFT using the Etherscan, it gives you an end point and you can copy it and then paste in browser to see all the details of the NFT... The tokenURI contains information about your NFTs
     */

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
