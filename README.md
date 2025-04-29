# Fish Shell Configuration

![Made with Fish Shell](https://img.shields.io/badge/Made%20with-Fish%20Shell-4C91F0?logo=fishshell&logoColor=white)
![Plugin Manager: Fisher](https://img.shields.io/badge/Plugin%20Manager-Fisher-00ACC1)
![Prompt: Starship](https://img.shields.io/badge/Prompt-Starship-7D4CDB)
![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)
![Config only](https://img.shields.io/badge/Configuration-Personal-informational)

This repository contains my personal [Fish shell](https://fishshell.com/) configuration.

It uses:
- [Fisher](https://github.com/jorgebucaran/fisher) as the plugin manager
- [Starship](https://starship.rs/) as the prompt

## Purpose

This setup is tailored to my workflow and preferences. It's made public for reference and inspiration purposes. Feel free to **fork** and **customize** it for your own needs!

> **Note:** I do not accept contributions to this repository, as it is intended for personal use.

## Installation

If you'd like to use or adapt this configuration:

1. Install Fish shell:  
   [Installation instructions](https://fishshell.com/docs/current/index.html#installation)

2. Install Fisher:

    ```fish
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    ```

3. Clone this repository and link or copy the configuration files into your `$HOME/.config/fish/` directory.

4. Install plugins listed in the `fish_plugins` file:

    ```fish
    fisher update
    ```

5. Install [Starship](https://starship.rs/):

    ```bash
    curl -sS https://starship.rs/install.sh | sh
    ```
6. As an optional step you can use my [Starship configuration](https://github.com/MikePapaSierra/starship).

## Structure

- `config.fish` — main configuration file
- `functions/` — custom functions
- `completions/` — completions
- `fish_plugins` — list of Fisher-managed plugins

## Related

- [Starship Configuration](https://github.com/MikePapaSierra/starship)

## License

This project is shared under the [MIT License](LICENSE), but primarily for reference. Fork freely!
