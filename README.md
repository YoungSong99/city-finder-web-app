# CityFinder

## Description
**CityFinder** is a comprehensive tool designed to simplify the home-finding process. It empowers users to compare cities based on key metrics such as current property prices, crime rates, school quality, and property value appreciation rates. With CityFinder, users can make well-informed decisions tailored to their personal preferences and needs.

## Demo Video
[![CityFinder Demo](https://img.youtube.com/vi/-Caw1ChXSXQ/0.jpg)](https://www.youtube.com/watch?v=-Caw1ChXSXQ)

## Table of Contents
- [Data Utilization](#data-utilization)
- [Installation](#installation)
- [Usage](#usage)
- [Database ERD](#database-erd)
- [Contributing](#contributing)
- [License](#license)

## Data Utilization
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

## Database ERD
![cityfinder_erd](data/cityfinder_erd.png)

## Installation
To set up CityFinder locally, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/YoungSong99/city-finder-web-app.git
   cd cityfinder
   
2. **Install dependencies:**

   ```bash
   bundle install
   
3. **Set up the database:**

   a. Create the database:
      ```bash
      rails db:create
      ```

   b. Create the necessary PostgreSQL extensions:
      ```bash
      psql -d city_finder_development -c "CREATE EXTENSION IF NOT EXISTS cube;"
      psql -d city_finder_development -c "CREATE EXTENSION IF NOT EXISTS earthdistance;"
      ```
      - Creating the cube and earthdistance extensions in PostgreSQL is necessary to calculate distances between the user's workplace and cities.
      - Using `IF NOT EXISTS` in the SQL commands prevents errors if the extensions are already present.

   c. Run migrations:
      ```bash
      rails db:migrate
      ```

4. **Run the application**:
   ```bash
   rails server

## Usage
1. Start the Rails server:
   `rails server`

2. Open your browser and navigate to http://localhost:3000
   Follow the on-screen instructions to use the application


## API Documentation
For detailed information on API endpoints, and usage examples, please visit our [API Documentation page](https://github.com/YoungSong99/city-finder-web-app/wiki/API-Documentation) in the project wiki.

## Troubleshooting
Encountered a bug or issue? We’ve got you covered:

* **Bugs & Issues**: Please report any bugs or issues by opening a GitHub Issue.
* **Questions & Suggestions**: Have a question or an idea for improvement? Share your thoughts with the community in our [Discussions section](https://github.com/YoungSong99/city-finder-web-app/discussions) .



## Contributing
We welcome contributions to CityFinder! To contribute, please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Open a pull request

## License
CityFinder is distributed under the MIT License. See the [LICENSE](./LICENSE.txt) file for more information.

## Contact
If you have any questions or suggestions for improvement, feel free to contact me on [LinkedIn](https://www.linkedin.com/in/youngsong-us/)
