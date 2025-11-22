document.addEventListener('DOMContentLoaded', () => {
    // Global Logic (Header, Hamburger Menu, Shared Utils)
    
    // Hamburger menu logic
    const hamburger = document.querySelector('.hamburger');
    const navLinks = document.querySelector('.nav-links');

    if (hamburger) {
        hamburger.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });
    }
});