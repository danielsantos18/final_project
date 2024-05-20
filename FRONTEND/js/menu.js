document.addEventListener('DOMContentLoaded', () => {
    const openMenuButton = document.getElementById('open-menu');
    const closeMenuButton = document.getElementById('close-menu');
    const aside = document.querySelector('aside');

    openMenuButton.addEventListener('click', () => {
        aside.classList.add('open');
    });

    closeMenuButton.addEventListener('click', () => {
        aside.classList.remove('open');
    });
});
