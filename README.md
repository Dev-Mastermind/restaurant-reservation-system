# Restaurant Reservation App

This is a simple reservation system built with Ruby on Rails. The app allows users to make phone reservations by entering their name, desired time, and requested seating capacity. It will automatically allocate available tables based on the requested capacity, ensuring no double-booking of tables for the same time.

## Features

- Open 24/7, with hourly reservations.
- Make a reservation for a specific time, with seating capacity automatically assigned.
- If tables are not available for the requested party size, an error message will be displayed.
- A responsive interface listing all reservations and providing a simple form for new reservations.
- Built using Bootstrap for a clean, responsive layout.
- Simple interface without user accounts or login.

## Technologies Used

- **Ruby:** ~> 3.x
- **Rails:** 7.x
- **Database:** PotgreSQL
- **Bootstrap:** Responsive UI
- **Turbo:** Submit reservations request without page load using Hotwire/Turbo.
- **RSpec:** For unit testing
- **FactoryBot, Shoulda-Matchers, Database Cleaner:** For model and controller tests

## Getting Started

### Prerequisites

Make sure you have the following installed:

- Ruby ~> 3.x
- Rails ~> 7.x
- PostgreSQL/MySQL (for development, production)

### Installation

1. Clone the repository:

  git clone https://github.com/Dev-Mastermind/restaurant-reservation-system.git
  cd reservation-app

2. Install dependencies:

  bundle install

3. Set up the database:

  rails db:create db:migrate db:seed

4. Start the Rails server:

  rails server

5. Visit `http://localhost:3000` to access the app.

## Database Setup

The app uses **Postgresql** for development. You can switch to any other database by updating the `config/database.yml` file accordingly.

--------------------------------------------------------------

Possible Enhancements:

- For now, I added the unit tests for this app using Rspec framework. If you need integration testing then I'll add integrations test using capybara as well.

- I kept the architecture a bit simple and added some basic required validations for this app. If you need any other custom validation, I'll add that.

- I developed and tested the application locally on my system. If you want to deploy the app to production, then I can deploy it to any cloud based platform that provides free tier like Fly.io, Netlify or any others.
