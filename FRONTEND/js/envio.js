// Función para obtener y almacenar datos del formulario de envío
document.querySelector('#envio-form').addEventListener('submit', function (event) {
    event.preventDefault();

    const department = document.getElementById('department').value;
    const municipe = document.getElementById('municipe').value;
    const typeDirection = document.getElementById('type-direction').value;
    const street = document.getElementById('street').value;
    const neighborhood = document.getElementById('neighborhood').value;
    const floor = document.getElementById('floor').value;

    if (department && municipe && typeDirection && street && neighborhood && floor) {
        // Almacenar datos en localStorage
        const envioData = {
            department,
            municipe,
            typeDirection,
            street,
            neighborhood,
            floor
        };
        localStorage.setItem('envioData', JSON.stringify(envioData));

        window.location.href = "pago.html";
    } else {
        Swal.fire({
            title: 'Error',
            text: 'Por favor completa todos los campos antes de continuar.',
            icon: 'error'
        });
    }
});

// Función para calcular y mostrar fechas de entrega
function calculateDeliveryDates() {
    const today = new Date();
    const deliveryDays = 5; // Número de días hábiles
    let deliveryDate = new Date(today);

    // Añadir días hábiles, excluyendo fines de semana
    let count = 0;
    while (count < deliveryDays) {
        deliveryDate.setDate(deliveryDate.getDate() + 1);
        if (deliveryDate.getDay() !== 0 && deliveryDate.getDay() !== 6) { // Excluye domingos y sábados
            count++;
        }
    }

    // Formatear la fecha
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    const formattedToday = today.toLocaleDateString('es-ES', options);
    const formattedDeliveryDate = deliveryDate.toLocaleDateString('es-ES', options);

    // Mostrar las fechas en el HTML
    const deliveryInfo = document.getElementById('delivery-info');
    deliveryInfo.innerHTML = `
        <h3>Información de Entrega</h3>
        <li>Fecha actual: ${formattedToday}</li>
        <li>Fecha estimada de entrega: ${formattedDeliveryDate}</li>
    `;
}

document.addEventListener('DOMContentLoaded', calculateDeliveryDates);

// Función para obtener datos del formulario desde localStorage
function getEnvioData() {
    const envioData = localStorage.getItem('envioData');
    if (envioData) {
        return JSON.parse(envioData);
    } else {
        return null;
    }
}

// Ejemplo de uso de la función getEnvioData en otro archivo
document.addEventListener('DOMContentLoaded', function () {
    const envioData = getEnvioData();
    if (envioData) {
        // Mostrar los datos en el HTML o usarlos según sea necesario
        console.log('Datos de envío:', envioData);
        // Aquí puedes actualizar el DOM con los datos de envío si es necesario
    }
});
