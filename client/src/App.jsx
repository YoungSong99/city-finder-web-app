import React from 'react';
import {BrowserRouter as Router, Routes, Route, Navigate} from 'react-router-dom';
import Homepage from './pages/Homepage.jsx';
import DashboardLayout from "./pages/DashboardLayout.jsx";
import PrioritySearch from "./components/PrioritySearch.jsx";




function App() {
    return (
        <Router>
            <Routes>
                <Route index element={<Homepage/>}/>
                <Route path="dashboard" element={<DashboardLayout/>}>
                    <Route index element={<Navigate replace to={'priority-search'}/>}/>
                    <Route path="priority-search" element={<PrioritySearch/>}/>
                    {/*<Route path="cities" element={<CityList/>}/>*/}
                    {/*<Route path="cities/:id" element={<City/>}/>*/}
                    {/*<Route path="countries" element={<CountryList/>}/>*/}
                    {/*<Route path="form" element={<Form/>}/>*/}
                </Route>
                {/*<Route path="*" element={<PageNotFound/>}/>*/}
            </Routes>
        </Router>
    );
}

export default App;
