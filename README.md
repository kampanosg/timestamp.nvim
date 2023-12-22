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

### Writing the current timestamp using lua datetime formats

This example uses the `lua require("timestamp").gen_fts()` function

https://github.com/kampanosg/timestamp.nvim/assets/30287348/0ed571ad-ab92-454b-8fe1-2c7a13eec768

## API
The plugin provides the following functions. You can map those to handy keymaps

| function                    | description                                                                | mode |
| --------------------------- | -------------------------------------------------------------------------- | ---- |
| `timestamp.setup()`         | setup function that allows for the defaults to be overwritten              | -    |
| `timestamp.gen_fixed_fts()` | writes a fixed `datetime` to the buffer based on the lua format provided     | `v`  |
| `timestamp.gen_fts()`       | writes the current `datetime` to the buffer based on the lua format provided | `v`  |
| `timestamp.gen_fixed_ts()`  | writes a fixed `datetime` to the buffer based on the default format          | -    |
| `timestamp.gen_ts()`        | writes the current `datetime` to the buffer based on the default format      | -    |

### Available Formatting

The table below, lists the available formats that the plugin accepts. For a more in-depth look at Lua `datetimes`, have a look [here](https://www.lua.org/pil/22.1.html).

| format | description                                |
| ------ | ------------------------------------------ |
| `%a`   | abbreviated weekday name (e.g., `Wed`)     |
| `%A`   | full weekday name (e.g., `Wednesday`)      |
| `%b`   | abbreviated month name (e.g., `Sep`)       |
| `%B`   | full month name (e.g., `September`)        |
| `%c`   | date and time (e.g., `09/16/98 23:48:10`)  |
| `%d`   | day of the month (`16`) [01-31]            |
| `%H`   | hour, using a 24-hour clock (`23`) [00-23] |
| `%I`   | hour, using a 12-hour clock (`11`) [01-12] |
| `%M`   | minute (`48`) [00-59]                      |
| `%m`   | month (`09`) [01-12]                       |
| `%p`   | either `"am"` or `"pm"` (`pm`)             |
| `%S`   | second (`10`) [00-61]                      |
| `%w`   | weekday (`3`) [0-6 = Sunday-Saturday]      |
| `%x`   | date (e.g., `09/16/98`)                    |
| `%X`   | time (e.g., `23:48:10`)                    |
| `%Y`   | full year (`1998`)                         |
| `%y`   | two-digit year (`98`) [00-99]              |
| `%%`   | the character \``%`´                       |

## Documentation

Check out the `vimdocs` for `timestamp.nvim` by doing `:help timestamp.nvim`
