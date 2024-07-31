import styles from './AppNav.module.css'
import {NavLink} from "react-router-dom";
function AppNav() {
    return (
        <div className={styles.nav}>
            <ul>
                <li>
                    <NavLink to={"priority-search"}>Search by Priority</NavLink>
                </li>
                <li>
                    <NavLink to={"compare"}>City Comparison</NavLink>
                </li>
            </ul>
        </div>
    )
}

export default AppNav
