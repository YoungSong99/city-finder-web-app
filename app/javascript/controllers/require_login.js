import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        console.log("user login clicked");
    }

    loginRequired(event) {
        event.preventDefault();
        alert("Saving City feature requires login. Please login to continue.");
    }
}
