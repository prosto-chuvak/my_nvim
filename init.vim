:set number
:set autoindent
:set tabstop=3
:set shiftwidth=3
:set smarttab                                     :set softtabstop=3
:set noswapfile                                   :set mouse=a

call plug#begin()                                                                                   "Plug 'https://github.com/vim-airline/vim-airline'                                                  Plug 'nvim-lualine/lualine.nvim'

"Plug 'https://github.com/vim-airline/vim-airline'

Plug 'nvim-lualine/lualine.nvim'
  
Plug 'nvim-tree/nvim-web-devicons'                                                                  Plug 'https://github.com/preservim/nerdtree'

Plug 'nvim-neo-tree/neo-tree.nvim'

Plug 'nvim-lua/plenary.nvim'

Plug 'MunifTanjim/nui.nvim'


Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorsc>
Plug 'https://github.com/ryanoasis/vim-devicons'  Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/terryma/vim-multiple-cur>Plug 'https://github.com/preservim/tagbar'

"Plug 'https://github.com/neoclide/coc.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':>
Plug 'windwp/nvim-autopairs'



Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

nmap <F8> :TagbarToggle<CR>

source ~/.local/share/nvim/plugged/awesome-vim-co>


call plug#end()

lua <<EOF

require("nvim-autopairs").setup {}

require('lualine').setup()


  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet en>
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- F>
        -- require('luasnip').lsp_expand(args.bod>
        -- require('snippy').expand_snippet(args.>
        -- vim.fn["UltiSnips#Anon"](args.body) -->
        -- vim.snippet.expand(args.body) -- For n>
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(>
      -- documentation = cmp.config.window.border>
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = t>
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip use>
      -- { name = 'ultisnips' }, -- For ultisnips>
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin pe>
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({     
  { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]--

  -- Use buffer source for `/` and `?` (if you en>
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you en>
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matchi>
               })
  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').de>
  -- Replace <YOUR_LSP_SERVER> with each lsp serv>
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
EOF

"nmap <C-o> :NERDTree<CR>"
nmap <C-o> :Neotree<CR>
"nmap <C-q> :NERDTreeToggle<CR>"
nmap <C-q> :Neotree toggle<CR>

nmap <C-k> :Commentary<CR>

nmap <C-s> :w<CR>
nmap <C-x> :wq<CR>
nmap <C-f> :q<CR>

nmap <C-p> :PlugInstall<CR>
