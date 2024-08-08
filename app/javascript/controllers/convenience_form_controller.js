import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["groceryOptions", "gymOptions", "community"]

    connect() {
        this.handlePriorityChange()
    }

    handlePriorityChange(event) {
        const value = event ? event.target.value : this.element.querySelector(".select").value;
        this.groceryOptionsTarget.style.display = value === 'Grocery' ? 'block' : 'none';
        this.gymOptionsTarget.style.display = value === 'Gym' ? 'block' : 'none';
        this.communityTarget.style.display = value === 'Community' ? 'block' : 'none';
    }
}