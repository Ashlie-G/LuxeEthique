## T2A2 Luxe Ethique ##

### R7 ###
* Identification of the problem you are trying to solve by building this particular marketplace app. *

As a vegan who loves luxury handbags, I and many others struggle with our morals and ethics towards purchasing these items as they are made from animal products. I aim to create a trustworthy application that facilitates the listing and purchasing of authentic pre-loved luxury handbags.

### R8 ###
* Why is it a problem that needs solving? *

As more people are trying to be more conscious about their buying choices, there needs to be a platform that can facilitate and encourage this. I hope to build a trustworthy platform that can encourage ethical buying.

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
Luxe Ethique enables any visitor to the application to view the current approved listings aka the 'Wardrobe'. They are presented with a set amount of items displayed per page, and are able to navigate to the next or previous pages. If the visitor wants to know more about the item or purchase, they will need to sign up. The application has a fully functional user registration system that asks for email, password, contact number and address.
If the visitor is a user, they can sign into their account with their email and password. Once signed in, they are able to access their user profile which allows them to see their current listings(if any) and edit their information. A user can browse the current listings, view particular listings and purchase. If the listing belongs to the user, it will state it within the listing and they will be able to edit or destroy it. Users can also create a new listing by completing the form and uploading images of the product as well as its authenticity. Once all the appropriate fields have been entered and the listing has been submitted, the user awaits for the admin approval before it appears on the site.
The admin user has access to everything in the app from the admin dashboard. The dashboard features all the active listings and users. From here, the admin user is able to view submitted listings and once product authenticity is confirmed, the admin user can approve it. Once the product listing is approved, it is featured in the shop.
The application features an 'About' and 'Contact' page which provides visitors with background information on what the application is about, and an avenue for them to contact the admin user with enquiries.

- Sitemap
insert sitemap png here
- Screenshots
insert screen shots here
- Target audience
The target audience for the application is anyone wanting to make more concious decisions about their buying habits when it comes to luxury items. Primarily people who have chosen and plantbased or vegan style, however with the current climate, more people are looking for ethical alternatives.
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
- Cloudify
Payment System
- Stripe
Deployment
- Heroku

### R12 ###
User stories for Luxe Ethique
- Visitors to the application can view the 'Wardrobe' (current listings).
- Visitors can view the 'About Us' page.
- Visitors can view the 'Contact' page and submit and enquiry email.
- If visitors would like to get more detail about a product, they will need to sign up to become a user.
- Visitors are able to sign up with a form submitting their email, password, contact number and address.
- Users can create a profile with name address and phone number to attach their details to their account.
- Users can update their profile and view their current listings.
- Users can browse the wardrobe of luxury handbags for sale and purchase knowing it is an authentic product.
- Users can submit their authentic handbags that they wish to sell with images.
- Users can edit their approved listings.
- Administrators can view and approve listing pending for sale.
- Administrators can edit or destroy any listing.
- Administrators can view all current listings and all users.


### R13 ###
Wireframes for your app
### R14 ###
An ERD for your app
### R15 ###
Explain the different high-level components (abstractions) in your app
active record - mvc
postgresql

### R16 ###
Detail any third party services that your app will use
In terms of involvement from third party applications, Luxe Ethique utilizes Cloudify for image hosting, Stripe for payment systems and Heroku for deployment. 

### R17 ###
Describe your projects models in terms of the relationships (active record associations) they have with each other
The User model is the central model that has relationships to the other models within the application.
User
```has_one :user_detail, dependent: :destroy```
```has_many :product_listings, dependent: :destroy```
```accepts_nested_attributes_for :user_details```
The UserDetail model contains all the details for each user, their name, address and contact number.
UserDetail
```belongs_to :user```
The ProductListing model is responsible for the manage of each product listed by a user within the application.
ProductListing
```belongs_to :user```
```has_one_attached :image```
Rolify creates its own models based around the user model. It creates a role model that creates a joining table to user roles. It belongs to the resource that it was created off, in this case the User model.
Role
```has_and_belongs_to_many :users, :join_table => :users_roles```


### R18 ###
Discuss the database relations to be implemented in your application

### R19 ###
Provide your database schema design

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
- Wednesday 12th
    - implement stripe to cart.
    - this proved to waste too much time, the way i planned my cart did work with how i have used stripe previously, removed order and order items models and cart controller.
    - implemented stripe to each item rather than cart (selection of items) 
- Thursday 13th
    - build user profile page, unable to edit details at this point in time, assuming same issue with nesting and custom devise forms.
    - started about page, placeholder image and soe test about the application.
    - limit product listings on wardrobe (shop) page, build without pagination gem. 
- Friday 14th
    - move all private info to env
    - cloudianry and stripe now not functional since moving to env.
    - complete more of readme.md
    - corrected seed file to set user details of admin and test user. 
Please see the following screen shots for clarification.
INSERT TRELLO SCREEN SHOTS HERE
Link to trello
https://trello.com/b/uKcWVvCJ/luxe-ethique