{self, ...}: {
  programs.nixvim.keymaps = [
    {
      action = "<cmd>NvimTreeToggle<CR>";
      key = "<C-n>";
      mode = "n";
    }
    {
      action = "<cmd>NvimTreeFocus<CR>";
      key = "<leader>e";
      mode = "n";
    }
    {
      action = "gcc";
      key = "<leader>/";
      mode = "n";
      options = {
        remap = true;
      };
    }
    {
      action = "gc";
      key = "<leader>/";
      mode = "v";
      options = {
        remap = true;
      };
    }
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fw";
      mode = "n";
    }
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
      mode = "n";
    }
    {
      action = "<cmd>Telescope git_commits<CR>";
      key = "<leader>fg";
      mode = "n";
    }
    {
      action = "<cmd>Telescope oldfiles<CR>";
      key = "<leader>fh";
      mode = "n";
    }
    {
      action = "<cmd>Telescope colorscheme<CR>";
      key = "<leader>ch";
      mode = "n";
    }
    {
      action = "<cmd>Telescope man_pages<CR>";
      key = "<leader>fm";
      mode = "n";
    }

    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferPrevious<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>BufferClose<cr>";
      options = {
        desc = "Close Buffer";
      };
    }

    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        desc = "switch window left";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        desc = "switch window right";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        desc = "switch window down";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        desc = "switch window up";
      };
    }
    {
      mode = "t";
      key = "<C-x>";
      action = "<C-\\><C-N>";
      options = {
        desc = "switch window up";
      };
    }
    {
      mode = "n";
      key = "<leader>h";
      action = "<cmd>ToggleTerm<cr>";
      options = {
        desc = "open terminal";
      };
    }
    {
      mode = "v";
      key = "y";
      action = "<Leader>\"+y";
      options = {
        desc = "yank/copy selected";
      };
    }
    {
      mode = "n";
      key = "<leader>fm";
      action = ''        function()
        				  format { lsp_fallback = true }
        				end'';
      options = {
        desc = "yank/copy selected";
      };
    }

    {
      mode = ["n" "v"];
      key = "<leader>cf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }

    {
      mode = ["n" "v"];
      key = "<leader>cm";
      action = ''
        function()
          require("conform").format { async = true, lsp_fallback = true }
        end
      '';
      options = {
        desc = "Format with Conform";
      };
    }

    {
      mode = "t";
      key = "<ESC>";
      action = "<C-\\><C-N>";
      options = {
        desc = "Exit Terminal Mode";
      };
    }

    {
      mode = "n";
      key = "<leader>n";
      action = "<cmd>set nu!<CR>";
      options = {
        desc = "Toggle line number";
      };
    }

    {
      mode = "n";
      key = "<leader>rn";
      action = "<cmd>set rnu!<CR>";
      options = {
        desc = "Toggle relative number";
      };
    }
  ];
}
