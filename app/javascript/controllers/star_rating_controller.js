import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["star", "ratingInput"]

    connect() {
        this.renderStars(this.ratingInputTarget.value);
    }

    setRating(event) {
        const rating = event.currentTarget.dataset.value;
        this.ratingInputTarget.value = rating;
        this.renderStars(rating);
    }

    renderStars(rating) {
        this.starTargets.forEach(star => {
            if (star.dataset.value <= rating) {
                star.classList.add('checked');
            } else {
                star.classList.remove('checked');
            }
        });
    }
}