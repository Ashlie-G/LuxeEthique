## T2A2 Luxe Ethique ##

### R7 ###
* Identification of the problem you are trying to solve by building this particular marketplace app. *

As a vegan who loves luxury handbags, I and many others struggle with our morals and ethics towards purchasing these items as they are made from animal products. I aim to create a trustworthy application that facilitates the listing and purchasing of authentic pre-loved luxury handbags.

### R8 ###
* Why is it a problem that needs solving? *

As more people are trying to be more conscious about their buying choices and the environment, there needs to be a platform that can facilitate and encourage this. I hope to build a trustworthy platform that can encourage ethical buying.

### R9 ###
## Links ##
A link (URL) to your deployed app (i.e. website)
https://luxethique.herokuapp.com/
### R10 ###
A link to your GitHub repository (repo).
- Ensure the repo is accessible by your Educators
https://github.com/Ashlie-G/LuxeEthique

### R11 ###
## Description of your marketplace app ##

#### Purpose ####
The purpose of this app is to create an reputable two way marketplace that allows users to list or purchase authentic pre-loved luxury handbags. It will provide a place for people to purchase ethically and not feel bad about wanting luxury items.

#### Functionality / features ####
Luxe Ethique enables any visitor to the application to read about the application on the about page, contact me via the contact page, or view the current approved listings aka the 'Wardrobe'. They are presented with a set amount of items displayed per page, and are able to navigate to the next or previous pages. If the visitor wants to know more about the item or purchase, they will need to sign up. The application has a fully functional user registration system that asks for email, password, contact number and address.
If the visitor is a user, they can sign into their account with their email and password. 
Once signed in, they are able to access their user profile which allows them to see their current listings(if any) and edit their information. 
A user can browse the current listings, view particular listings and purchase. If the listing belongs to the user, it will state it within the listing and they will be able to destroy it. Users can also create a new listing by completing the form and uploading and image of the product as well as submit its proof of authenticity via email. Once all the appropriate fields have been entered and the listing has been submitted, the user awaits for the admin approval before it appears on the site.
The admin user has access to everything in the app from the admin dashboard. The dashboard features all the active listings, users and pending sales. From here, the admin user is able to view submitted listings and once product authenticity is confirmed, the admin user can approve it. Once the product listing is approved, it is featured in the shop.

- Sitemap
insert sitemap png here
- Screenshots
insert screen shots here
- Target audience
The target audience for the application is anyone wanting to make more conscious decisions about their buying habits. Primarily people who have chosen a minimalist, plantbased or vegan lifestyle, however with the current climate, more people are looking for ethical alternatives.

- Tech stack (e.g. html, css, deployment platform, etc)
Framework
- Ruby on rails
- Bootstrap (CSS)
Database
- PostgreSQL
Authentication and Authoritsation
- Devise
- Rolify
- Cancancan
Image Hosting
- Cloudinary
Payment System
- Stripe
Deployment
- Heroku
Gems
- Simple Form, Dotenv and will_paginate

### R12 ###
User stories for Luxe Ethique
- Visitors to the application can view the 'Wardrobe' (current listings).
- Visitors can view the 'About Us' page.
- Visitors can view the 'Contact' page and submit and enquiry email.
- If visitors would like to get more detail about a product, they will need to sign up to become a user.
- Visitors are able to sign up with a form submitting their email, password, contact number and address.
- Users can view their current listings.
- Users can delete their listings.
- Users can browse the wardrobe of luxury handbags for sale and are notified if a listing is theirs.
- Users can purchase a product listing.
- Users can submit their authentic handbags that they wish to sell with images.
- Administrators can view and approve listing pending for sale.
- Administrators can edit or destroy any listing.
- Administrators can view all current listings and all users.
- Administrators can view all product listings bought.


### R13 ###
Wireframes for your app
### R14 ###
An ERD for your app
### R19 ###
Provide your database schema design
The schema design revolves around the User model as the app functionality is dependent on user actions. Within the schema, all other tables reference user for this reason. The user table attributes include, email(string), password(string), first name(string), last name(string), contact number(string), address(string), suburb(string), state(string) and postcode(integer). Majority of these attributes are strings as they do not require large descriptions. I chose to set the phone number as a string rather than an integer to allow to numbers of different lengths and prefixes. Postcode is set to an integer as this was appropriate for this attribute. When creating tables id's are automatically assigned, so in this case the user_id acts as the primary key which will be references as the foreign key in the other tables in which it has the relationships with.
The product listing table features the user_id attribute with a value of bigint as a foreign key to establish its has_many relationship with the user table. The listing_id is the primary key set to be referenced as the foreign key. Its other attributes include name(string), brand(string), description(string), price(float), category(string), colour(string) and approved(boolean). Again most of the attributes are strings to apply character length constraints. As the description provides potential for more than the standard character amount in the string value, it is assigned the text value. Float was chosen as the value for price in order to account for the possible decimal place when dealing with currency. Finally a boolean value was applied to the approved attribute in order to control the availability of the product listing. If the product is approved for sale, the value of the product listing is true, if not, it is set to false.
They payments table features both the user_id and product_listing_id as bigint values or foreign keys. they both have a has_one relationship with this table. Buyer email, seller email and amount are the other attributes used in the schema table. Again strings are used to constrain the character limit and the amount is set as float due to it being a currency value.
Rolify generates two tables also based off the user table. Roles has and belongs to many users through the user roles joining table. 




