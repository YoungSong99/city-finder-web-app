import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["starIcon", "rating"]

    selectStar(event) {
        this.ratingTarget.value = event.currentTarget.dataset.value;
        this.starIconTarget.classList.add("checked");
        this.starIconTargets.forEach(star => {
            if (star.dataset.value <= this.ratingTarget.value) {
                star.classList.add('checked');
            } else {
                star.classList.remove('checked');
            }
        });
    }
}
