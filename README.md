# URL Shortener

## Development
1. `bundle install`
1. Create a database by running `psql -d postgres -f scripts/create_database.sql`
1. `rerun rackup`
    * running rerun will reload app when file changes are detected
1. Run tests using `rspec spec`.