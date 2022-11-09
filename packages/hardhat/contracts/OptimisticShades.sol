//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract optimisticShades is ERC721 {

    function getSvg(uint tokenId) private view returns (string memory) {
    string[3] memory parts;
    parts[0] = "<svg viewBox='0 0 350 350'><style>.a { fill: #0000; font-size: 18px; }</style><text x='10' y='10' class='a'>Token #";
    parts[1] = string(tokenId);
    parts[2] = "</text></svg>";
  
    return string(abi.encodePacked, parts[0], parts[1], parts[2]);
}

    function tokenURI(uint256 tokenId) override public view returns (string memory) {
        string memory svgData = getSvg(tokenId);

        string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name": "MY NFT", "description": "", "image_data": "', bytes(svgData), '"}'))));
        return string(abi.encodePacked('data:application/json;base64,', json));
    }
}