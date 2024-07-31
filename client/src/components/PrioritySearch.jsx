/* eslint-disable react-refresh/only-export-components */
/* eslint-disable no-unused-vars */
/* eslint-disable no-undef */
/* eslint-disable no-empty */

import { useState } from "react";
import styles from "./PrioritySearch.module.css";
import Button from "./Button.jsx";
import BackButton from "./BackButton.jsx";


const languages = [
    "Spanish", "Langs. of India", "Polish", "Italian", "Urdu", "Arabic",
    "Other Indo-European", "German/Yiddish", "French", "Tagalog",
    "Slavic languages", "Greek", "Other Asian languages", "Chinese",
    "Korean", "Vietnamese", "Portuguese", "African languages",
    "Native American languages", "Pacific Island languages", "Russian",
    "Serbo-Croatian"
];

function PrioritySearch() {

    const [priorities, setPriorities] = useState(['', '', '']);
    const [selectedCommunity, setSelectedCommunity] = useState('');

    const handlePriorityChange = (index, value) => {
        const newPriorities = [...priorities];
        newPriorities[index] = value;
        setPriorities(newPriorities);
    };

    const handleCommunityChange = (e) => {
        setSelectedCommunity(e.target.value);
    };

    const getLabel = (index) => {
        switch (index) {
            case 0:
                return '1st Pick';
            case 1:
                return '2nd Pick';
            case 2:
                return '3rd Pick';
            default:
                return 'Pick';
        }
    };

    return (
        <>
            <h1>Find Your Top 5 Cities in Illinois</h1>
            <form className={styles.form}>
                <h1>What matters most to you?</h1>
                {priorities.map((priority, index) => (
                    <div className={styles.row} key={index}>
                        <label htmlFor={`priority-${index}`}>{getLabel(index)}</label>
                        <select
                            id={`priority-${index}`}
                            className={styles.select}
                            value={priority}
                            onChange={(e) => handlePriorityChange(index, e.target.value)}
                        >
                            <option value="">Select a factor</option>
                            <option value="School">School Rating</option>
                            <option value="Safety">Safety</option>
                            <option value="Appreciation">Appreciation Value</option>
                            <option value="Metra">Metra Station</option>
                            <option value="Grocery">Grocery Store</option>
                            <option value="Coffee">Coffee shop</option>
                            <option value="Community">Community</option>
                        </select>

                        {priority === 'Grocery' && (
                            <div className={styles.grid}>
                                <div>
                                    <input type="checkbox" id="jewel-osco" name="grocery" value="Jewel-Osco"/>
                                    <label htmlFor="jewel-osco">Jewel-Osco</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="marianos" name="grocery" value="Mariano's"/>
                                    <label htmlFor="marianos">Mariano's</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="whole-foods-market" name="grocery" value="Whole Foods Market"/>
                                    <label htmlFor="whole-foods-market">Whole Foods Market</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="trader-joes" name="grocery" value="Trader Joe's"/>
                                    <label htmlFor="trader-joes">Trader Joe's</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="aldi" name="grocery" value="ALDI"/>
                                    <label htmlFor="aldi">ALDI</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="meijer" name="grocery" value="Meijer"/>
                                    <label htmlFor="meijer">Meijer</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="walmart" name="grocery" value="Walmart"/>
                                    <label htmlFor="walmart">Walmart</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="target" name="grocery" value="Target"/>
                                    <label htmlFor="target">Target</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="hmart" name="grocery" value="hmart"/>
                                    <label htmlFor="hmart">H-mart</label>
                                </div>
                            </div>
                        )}

                        {priority === 'Coffee' && (
                            <div className={styles.grid}>
                                <div>
                                    <input type="checkbox" id="starbucks" name="coffee" value="Starbucks"/>
                                    <label htmlFor="starbucks">Starbucks</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="dunkin" name="coffee" value="Dunkin'"/>
                                    <label htmlFor="dunkin">Dunkin'</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="peets-coffee" name="coffee" value="Peet's Coffee"/>
                                    <label htmlFor="peets-coffee">Peet's Coffee</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="mccafe" name="coffee" value="McCafé"/>
                                    <label htmlFor="mccafe">McCafé</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="caribou-coffee" name="coffee" value="Caribou Coffee"/>
                                    <label htmlFor="caribou-coffee">Caribou Coffee</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="intelligentsia-coffee" name="coffee" value="Intelligentsia Coffee"/>
                                    <label htmlFor="intelligentsia-coffee">Intelligentsia Coffee</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="philz-coffee" name="coffee" value="Philz Coffee"/>
                                    <label htmlFor="philz-coffee">Philz Coffee</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="big-shoulders-coffee" name="coffee" value="Big Shoulders Coffee"/>
                                    <label htmlFor="big-shoulders-coffee">Big Shoulders Coffee</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="foxtrot" name="coffee" value="Foxtrot"/>
                                    <label htmlFor="foxtrot">Foxtrot</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="tim-hortons" name="coffee" value="Tim Hortons"/>
                                    <label htmlFor="tim-hortons">Tim Hortons</label>
                                </div>
                            </div>
                        )}

                        {priority === 'Community' && (
                            <div className={styles.row}>
                                <label htmlFor="community-language">Select a language</label>
                                <select
                                    id="community-language"
                                    className={styles.select}
                                    value={selectedCommunity}
                                    onChange={handleCommunityChange}
                                >
                                    <option value="">Select a language</option>
                                    {languages.map((language, idx) => (
                                        <option key={idx} value={language}>{language}</option>
                                    ))}
                                </select>
                            </div>
                        )}
                    </div>
                ))}
                <div className={styles.buttons}>
                    <Button type='primary'>Search</Button>
                    <BackButton/>
                </div>
            </form>
        </>
    );
}

export default PrioritySearch;
