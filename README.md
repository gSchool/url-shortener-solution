# URL Shortener

## Development
1. `bundle install`
1. Create a database by running `psql -d postgres -f scripts/create_database.sql`
1. Run the migrations in the development database using `sequel -m migrations postgres://gschool_user:password@localhost/url_shortener_development`
1. Run the migrations in the test database using `sequel -m migrations postgres://gschool_user:password@localhost/url_shortener_test`
1. `rerun rackup`
    * running rerun will reload app when file changes are detected
1. Run tests using `rspec spec`.

## Migrations on Heroku

To run the migrations on heroku, run `heroku run 'sequel -m migrations $HEROKU_POSTGRESQL_TEAL_URL' --app gschool-url-shortener-staging`
or `heroku run 'sequel -m migrations $HEROKU_POSTGRESQL_AQUA_URL' --app gschool-url-shortener-prod`