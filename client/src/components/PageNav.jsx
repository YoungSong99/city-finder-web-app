import {NavLink} from "react-router-dom";
import styles from './PageNav.module.css'
import Logo from "./Logo.jsx";

function PageNav() {
    return (
        <nav className={styles.nav}>
            <Logo/>
            <ul>
                <li>
                    <NavLink to="/about">About</NavLink>
                </li>
                <li>
                    <NavLink to="/contact">Contact</NavLink>
                </li>
                <li>
                    <NavLink to="/login" className={styles.ctaLink}>Log in</NavLink>
                </li>
            </ul>
        </nav>
    )
}

export default PageNav
