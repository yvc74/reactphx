# GW DispatchBoard
(https://github.com/elixir-lang/elixir), [Phoenix Framework](https://github.com/phoenixframework/phoenix), [React](https://github.com/facebook/react) and [Redux](https://github.com/reactjs/redux).


## Installation instructions
To start your DispatchBoard app:

  1. Install dependencies with `mix deps.get`
  2. CD into `cd /assets` directory
  3. Install npm packages with `npm install`
  4. CD up one directory `cd ..`
  5. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  6. Run seeds to create demo user with `mix run priv/repo/seeds.exs`
  7. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

