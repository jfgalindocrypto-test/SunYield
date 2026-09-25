// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Importamos el estándar ERC-20 desde OpenZeppelin para garantizar seguridad
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SunYieldEnergy is ERC20 {
    // El constructor se ejecuta solo una vez al desplegar el contrato
    constructor() ERC20("SunYield Energy", "SYE") {
        // Acuñamos (creamos) los 10,000 tokens iniciales y los enviamos al creador
        // Multiplicamos por 10**18 porque las blockchains manejan hasta 18 decimales
        _mint(msg.sender, 10000 * 10 ** decimals());
    }
}

