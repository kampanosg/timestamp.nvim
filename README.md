# :clock: timestamp.nvim

A Neovim plugin that helps you generate static and current timestamps. You can use the default format or define your own. Additionally, the plugin can read a lua-supported datetime format and generate a timestamp based on that.

## Installation

You can install this plugin using your favourite plugin manager. For example, with Lazy:

```lua
    {
        'kampanosg/timestamp.nvim'
    }
```

The plugin comes with a `setup` function, that allows for the defaults to be overwritten:

```lua
    {
        'kampanosg/timestamp.nvim',
        config = function ()
            require('timestamp').setup({ -- These are the default values
                current_time = os.date,
                format = '%Y-%m-%dT%H:%M:%S',
            })
        end
    }
```

## Demo

### Inserting the current timestamp in a test

This example uses the `timestamp.` function


### Writing the static timestamp using lua datetime formats

## API

### Available Formatting

## Documentation

Check out the `vimdocs` for `timestamp.nvim` by doing `:help timestamp.nvim`
