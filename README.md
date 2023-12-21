# ⏰ timestamp.nvim

A Neovim plugin that helps you generate static and current timestamps. You can use the default format or define your own. Additionally, the plugin can read a lua-supported datetime format and generate a timestamp based on that.

## Installation

You can install this plugin using your favourite plugin manager. For example, with Lazy:

```lua
{
    'kampanosg/timestamp.nvim'
}
```

The plugin comes with a `setup` function, that allows you to overwrite the defaults:

```lua
{
    'kampanosg/timestamp.nvim',
    config = function ()
        require('timestamp').setup({ -- These are the default values
            fixed_time =  os.time {
                year = 2023,
                month = 12,
                day = 1,
                hour = 9,
                min = 30,
                sec = 0,
            },
            format = '%Y-%m-%dT%H:%M:%S',
        })
    end,
    keys = { -- Probably not the best keymap, but good enough for demo purposes :) 
        { '<leader>,,,', '<cmd>lua require("timestamp").gen_static_ts()<cr>', desc = 'generates a static timestamp with the default formatting' },
    }
}
```

## Demo

### Writing the current datetime

This example uses the `lua require("timestamp").gen_static_ts()` function

https://github.com/kampanosg/timestamp.nvim/assets/30287348/cc4460a8-6a6e-4f9a-bfc7-e10bed5eabaa



### Writing the static timestamp using lua datetime formats

## API

### Available Formatting

## Documentation

Check out the `vimdocs` for `timestamp.nvim` by doing `:help timestamp.nvim`
