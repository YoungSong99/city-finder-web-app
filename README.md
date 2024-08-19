# CityFinder

## Description
**CityFinder** is a comprehensive tool designed to simplify the home-finding process. It empowers users to compare cities based on key metrics such as current property prices, crime rates, school quality, and property value appreciation rates. With CityFinder, users can make well-informed decisions tailored to their personal preferences and needs.

## Table of Contents
- [Data utilization](#data utilization)
- [Installation](#Installation)
- [Usage](#Usage)
- [Contributing](#Contributing)
- [License](#License)

## Data utilization
CityFinder offers two approaches for data utilization:

### Option 1: Using Data from Your Own Cities

**Step 1: Web Scraping**

Utilize the web scraping script available [here]( https://github.com/YoungSong99/city-finder-web-scraping ), which leverages Python's BeautifulSoup to collect data from NeighborhoodScout and Greatschool.
Populate the provided Excel file in the repository with the city names for which you wish to gather data.

**Step 2: ETL City Data**

Transfer the extracted data to your server using Pentaho Data Integration.
Run the transformation files available [here]( https://github.com/YoungSong99/city-finder-data-ETL).


### Option 2: Using Illinois City Data
Simply use the SQL dump file located in the Data folder to load pre-existing data into your connected database.

## Installation
To set up CityFinder locally, follow these steps:

1) Clone the repository:
```bash
git clone https://github.com/YoungSong99/city-finder-web-app.git
cd cityfinder
```
2) Install dependencies:

```bash
bundle install
```
3) Set up the database:
```bash
rails db:create
rails db:migrate
```
4) Run the application:
```bash
rails server
```

## Usage
1. Start the Rails server:
   `rails server`

2. Open your browser and navigate to http://localhost:3000
   Follow the on-screen instructions to use the application

## Contributing
We welcome contributions to CityFinder! To contribute, please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Open a pull request

## License
CityFinder is distributed under the MIT License. See the LICENSE file for more information.

## Contact
If you have any questions or suggestions for improvement, feel free to contact me on [LinkedIn](https://www.linkedin.com/in/youngsong-us/)
