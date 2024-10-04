# miniRT

## Environment

To set up and start container you have to set the environment first. To do this you need to create ```.env``` file in the ```srcs``` folder and add there following variables:

```
DB_NAME=mysql_database_name           # Name_of_the_MySQL_database_to_be_used.
DB_HOST=mysql_database_host           # Host_address_of_the_MySQL_database_server.
MYSQL_ROOT_PASSWORD=mysql_root_pass   # Root_password_for_accessing_the_MySQL_database.
DB_USER=database_user_                # Username_for_connecting_to_the_MySQL_database.
DB_PASS=xxxxxx                        # Password_for_the_specified_database_user.

WP_URL=xxxxxx                         # URL_of_the_WordPress_site.
WP_TITLE=xxxxxx                       # Title_of_the_WordPress_site.
WP_ADMIN_USER=xxxxxx                  # Username_for_the_WordPress_admin_account.
WP_ADMIN_PASS=xxxxxx                  # Password_for_the_WordPress_admin_account.
WP_ADMIN_EMAIL=xxxxxx                 # Email_address_associated_with_the_WordPress_admin_account.
WP_AUTHOR_USER=xxxxxx                 # Username_for_the_author_account_in_WordPress.
WP_AUTHOR_EMAIL=xxxxxx                # Email_address_associated_with_the_author_account.
WP_AUTHOR_PASS=xxxxxx                 # Password_for_the_author_account_in_WordPress.

MAX_PINGS=10                          # Maximum_number_of_pings_to_be_sent.
WP_THEME=xxxxxx                       # WordPress_theme_to_be_used_for_the_site.
USER=xxxxxx                           # Username_of_the_user_involved_in_the_project_or_configuration.
```