keys attributes, constraints
### R15 ###
Explain the different high-level components (abstractions) in your app

Rails Active Record is the model aspect of 'MVC' (Model, View and Controller). It is the system that is responsible for our ability to apply data and logic to our application (Rails Guides). This high level component allows us to create our data tables, use the data and store it within the database. The Active Record Pattern also enables Object Relational Mapping (ORM) (Rails Guides). This technique connects the objects to the tables in relational database management systems. We can then easily store and request data without having to write specific SQL statements. This then provides our controller with the logic it needs in order to send information to the view.
For the purposes of the application, a user, product listing and payment model with controllers were constructed. The models for Rolify and Cancancan are generated when integrating their features.
The user model is also attached to Devise, Rolify and Cancancan. These three gems work together to build a strong authentication and authorization system featuring their built in methods.
The product listing model enables the relationships between the user, product listing and payment models. The product listing controller allows for the logic to be presented in the views.
Payments/ sales are tracked by the payments model and controller which allow the admin user to view a users purchases and track the recent sales within the application.


### R16 ###
Detail any third party services that your app will use
In terms of involvement from third party applications, Luxe Ethique utilizes Cloudinary for image hosting, Stripe for payment systems and Heroku for deployment.
- Cloudinary
    - Cloudinary is a cloud based image and video service. It allows a user to upload, store and edit images or video for websites and applications. Luxe ethque uses it to facilitate the image upload for new and exisiting listings.
- Stripe
    - Stripe is a payment processing software for e-commerce websites and mobile applications. It will be imlpemented within the app for users to purchase products.
- Heroku
    - Heroku is a cloud platform that allows developers to build and operate applications in the cloud. Heroku supports many computer languages and makes the deployment process seamless.
- Formspree
    - Formspree is a form backend API and email service used for HTML forms. This service provided the action and inputs for the contact form to send the request straight the the Luxe Ethique email account.

### R17 ###
Describe your projects models in terms of the relationships (active record associations) they have with each other
The User model is the central model that has relationships to the other models within the application.
User
```rolify```
```has_and_belongs_to_many :users, :join_table => :users_roles```
```has_one :payment```
```has_many :product_listings, dependent: :destroy```
As the user model was used to implement Rolify, the rolify joining table relationship is created automatically.
A user id must be attached to every payment as both buyer and seller, but only one payment can be occuring at a time.
A user can have as many listings as they like on the application, so the has_many relationship is established between the user and the product listings.
The ProductListing model is responsible for the management of each product listed.
ProductListing
```belongs_to :user```
```has_one :payment```
```has_one_attached :image```
The product listing belongs to the user, establishing the realtionship and foreign key. A product listing can only have one payment as there will only ever be one item per listing. Each product listing must have an image attached in order to be transparent to buyers, so the has one attached realtionship is established.
When each product listing is bought, the payment must be tracked. The Payment model captures this information.
```belongs_to :user```
```belongs_to :product_listing```
The payment model also belongs to the user as well as the product listing. These forign keys establish the realtionship and enable payments to be attached to the user buying, the user selling and the product listing itself.


### R18 ###
Discuss the database relations to be implemented in your application

The order in which data tables are created is vital when working with Rails to correctly construct relationships and keep with convention. To create these connections, I will utilize foreign keys, which link one table to another. 
As the User is the central data table within my application, this model will created first. 

In order to establish the roles of each user, Rolify was implemented on the user model. This created two more data tables to enable users to be assigned roles creating a has_many_and_belongs_to relationship between users and user roles. This is done automatically with Rolify.
The next data table that needed to be created was the product listing. This model includes product details such as name and price, as well as a boolean value of 'approved' so the admin has control over the listing. To establish the relationship with the user, the foreign key was enabled using user:references as the last attribute. Each user has a has_many relationship with the product listings data table to create the ability for each user to list as many items as needed. One of the data fields that needs to be filled for the product listing is an image field. This relationship is established through the has_one_attached component.
The final table to be constructed was the payments table in order to track all sales of product listings. The model has a relationship with both the user and product listings model.
MENTION USER DETAILS/STATE AND POSTCODE ISSUES??
With thes relationships established between the data tables, the application is able to function as planned.


