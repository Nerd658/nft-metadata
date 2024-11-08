// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DiscountVoucher is ERC1155, Ownable {
    mapping(address => mapping(uint256 => bool)) public hasVoucher;
    mapping(address => bool) public whitelist;

    constructor() ERC1155("https://nerd658.github.io/nft-metadata/{id}.json") Ownable(msg.sender) {
        transferOwnership(msg.sender);
        whitelist[0xAD20E8558485a535577655201a4a3AF10800251b] = true; // Ajout de l'adresse à la liste blanche
    }

    function addToWhitelist(address _address) public onlyOwner {
        whitelist[_address] = true;
    }

    function removeFromWhitelist(address _address) public onlyOwner {
        whitelist[_address] = false;
    }

    function mintVoucher(address to, uint256 id) public onlyOwner {
        if (!whitelist[to]) {
            require(balanceOf(to, id) == 0, "User already has this type of voucher");
        }
        _mint(to, id, 1, "");
    }

    function transferVoucher(address from, address to, uint256 id, uint256 amount, bytes memory data) public onlyOwner {
        require(balanceOf(from, id) > 0, "Sender does not own the voucher");
        _safeTransferFrom(from, to, id, amount, data);
    }

    function validateVoucher(uint256 id) public {
        require(balanceOf(msg.sender, id) > 0, "You do not own this voucher");
        _burn(msg.sender, id, 1);
    }
}
