# ValetBike

Smith College CSC 223: Software Engineering\
ValetBike project\
Team Really Good Name (RGN)\
Annie Karitonze, Asher Uman, Thu Tran, Sarah Branch, Manar Alnazer
App is now live on Heroku: http://valetbikergn.herokuapp.com/ 

## Setting up the dev environment:

- Run `bundle install` to install required gems (including `devise`).
- Create databases with `rake db:create`.
- Populate the database (by importing data from CSV files) with `rake import_data:data`.
- Migrate the database with `rake db:migrate`.
- To check that app runs: open http://localhost:3000/ or http://127.0.0.1:3000/ in a browser.

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

