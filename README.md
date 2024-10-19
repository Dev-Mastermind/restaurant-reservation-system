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

- **Ruby:** ~> 3.1.2
- **Rails:** 7.0.8.5
- **RVM:** 1.29.12
- **Database:** PotgreSQL
- **Bootstrap:** Responsive UI
- **Turbo:** Submit reservations request without page load using Hotwire/Turbo.
- **RSpec:** For unit testing

- **FactoryBot, Shoulda-Matchers, Database Cleaner:** For model and controller tests

## Getting Started

### Prerequisites

Make sure you have the following installed:

- Ruby ~> 3.1.2
- Rails ~> 7.0.8.5
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


6. Run `rspec` command to run all test or run `rspec spec/file_spec.rb` to run specific file

## Database Setup

The app uses **PostgreSQL** for development. To set up PostgreSQL, follow these steps:

1. **Install PostgreSQL**:
  - If you haven't already installed PostgreSQL, you can download it from the [official PostgreSQL website](https://www.postgresql.org/download/) or install it using a package manager:
  - **macOS**: `brew install postgresql`
  - **Ubuntu**: `sudo apt-get install postgresql postgresql-contrib`

2. **Start PostgreSQL Service**:
  - Make sure the PostgreSQL service is running:
  - **macOS**: `brew services start postgresql`
  - **Ubuntu**: `sudo service postgresql start`

3. **Create the Database**:
  - Open the PostgreSQL command line interface:
   ```bash
   psql postgres
   ```
  - Create a new user (replace `your_username` and `your_password`):
   ```sql
   CREATE USER your_username WITH PASSWORD 'your_password';
   ```
  - Grant privileges to the user:
   ```sql
   ALTER USER your_username CREATEDB;
   ```

4. **Update Database Configuration**:
  - Update your `config/database.yml` file with your PostgreSQL username and password.

## Environment Variables

To manage environment-specific configurations, this app uses a `.env` file. You can setup your respective environments to be used in app within `.env` by following template from `.env.example`

--------------------------------------------------------------

Possible Enhancements:

- For now, I added the unit tests for this app using Rspec framework. If you need integration testing then I'll add integrations test using capybara as well.

- I kept the architecture a bit simple and added some basic required validations for this app. If you need any other custom validation, I'll add that.

- I developed and tested the application locally on my system. If you want to deploy the app to production, then I can deploy it to any cloud based platform that provides free tier like Fly.io, Netlify or any others.
