
document.getElementById('login-form').addEventListener('submit', function(event) {
    event.preventDefault(); 

    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    // Simular autenticación (reemplazar con lógica de autenticación real)
    if (username === 'usuario' && password === 'usuario') {
        window.location.href = 'index.html';
    } else if (username === 'admin' && password === 'admin') {
        window.location.href = 'admin.html';
    } else {
        Swal.fire({
            title: 'Error',
            text: 'Por favor completa todos los campos antes de continuar.',
            icon: 'error'
        });
    }
});