### R20 ###
Describe the way tasks are allocated and tracked in your project
Trello was the tool used in order to plan, allocate and track tasks throughout the construction of Luxe Ethique. I worked off dividing tasks between three boards, To Do, Pending and Done. A label system was also implemented to determine the perceived difficulty of the task and if it was essential or optional.
At the beginning, everything was added as a task to the first board 'To Do'. Each task within the column was given designated labels and ideal due or completion dates. Once I started a task, it would be moved into the 'Pending" board. If i faced any difficulty or changed the plan, comments would be made within the card. Once completed, it was marked as done and then allocated to the 'Done' board. This process was repeated with each task. When new issues and tasks became apparent, they are added to the appropriate board.
As this method has worked for me with past projects, it made the build process much easier. Trello gives a clear outline of what needs to be done, its level of importance and when it needs to be completed by.

Log
 - Wednesday 4th
    - Came up with concept, developed pitch and sent to Glen, which was     approved.
    - Started erd, develop stories and relationships between users and products.
    - Put q's into readme.md
- Thursday 5th
    - Finalised base ERD, will need user, user details, state, postcode, product listing, order, order details. Rolify will implement role model so wont need to manually generate that.
    - Compiled base list of user stories
    - Gem list includes bootstrap, devise, rolify, active admin (hopefully), simple form, cloudinary and stripe.
    - developed wireframes for landing page, admin platform and product listings.
- Friday 6th
    - created new rails app, setup postgresql database, set route route, started git repo and deployed to heroku.
    - created pages controller for all base app pages (home, about, contact, profile)
    - created user, userdetail, state, postcode and productlisting models with appropriate relationships to user.
    - implemented devise to user model which set up registration processes.
    - product listing was implemented with scaffolding, so product listing crud completed.
    - implemented gems (cloudinary, simpleform, rolify)
- Saturday 7th
    - read documentation on active admin
    - implement active admin into application in order to admin dashboard.
    - started to complete base readme.md
- Sunday 8th
    - active admin plan not working out as needed, so came up with another plan to have admin dashboard within the pages controller and to use cancancan instead. Created admin action, view and restriction to other users.
    - implemented cancancan 
- Monday 9th
    - Construct custom sign in form to obtain user details, state and postcode (nesting).
    - Difficulty doing multiple nesting so deleted state and postcode models and added them as attirubtes to user detail model.
    - Sign in form completed and registering new user details.
- Tuesday 10th
    - build order, order items models and cart controller.
    - 'cart' functioning as desired. 
- Wednesday 11th
    - implement stripe to cart.
    - this proved to waste too much time, the way i planned my cart did work with how i have used stripe previously, removed order and order items models and cart controller.
    - implemented stripe to each item rather than cart (selection of items) 
- Thursday 12th
    - build user profile page, unable to edit details at this point in time, assuming same issue with nesting and custom devise forms.
    - started about page, placeholder image and soe test about the application.
    - limit product listings on wardrobe (shop) page, build without pagination gem. 
- Friday 13th
    - move all private info to env
    - cloudianry and stripe now not functional since moving to env.
    - complete more of readme.md
    - corrected seed file to set user details of admin and test user.
- Sunday 15th
    - ammended stripe access through env and created routes for success. Attempted to change status of item when purchased, still not functioning.
    - added egaer loading to user/user details and validated and sanitized product listings.
    - created site map and first draft on questions for documnetation
- Monday 16th
    - cloudinary issue was resolved by changing ENV references with ruby tags.
    - pagination pages issue resolved by implementing will_paginate gem.
    - cancancan abilities changed for user so any user can buy a product listing.
    - payments are now tracked by a payments model and controller, the result is displayed in the admin dashboard.
- Tuesday 17th
    - tried to get the nested table working for user_details but was wasting far too much time on something i didnt know enough about, so removed this user_details model.
    - amended the user table to contain all the user details on sign up and render the email and password for log in at session.
    - still unable to edit the user profile, so also removed tha ability and just set a 'my listings' page.
    - added ability for only admin to see admin link
    - added feature that the owner of a listing can't see the buy button
- Wednesday 18th
    - Finalized slide deck and presented app
    - Realised that the approved boolean value was now not changing to false when sucess action run, so spent time on determining the issue with no result.
    - completed more content for documentation.
Please see the following screen shots for clarification.
INSERT TRELLO SCREEN SHOTS HERE
Link to trello
https://trello.com/b/uKcWVvCJ/luxe-ethique

REFERENCES
https://guides.rubyonrails.org/active_record_basics.html
https://formspree.io/