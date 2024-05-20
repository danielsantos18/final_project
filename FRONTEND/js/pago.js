let productosEnCarrito = localStorage.getItem("productos-en-carrito");
productosEnCarrito = JSON.parse(productosEnCarrito) || [];
let envioData = localStorage.getItem('envioData');
envioData = JSON.parse(envioData) || [];
cargarProductosCarrito();
cargarResumenEnvio();


document.querySelector('#pay-form').addEventListener('submit', function (event) {
    event.preventDefault();

    const cardName = document.getElementById('cardName').value;
    const cardNumber = document.getElementById('cardNumber').value;
    const expMonth = document.getElementById('expMonth').value;
    const expYear = document.getElementById('expYear').value;
    const cvv = document.getElementById('cvv').value;

    if (cardName && cardNumber && expMonth && expYear && cvv) {
        Swal.fire({
            title: 'Confirmación de Pago',
            text: '¿Estás seguro de proceder con el pago?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, pagar ahora',
            cancelButtonText: 'Cancelar',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                // Mostrar mensaje de procesamiento
                Swal.fire({
                    title: 'Procesando pago...',
                    text: 'Por favor, espera.',
                    icon: 'info',
                    allowOutsideClick: false,
                    showConfirmButton: false,
                    didOpen: () => {
                        Swal.showLoading();

                        // Simular un retraso para el proceso de pago
                        setTimeout(() => {
                            console.log("Retraso completado, cerrando mensaje de procesamiento...");
                            Swal.close();

                            Swal.fire({
                                title: 'Pago exitoso',
                                text: 'Tu pago se ha realizado correctamente.',
                                icon: 'success',
                                confirmButtonColor: '#3085d6',
                                confirmButtonText: 'Aceptar'
                            });
                        }, 3000);
                    }
                });
            }
        });
    } else {
        Swal.fire({
            title: 'Error',
            text: 'Por favor completa todos los campos antes de continuar.',
            icon: 'error'
        });
    }
});

function cargarResumenEnvio() {
    const contenedorResumenEnvio = document.querySelector(".resumen-envio");

    if (envioData) {
        let resumenEnvioHTML = `
            <h2>Info del envio</h2>
            <p>Departamento: ${envioData.department}</p>
            <p>Municipio: ${envioData.municipe}</p>
            <p>Tipo de Dirección: ${envioData.typeDirection}</p>
            <p>,,,,</p>
            <button class="btn btn-primary editar-btn" id="editar-envio"><i class="bi bi-pencil"></i> Editar</button>
        `;

        contenedorResumenEnvio.innerHTML = resumenEnvioHTML;

        document.getElementById("editar-envio").addEventListener("click", function () {
            window.location.href = "envio.html";
        });
    } else {
        contenedorResumenEnvio.innerHTML = '<p>No hay datos de envío disponibles.</p>';
    }
}

function cargarProductosCarrito() {
    const contenedorResumenCarrito = document.querySelector(".resumen-pedido");

    if (productosEnCarrito.length > 0) {
        const subtotalCarrito = productosEnCarrito.reduce((acc, producto) => acc + (producto.precio * producto.cantidad), 0);
        let resumenCarritoHTML = `
            <h3>Info del pedido</h3>
            <p>Total de productos: ${productosEnCarrito.reduce((acc, producto) => acc + producto.cantidad, 0)}</p>
            <p>Subtotal: $${subtotalCarrito.toFixed(2)}</p>
            <button class="btn btn-primary editar-btn" id="editar-pedido"><i class="bi bi-pencil"></i> Editar</button>
        `;

        contenedorResumenCarrito.innerHTML = resumenCarritoHTML;
        document.getElementById("editar-pedido").addEventListener("click", function () {
            window.location.href = "carrito.html";
        });

    } else {
        contenedorResumenCarrito.innerHTML = '<p>No hay productos en el carrito.</p>';
    }
}
