# Fun Testing Four

Fun Testing Four is a Ruby on Rails application with a Vue.js frontend, designed for managing features, scenarios, steps, squads, and reports. It leverages modern Rails conventions and integrates Tailwind CSS for styling.

## Features

- API-driven backend with controllers for features, scenarios, steps, squads, users, and reports
- Vue.js SPA frontend (in `app/javascript`)
- Tailwind CSS for modern UI styling
- Webpacker for JavaScript and asset management
- Secure authentication (see `lib/json_web_token.rb`)
- Modular service objects for business logic
- Background jobs and mailers

## Project Structure

- `app/models/` — ActiveRecord models (Feature, Scenario, Step, Squad, User, Report)
- `app/controllers/` — API and application controllers
- `app/javascript/` — Vue.js frontend (components, pages, router, store)
- `app/services/` — Service objects for business logic
- `config/` — Rails configuration, routes, credentials, environments
- `db/` — Migrations, schema, seeds
- `test/` — Unit and integration tests

## Setup

1. **Install dependencies:**

```sh
bundle install
yarn install
```

2. **Setup database:**

```sh
rails db:setup
```

3. **Run the server:**

```sh
rails server
```

4. **Run the frontend (if using separate dev server):**

```sh
./bin/webpack-dev-server
```

## Development

- **Backend:** Ruby 2.7+ (or compatible), Rails 6+
- **Frontend:** Vue.js (via Webpacker), Tailwind CSS
- **Testing:** Rails test framework (see `test/`)

## Security & Best Practices

- Sensitive credentials are encrypted (`config/credentials.yml.enc`)
- Follows secure coding practices (input validation, parameterized queries, secure session management)
- No sensitive data in client storage

## License

MIT License. See `LICENSE` file if present.
