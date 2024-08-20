import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["quote"]

    connect() {
        this.currentIndex = 0
        this.showCurrentQuote()
        this.startCarousel()
    }

    startCarousel() {
        this.interval = setInterval(() => this.showNextQuote(), 5000)
    }

    showCurrentQuote() {
        this.quoteTargets.forEach((quote, index) => {
            quote.classList.toggle('active', index === this.currentIndex)
        })
    }

    showNextQuote() {
        this.currentIndex = (this.currentIndex + 1) % this.quoteTargets.length
        this.showCurrentQuote()
    }

    disconnect() {
        clearInterval(this.interval)
    }
}
