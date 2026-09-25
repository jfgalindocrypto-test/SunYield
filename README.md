# SunYield
SunYield Energy (SYE)
## 1. El Caso de Negocio y Tokenomics: Proyecto "SunYield"
El objetivo es democratizar la inversión en infraestructuras de energía renovable. Para este caso, vamos a tokenizar una instalación real: una micro-planta de generación y almacenamiento híbrido basada en paneles solares de alta eficiencia y sistemas de baterías de litio-ferrofosfato (específicamente unidades Anker Solix Solarbank 2 E1600 Pro).

### Modelo de Rentabilidad:
La instalación captura energía solar durante el día y la almacena en las baterías mediante cableado DC de 4mm². Esta energía se inyecta a la red eléctrica o se vende a empresas locales durante los picos de máxima demanda, generando un diferencial de precio (arbitraje energético) y retornos por certificados verdes. Los beneficios netos se distribuyen proporcionalmente entre los poseedores del token.

### Tokenomics Básicos:
- **Nombre del Token:** SunYield Energy (SYE)
- **Suministro Total (Max Supply):** 10,000 tokens. (Representan el 100% de los derechos económicos de una instalación piloto valorada en 100,000 €).
- **Precio Inicial:** 10 € por token.
- **Clasificación:** Financieramente actúa como un Security Token (representa un derecho de rendimiento), aunque técnicamente lo emitiremos bajo el estándar fungible de utilidad para aprender su funcionamiento.

## 2. Elección de la Blockchain (Coste de Mantenimiento Mínimo)
Para que un modelo de tokenización de activos del mundo real (RWA) sea viable, los márgenes de beneficio del negocio no pueden ser devorados por los costes de infraestructura tecnológica (los gas fees).

La elección óptima para este proyecto es Polygon (PoS). Es una cadena lateral (sidechain) compatible con la Ethereum Virtual Machine (EVM).
- **Justificación:** Mientras que desplegar o transaccionar este contrato en la red principal de Ethereum podría costar decenas de euros, en Polygon las comisiones rondan fracciones de un céntimo (aprox. 0.001 € por transacción). Esto garantiza que, cuando un inversor minorista compre 5 tokens (50 €), el coste tecnológico de la red no destruya su rentabilidad esperada, permitiendo un mantenimiento de base de datos distribuida prácticamente a coste cero.

### 3. ¿Cómo se define el contrato inteligente?
Un contrato inteligente (smart contract) es un programa informático que se ejecuta automáticamente en la blockchain cuando se cumplen ciertas condiciones. Para representar participaciones idénticas e intercambiables de nuestro proyecto de baterías, utilizaremos el estándar global ERC-20.

A continuación, un código minimalista en Solidity (el lenguaje de programación estándar para EVM), utilizando la librería segura y auditada de OpenZeppelin para reducir el coste de despliegue:

``` Solidity
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
```

### 4. ¿Cómo se identifica este contrato en la cadena?
Una vez que el código anterior se compila y se envía a la blockchain, la red le asigna automáticamente un Contract Address (Dirección de Contrato).

Piensen en el Contract Address como el DNI digital y permanente del proyecto (por ejemplo: 0x742d35Cc6634C0532925a3b844Bc454e4438f44e). Esta dirección garantiza la inmutabilidad: asegura a los inversores que las reglas del juego (los 10,000 tokens máximos) no pueden ser alteradas unilateralmente. Cualquier persona en el mundo puede consultar esta dirección para auditar la transparencia del suministro y rastrear quién posee cada fracción del parque de baterías en tiempo real, sin depender de un registro notarial cerrado.

### 5. ¿Cómo se pueden vender los tokens del contrato?
Para distribuir los tokens a los inversores con el menor coste posible, se pueden emplear dos mecanismos técnicos eficientes:

- **Venta Directa (OTC/dApp):** Se programa una Interfaz Descentralizada (dApp) conectada a un contrato de Crowdsale. El inversor conecta su billetera web3, envía la criptomoneda estable equivalente (ej. USDT o USDC) y el contrato le transfiere automáticamente los tokens SYE correspondientes. Todo en una sola transacción atómica y segura.
- **Pool de Liquidez (DEX):** Se crea un par de intercambio (ej. SYE / USDC) en un exchange descentralizado como Uniswap v3 sobre Polygon. Los inversores pueden comprar y vender los tokens libremente las 24 horas del día operando contra el contrato de liquidez, descentralizando totalmente el mercado secundario.

<!-- <EOF> README.md -->
