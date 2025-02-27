# My nvim config setup guide

## Install nvim

You'll firstly need to install neovim onto your computer. Full instructions on the various ways to do that can be found [here](https://github.com/neovim/neovim/blob/master/INSTALL.md). But I use a mac and install with homebrew.

```bash
brew install nvim
```

## Clone this repo

Next you will clone this repo onto your machine by running the following command.

```
git clone git@github.com:iamtomjones/nvim-with-lazy-package-manager.git ~/.config/nvim/
```

## Lazy.nvim package manager

This config is using lazy.nvim as the package manager and follows the [structured setup](https://lazy.folke.io/installation).

## Get started

Open neovim in your terminal and Lazyvim will install the plugins I like to use.

## Plugins

For information on the plugins being used, visit the github repos for each of them to find the documentation.

## Why not just use [LazyVim](https://www.lazyvim.org/) or another nvim distro

Good question. LazyVim is great but comes with more than I like to use, and so do other distros. In my previous nvim configuration I was using [Packer](https://github.com/wbthomason/packer.nvim) as the package manager and had curated a nice group of plugins. I don't really like too many bells and whistles. I used that same config for a couple of years, but Packer isn't maintained anymore and lazy.nvim is a pretty good replacement.

This way I get the benefits of lazy.nvim but without all the extra bits I'm not keen on. With that said, I did test it out and there were a few plugins that I liked and actually replaced some of my old ones with.
