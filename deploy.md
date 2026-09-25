# Taller Práctico: Despliegue y Consulta en Vivo
Vamos a simular el despliegue del contrato anterior a coste cero, utilizando la red de pruebas (Testnet) de Polygon, llamada Amoy. Esta red funciona exactamente igual que la real, pero usa tokens sin valor financiero.

## Paso 1: Preparación del entorno (Herramientas)

Instalar la extensión **MetaMask** en su navegador web.
https://chromewebstore.google.com/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?pli=1

Añadir la red Polygon Amoy Testnet a MetaMask (pueden hacerlo fácilmente buscando "Amoy" en chainlist.org).

Obtener fondos ficticios para pagar el gas: Ir a un Polygon Faucet público (ej. faucet.polygon.technology), pegar su dirección de MetaMask y recibir tokens POL de prueba gratuitos.

## Paso 2: Despliegue del Contrato

Abrir la aplicación Remix IDE (remix.ethereum.org) en tu navegador. No requiere instalación.

Crear un nuevo archivo llamado SunYield.sol y pega el código Solidity definido.

Ir a la pestaña "Solidity Compiler" en el menú lateral izquierdo y pulsa "Compile SunYield.sol".

Ir a la pestaña "Deploy & Run Transactions".

En el campo "Environment", selecciona Injected Provider - MetaMask. Tu billetera te pedirá permiso para conectarse.

Asegúra de que el contrato SunYieldEnergy está seleccionado y haz clic en Deploy. Confirmar la transacción en la ventana emergente de MetaMask (costará una fracción mínima de sus POL de prueba).

## Paso 3: Consulta de la Transparencia

Una vez confirmada la transacción en Remix, en la sección inferior ("Deployed Contracts") verá su contrato. Copia el Contract Address.

Ir al explorador de bloques público: amoy.polygonscan.com.

Pegar el Contract Address en el buscador.

**Resultado:** Acabas de verificar su RWA en la cadena: podrás ver la transacción de creación (Contract Creation), el nombre del token (SunYield Energy), y si accedes al "Token Tracker", comprobaras públicamente que el Max Total Supply está auditado matemáticamente en 10,000 unidades, inmutable y listo para los inversores.
