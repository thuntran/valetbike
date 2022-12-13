# ValetBike

Smith College CSC223: Software Engineering\
Starter App for ValetBike project\

This app was built by Team Really Good Name (RGN):
- [Annie Karitonze](https://github.com/stardess)
- [Asher Uman](https://github.com/ashruman)
- [Thu Tran](https://github.com/thuntran)
- [Sarah Branch](https://github.com/sbranch58)
- [Manar Alnazer](https://github.com/Manarnz)

App is now live on Heroku: http://valetbikergn.herokuapp.com/ 

## Environment Configuration

As you configure your environment you should **keep a log** where you **write down all the steps you take** including **each command you type**. You will inevitably run into errors setting up your development environment and maintaining a meticulous log will allow others to help you troubleshoot. Ignore this recommendation at your own peril, but don't say you haven't been warned :]

Installing Ruby on Rails is not a trivial process. It is the essential first step to developing ValetBike, and it will take you far longer than all the other steps to complete. Be sure to set aside ample time to work through the setup.

### 0. Remember that versions matter
ValetBike runs on Ruby 3.1.2 and Rails 7.0.3.1. It is essential that you configure your environment to use these precise versions of the language and framework.

### 1. Install Ruby on Rails with MySQL

On Mac it is strongly recommended that you use asdf to install Ruby. On Windows you should set up your environment through the Windows Subsystem for Linux (WSL). The guides below explain how to do so in detail:

- [Mac Ruby on Rails Developer Environment Setup](https://github.com/deadroxy/valetbike/blob/master/notes/mac-setup.md)
- [Windows Ruby on Rails Developer Environment Setup](https://github.com/deadroxy/valetbike/blob/master/notes/windows-setup.md)

Be sure to complete all the installation procedures in the relevant guide before continuing on to the next step.

### 2. Fork & clone the ValetBike repo

- Click fork in the upper right hand corner of the ValetBike GitHub page
- This creates a copy of the repository on your personal GitHub account
- To access this code on your development machine, create a local copy of your fork with:\
  `git clone https://github.com/<your_username>/valetbike.git`
- Alternatively, you can also create a local copy of your fork using SSH remote with:\
  `git@github.com:<your_username>/valetbike.git`
- Note: you should run that command when you are in the folder where you want to store the repo\
  (e.g. `/Users/<your_username>/Development`)

### 3. Prepare the application

- Enter the directory you just created: `cd valetbike`
- Add `.tool-versions` to app directory to ensure the right ruby is always used: `asdf local ruby 3.1.2`
- Install required gems with: `bundle install`

### 4. Configure the database environment variables

- Add a file called `.env` to the valetbike root directory
- Ensure that it includes the credentials you setup when installing MySQL:

```shell
MYSQL_USERNAME=root
MYSQL_PASSWORD=YOURPASSWORD
MYSQL_SOCKET=/tmp/mysql.sock              # For Mac
MYSQL_SOCKET=/var/run/mysqld/mysqld.sock  # For Windows
```

### 5. Prepare the database in MySQL

- Use rails to create both the development and test databases with:\
  `rake db:create`
- Or use mysql to just create the development databse with:\
  `mysql -u root -p`\
  `CREATE DATABASE valetbike_development;`\
  `exit`
- Populate the database (by importing data from CSV files) with:\ 
  `rake import_data:data`.
- Then run the database migrations with:\
  `rake db:migrate`

### 6. Confirm that the app runs

* Launch the web server using `rackup` or `rails s` (short for `rails server`) or `bin/dev`
* If using `rackup` open http://localhost:9292 (or http://127.0.0.1:9292) in a browser
* If using `rails s` or `bin/dev` open http://localhost:3000 (or http://127.0.0.1:3000) in a browser
* You should see the ValetBike homepage

## Complete description of the MVP's functionality: 
- **Log In/Sign Up/Forgot Password pages**:
  - Existing users can log in through the Log In page
  - New users can sign up through the Sign Up page.
  - If users happen to forget their passwords, there is a “Forget your password?” button in the Log In page, and when they click on this button, they will be prompted to the Forget Password page to reset their password (note: no password can actually be reset at this point, it’s a feature that we think should be included to complete the log in/sign up process.)
- **Profile/Sign out dropdown**: Once a user is logged in, they can view their account information by clicking on the “Profile” option in the drop-down located on the upper right-hand corner of the website. They can also sign out of the website by selecting the “Sign out” option on the drop-down.
  - The “Profile” option will lead users to the **Account** page where they can view their username, email address, balance, ride history, and an option to sign out of the website.
  - When the user is on a ride and they visit the “Profile” page, they can end their ride in the ride history section.
- **Homepage/ValetBike**: Users can view the basic instructions about how to use ValetBike on the homepage. There are also other features such as Bike Pun and Explore Nature/Explore Town. 
- **Station Map/List**: Users can view the list of stations and a map that shows where the stations are located. Currently, we are including 5 stations in the Northampton neighborhood: Forbes Library, John M Greene Hall/Smith College, Pulaski Park, Main Street/Court House, Main Street/Bridge Street. 
  - **Station List** is on the left panel of the page, and users can view the list of bikes at each station. The bike information displayed right now includes the bike ID, the bike’s current battery percentage which is currently static but is there to show what would be there for actual bike percentages, and the bike’s runtime corresponding to the battery. There is also information about the number of docked bikes and the number of available docks at each station. Users can click ‘Rent this bike’ to be redirected to the **Rent** page with the bike (and corresponding station) already selected. 
  - **Station Map** is on the right panel: each station is represented by a pin on the map, and as users click on a pin, they can see a pop-up showing the name of the station, a hyperlink that redirects users to a Google Map address of the station, and an option to rent a bike from a selected station, made as a hyperlink redirecting user to the **Rent** page for the respective station.
- **Pricing and Payment**: Users can select the amount they would like to add to their account balance in order to purchase rides. The current amounts we offer are $5, $10, $25, and $50. The cost of a 30-minute ride is set to be $2.50. We plan to change the payment system such that riders can officially ride for more than 30 minutes, as long as their battery is not empty. In the meantime, riders can ride for as long as they desire without the battery percentage changing.
- **Rent**: 
  - On the **Rent** page, users can select a station and a bike docked at that station, to start a ride. The selected bike will be removed from the selected station.
  - Users will receive a flash alert if they don’t have enough credits to be on the ride. 
  - When they finish a ride, users need to click on the End ride button, and return their bike to a ValetBike station.  
  - For every bike renting process, a ride data instance (id, start_station_id, end_station_id, bike_id, user_id, start_time, end_time, created_at, updated_at, identifier) will be created in the Rides table in the database.
- **About**: Users can read more information about the purpose of building ValetBike and the development team (i.e. us) on the **About** page. 
- **Help**: Users can find the ValetBike FAQs on the **Help** page.

## Recommended walkthrough steps to observe key features:
- When you start a new session from the browser, you will be on the **Homepage** of the website. Click on the “Login” button in the upper right corner, and then click “Sign up”, which will allow you to set an email, username, and password. Submitting the sign-up form will automatically create a user account and log you in, granting access to all of ValetBike’s user features.
- When logged in, your username will be displayed in the upper right corner. Clicking on it shows a drop-down with the option to view your profile or sign out. Clicking on the profile link shows you your account information, such as username, email address, balance (automatically set to $0.00 when your account is created), and ride history.
- Navigate to **Station Map/List** by clicking on the “Station Map/List” button on the navigation bar to view all the station information, as well as their locations on a map. You can choose a specific station or bike to rent from this page (however, you can also do this directly on the **Rent** page).
- After viewing the map, it’s time to start a ride! Navigate to **Rent**, which will allow you to select a station to start your ride at. Selecting a station brings up another form that allows you to select one of the bikes at that station.
- After selecting a bike, you can click “Start Ride”, which will bring up a page displaying information about the ride you are on. Clicking “End Ride” at the bottom will direct you to select the station you are returning the bike to. If you navigate off of the ride page, you can return to it by either selecting “Rent” in the navigation again, or go directly to the “End Ride” option by checking your Ride History on the Account page and clicking “End Ride” where prompted. After selecting the station, the bike will be returned to the station, and your final ride information will be displayed.

## License
Copyright 2021-2022, Johanna Brewer

This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU Affero General Public License along with this program. If not, see https://www.gnu.org/licenses.

