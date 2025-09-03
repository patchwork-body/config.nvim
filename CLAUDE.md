# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Kickstart.nvim configuration - a well-documented, single-file Neovim configuration that serves as a starting point for personal customization. It's based on the popular kickstart.nvim project and uses lazy.nvim for plugin management.

## Core Architecture

### Configuration Structure
- **Single-file configuration**: Main configuration is in `init.lua` with modular plugin loading
- **Plugin management**: Uses lazy.nvim for package management and lazy loading
- **Modular plugins**: Optional plugins in `lua/kickstart/plugins/` and custom plugins in `lua/custom/plugins/`
- **LSP integration**: Comprehensive LSP setup with Mason for automatic server installation

### Key Components
- **init.lua**: Main configuration file (lines 1-1009) containing all core settings, keymaps, and plugin configurations
- **Lazy.nvim**: Plugin manager that handles installation, loading, and updates
- **Mason**: LSP server and tool installer that manages language servers, formatters, and linters
- **Telescope**: Fuzzy finder for files, buffers, help tags, and more
- **Blink.cmp**: Modern completion engine (recently switched from nvim-cmp)
- **Treesitter**: Syntax highlighting and code understanding
- **LSP Config**: Language server protocol integration for code intelligence

## Plugin Management Commands

### Essential Lazy.nvim Commands
- `:Lazy` - Open plugin manager interface
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Clean, install, and update plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy profile` - Profile plugin startup times

### Mason Commands
- `:Mason` - Open Mason installer interface
- `:MasonUpdate` - Update Mason registry
- `:MasonInstall <server>` - Install specific LSP server/tool
- `:MasonUninstall <server>` - Remove LSP server/tool

## Key Configuration Patterns

### Plugin Installation
**Recommended approach**: Add custom plugins to `lua/custom/plugins/init.lua` or separate files in that directory. This is the kickstart.nvim recommended pattern for modular plugin management.

To enable custom plugins:
1. Uncomment `{ import = 'custom.plugins' }` in init.lua (around line 1201)
2. Add plugins to `lua/custom/plugins/init.lua` or create separate files in that directory

**Direct installation** (less recommended): Plugins can also be added directly in the lazy.setup() call in init.lua:240-985. Patterns:
- Simple: `'owner/repo'` for basic plugins
- Configured: `{ 'owner/repo', opts = {} }` for plugins needing setup
- Complex: `{ 'owner/repo', config = function() ... end }` for custom configuration

### LSP Server Configuration
LSP servers are configured in the `servers` table (init.lua:665-693). Add new language servers here and they'll be automatically installed via Mason.

### Key Mappings
- Leader key: `<space>`
- Telescope: `<leader>s*` mappings for search functions
- LSP: `gr*` mappings following Neovim 0.11+ conventions
- Window navigation: `<C-hjkl>` for moving between splits

## Development Workflow

### Health Checks
- `:checkhealth` - Run all health checks
- `:checkhealth kickstart` - Check kickstart-specific requirements
- Kickstart health checks verify git, make, unzip, and ripgrep availability

### Plugin Development
- Add custom plugins to `lua/custom/plugins/init.lua` or create separate files in that directory
- Kickstart plugins (optional) are in `lua/kickstart/plugins/`
- Use `:Lazy reload <plugin>` to reload plugin configuration during development

### Configuration Modification
- Main config changes go in `init.lua`
- Modular approach: Break out complex configurations into separate files in `lua/custom/`
- Follow the established patterns for plugin configuration and key mappings

## External Dependencies

Required tools (checked by `:checkhealth kickstart`):
- `git` - Version control
- `make` - Build tool for native plugins
- `unzip` - Archive extraction
- `rg` (ripgrep) - Fast text search
- C compiler (gcc/clang) - For building native dependencies
- Clipboard tool (platform-dependent) - For system clipboard integration

Optional but recommended:
- Nerd Font - Enable by setting `vim.g.have_nerd_font = true` in init.lua:94
- Language-specific tools (npm for TypeScript, go for Golang, etc.)

## Maintenance Notes

- Lock file: `lazy-lock.json` tracks exact plugin versions (consider tracking in git)
- Updates: Use `:Lazy update` regularly, but test after major updates
- LSP servers: Mason handles installation; servers configured in init.lua:665-693
- Formatters: Conform.nvim handles formatting with tool installation via Mason