let productosEnCarrito = localStorage.getItem("productos-en-carrito");
productosEnCarrito = JSON.parse(productosEnCarrito) || [];

cargarProductosCarrito();

document.querySelector('#user-form').addEventListener('submit', function(event) {
    event.preventDefault();

    const firstName = document.getElementById('firstName').value;
    const lastName = document.getElementById('lastName').value;
    const email = document.getElementById('email').value;
    const documentType = document.getElementById('documentType').value;
    const documentNumber = document.getElementById('documentNumber').value;
    const phone = document.getElementById('phone').value;

    if (firstName && lastName && email && documentType && documentNumber && phone) {
        window.location.href = "envio.html";
    } else {
        Swal.fire({
            title: 'Error',
            text: 'Por favor completa todos los campos antes de continuar.',
            icon: 'error'
        });
    }
});

function cargarProductosCarrito() {
    const contenedorResumenCarrito = document.querySelector("#resumen-carrito");

    if (productosEnCarrito.length > 0) {
        const subtotalCarrito = productosEnCarrito.reduce((acc, producto) => acc + (producto.precio * producto.cantidad), 0);
        let resumenCarritoHTML = `
            <h4>Resumen del Carrito</h4>
            <p>Total de productos: ${productosEnCarrito.reduce((acc, producto) => acc + producto.cantidad, 0)}</p>
            <p>Subtotal: $${subtotalCarrito.toFixed(2)}</p>
        `;

        contenedorResumenCarrito.innerHTML = resumenCarritoHTML;
    } else {
        contenedorResumenCarrito.innerHTML = '<p>No hay productos en el carrito.</p>';
    }
}


