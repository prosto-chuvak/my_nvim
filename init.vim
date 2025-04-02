:set number
:set autoindent
:set tabstop=3
:set shiftwidth=3
:set smarttab                                 
:set softtabstop=3
:set noswapfile                              
:set mouse=a
:set clipboard+=unnamedplus

call plug#begin()                            
Plug 'https://github.com/nvim-lualine/lualine.nvim'
Plug 'https://github.com/nvim-tree/nvim-web-devicons'
Plug 'preservim/nerdtree'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/MunifTanjim/nui.nvim'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/ryanoasis/vim-devicons'  
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'https://github.com/windwp/nvim-autopairs'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'
Plug 'https://github.com/hrsh7th/cmp-buffer'
Plug 'https://github.com/hrsh7th/cmp-path'
Plug 'https://github.com/hrsh7th/cmp-cmdline'
Plug 'https://github.com/hrsh7th/nvim-cmp'
Plug 'https://github.com/hrsh7th/cmp-vsnip'
Plug 'https://github.com/hrsh7th/vim-vsnip'

source ~/.local/share/nvim/plugged/awesome-vim-colorschemes/colors/gruvbox.vim

call plug#end()

nmap <C-o> :NERDTree<CR>                      
nmap <C-q> :NERDTreeToggle<CR>                                                            
nmap <C-k> :Commentary<CR>                   
nmap <C-s> :w<CR> 
imap <C-s> <Esc>:w<CR>                            
nmap <C-x> :wq<CR> 
imap <C-x> <Esc>:wq<CR>                           
nmap <C-f> :q<CR>                             
nmap <C-p> :PlugInstall<CR>
nmap <C-a> :terminal<CR> i

lua <<EOF

require("nvim-autopairs").setup {}

require('lualine').setup()

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) 
      end,
    },
    window = {},
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, 
      } , {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
EOF
