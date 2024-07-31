import styles from "./Homepage.module.css";
import {Link} from "react-router-dom";
import PageNav from "../components/PageNav.jsx";

export default function Homepage() {
    return (
        <main className={styles.homepage}>
            <PageNav/>
            <section>
                <h1>
                    Discover Your Ideal City in Illinois.
                    <br />
                    CityFinder simplifies your home-finding journey.
                </h1>
                <h2>
                    CityFinder helps you compare cities based on current property prices, crime rates, school quality, and property value appreciation rates. Make informed decisions and find the perfect place to call home.
                </h2>
                <Link to='login' class='cta'>Find My City Now</Link>
            </section>
        </main>
    );
}
