# CityFinder

## Overview
**CityFinder** is a tool designed to make the home-finding process easier. It allows users to compare cities based on current property prices, crime rates, school quality, and property value appreciation rates, enabling them to make informed decisions.


## Usage Instructions

**Step 1: Fetch Data for Desired Cities**

Use the web scraping code available [here]( https://github.com/YoungSong99/city-finder-web-scraping ), which utilizes Python's BeautifulSoup to scrape information from NeighborhoodScout.
Open the Excel file in the repository and enter the names of the cities you want to fetch data for.

**Step 2: ETL City Data**

Load the data obtained in Step 1 to the server using Pentaho Data Integration.
Run the transformation files available [here]( https://github.com/YoungSong99/city-finder-data-ETL).

**Step 3: Connect Web App and Database**
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

## Main Features

1. **City Information**
   - **Simple Search by City Name**: Users can search for data by entering a city name.
   - **Sequential Search by User Preferences**: Users can search for cities based on their preferences.
   - **Download City Data**: Users can select cities they want to compare and download the data as an Excel file.

2. **Review Feature**
   - **City Reviews**: Users can read reviews about the pros and cons of living in a city and see the recommended family type for that city.
   - **Write Reviews**: Users can write reviews about cities they have lived in.


## Previews
![preview.png](preview.png)


## Feedback
Thank you for using CityFinder! We hope it helps you find the perfect city to call home.
If you have any questions or suggestions for improvement, feel free to contact me on [LinkedIn](https://www.linkedin.com/in/youngsong-us/)
