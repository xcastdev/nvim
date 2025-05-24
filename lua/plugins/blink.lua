return {
  'saghen/blink.cmp',

  dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },

  version = '1.*',

  opts = {
    keymap = { preset = 'enter' },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      -- nvim-cmp style menu
      menu = {
        draw = {
          columns = {
            { 'label', 'label_description', gap = 1 },
            { 'kind_icon', 'kind' },
          },
        },
      },
      -- Only show the documentation popup when manually triggered
      { auto_show = true, auto_show_delay_ms = 500 },
    },

    snippets = {
      preset = 'luasnip',
      expand = function(snippet)
        require('luasnip').lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction)
        require('luasnip').jump(direction)
      end,
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
      },
    },

    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}

-- https://github.com/rafamadriz/friendly-snippets/tree/main/snippets

-- [OLD CMP MAPPINGS]
-- mapping = cmp.mapping.preset.insert({
-- 	-- Select the [n]ext item
-- 	["<C-n>"] = cmp.mapping.select_next_item(),
-- 	-- Select the [p]revious item
-- 	["<C-p>"] = cmp.mapping.select_prev_item(),
--
-- 	-- Scroll the documentation window [b]ack / [f]orward
-- 	["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 	["<C-f>"] = cmp.mapping.scroll_docs(4),
--
-- 	-- Accept ([y]es) the completion.
-- 	--  This will auto-import if your LSP supports it.
-- 	--  This will expand snippets if the LSP sent a snippet.
-- 	["<CR>"] = cmp.mapping.confirm({ select = true }),
--
-- 	-- Manually trigger a completion from nvim-cmp.
-- 	--  Generally you don't need this, because nvim-cmp will display
-- 	--  completions whenever it has completion options available.
-- 	["<C-CR>"] = cmp.mapping.complete({}),
--
-- 	-- Think of <c-l> as moving to the right of your snippet expansion.
-- 	--  So if you have a snippet that's like:
-- 	--  function $name($args)
-- 	--    $body
-- 	--  end
-- 	--
-- 	-- <c-l> will move you to the right of each of the expansion locations.
-- 	-- <c-h> is similar, except moving you backwards.
-- 	["<C-l>"] = cmp.mapping(function()
-- 		if luasnip.expand_or_locally_jumpable() then
-- 			luasnip.expand_or_jump()
-- 		end
-- 	end, { "i", "s" }),
-- 	["<C-h>"] = cmp.mapping(function()
-- 		if luasnip.locally_jumpable(-1) then
-- 			luasnip.jump(-1)
-- 		end
-- 	end, { "i", "s" }),
