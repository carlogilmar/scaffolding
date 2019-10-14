# Scaffolding

Don't waste your time!

This project is for help you to generate the **phoenix controllers** and also **live views** too!

## Installation

```elixir
def deps do
  [
    {:scaffolding, "~> 0.1.0", only: [:dev]}
  ]
end
```

## How to use

### Create a phoenix controller

> mix create_controller page1

This will generate the follow output:

```
 :: Scaffolding Generator Done! ::

 Please update your router.ex file adding the follow line:

 >>> get "/page1", Page1Controller, :index
```

This command will create many files:

1. The phoenix controller: `lib/your_app_web/controllers/page1_controller.ex`
2. The eex template folder with index file: `lib/your_app_web/templates/page1/`
3. The view for your controller: `lib/your_app_web/views/page1_view.ex`

You will have to update you `router.ex` file for use your controller generated.

### Create a Phoenix Live View

*You need your Live View setup for implement this.*

> mix create_live_view page1

This will generate the follow output:

```
 :: Scaffolding Generator Done! ::

 Please update your router.ex file adding the follow line:

 >>> live "/page1", Page1Live
```

This command will create many files:

1. The live view: `lib/your_app_web/live/page1_live.ex`
2. The leex template: `lib/your_app_web/templates/page1/`
3. The view: `lib/your_app_web/views/page1_view.ex`

You will have to update you `router.ex` file for use your controller generated.
