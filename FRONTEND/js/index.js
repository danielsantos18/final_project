const sideMenu = document.querySelector('aside');
const menuBtn = document.querySelector('#menu-btn');
const closeBtn = document.querySelector('#close-btn');
const themeToggler = document.querySelector('.theme-toggler');

// Mostrar el menú
menuBtn.addEventListener('click', () => {
  sideMenu.style.display = 'block';
});

// Ocultar el menú
closeBtn.addEventListener('click', () => {
  sideMenu.style.display = 'none';
});

// Alternar modo oscuro
themeToggler.addEventListener('click', () => {
  document.body.classList.toggle('dark-theme-variables');
  
  const headings = document.querySelectorAll('h1, h2, h3, h4, h5,th');
  headings.forEach(heading => {
    if (document.body.classList.contains('dark-theme-variables')) {
      heading.style.color = '#edeffd';
    } else {
      heading.style.color = ''; // Vuelve al color original
    }
  });

  themeToggler.querySelector('span').classList.toggle('active');
});
