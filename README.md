# Inception

## Preview

This project involves setting up a small infrastructure composed of different services (NGINX, WordPress, MySQL) under specific rules using Docker and Docker Compose.

## Environment

To set up and start container you have to set the environment first. To do this you need to create ```.env``` file in the ```srcs``` folder and add there following variables:

```
DB_NAME=xxxxxx                        # Name of the MySQL database to be used
DB_HOST=xxxxxx                        # Host address of the MySQL database server
MYSQL_ROOT_PASSWORD=xxxxxx            # Root password for accessing the MySQL database
DB_USER=xxxxxx                        # Username for connecting to the MySQL database
DB_PASS=xxxxxx                        # Password for the specified database user

WP_URL=xxxxxx                         # URL of the WordPress site
WP_TITLE=xxxxxx                       # Title of the WordPress site
WP_ADMIN_USER=xxxxxx                  # Username for the WordPress admin account
WP_ADMIN_PASS=xxxxxx                  # Password for the WordPress admin account
WP_ADMIN_EMAIL=xxxxxx                 # Email address associated with the WordPress admin account
WP_AUTHOR_USER=xxxxxx                 # Username for the author account in WordPress
WP_AUTHOR_EMAIL=xxxxxx                # Email address associated with the author account
WP_AUTHOR_PASS=xxxxxx                 # Password for the author account in WordPress

MAX_PINGS=10                          # Maximum number of mySQL pings to be sent before Wordpress setup start
WP_THEME=xxxxxx                       # WordPress theme to be used for the site
USER=xxxxxx                           # Login of the user (specifically for domain and volumes setup)
```

## Run

To build the network with containers, set them up and run use command ```make```
To stop the container use ```make down```
To start them again without building run ```make up```
To remove all containers, volumes and created folders use ```make fclean```

##
Made by dnikifor: dnikifor@student.hive.fi | LinkedIn: [dnikifor](https://www.linkedin.com/in/dmitriinikiforov/) | Tableau: [dmitriinikiforov](https://public.tableau.com/app/profile/nikiforov.dmitrii/vizzes)
