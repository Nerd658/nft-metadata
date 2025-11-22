/* Logique spécifique à la page d'accueil (ex: Carrousel, Animations Hero) */

document.addEventListener('DOMContentLoaded', () => {
    // Carousel Logic (Si un carrousel est ajouté dans le futur)
    const carouselSlide = document.querySelector('.carousel-slide');
    if (carouselSlide) {
        const carouselImages = document.querySelectorAll('.carousel-img');
        const prevBtn = document.querySelector('.carousel-btn.prev');
        const nextBtn = document.querySelector('.carousel-btn.next');

        let counter = 0;

        if (carouselImages.length > 0) {
            function updateCarousel() {
                carouselImages.forEach(img => {
                    img.style.transform = `translateX(${-counter * 100}%)`;
                });
            }

            nextBtn?.addEventListener('click', () => {
                if (counter >= carouselImages.length - 1) return;
                counter++;
                updateCarousel();
            });

            prevBtn?.addEventListener('click', () => {
                if (counter <= 0) return;
                counter--;
                updateCarousel();
            });
        }
    }
});
