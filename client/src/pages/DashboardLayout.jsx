import Sidebar from "../components/Sidebar.jsx";
import styles from './DashboardLayout.module.css'

function DashboardLayout() {
    return (
        <div className={styles.app}>
            <Sidebar/>
        </div>
    )
}
export default DashboardLayout
