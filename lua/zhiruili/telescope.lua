local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = " >",
    color_devicons = true,

    file_previewer   = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer   = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-l>"] = actions.send_to_qflist,
      },
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
   }
}

require("telescope").load_extension("fzy_native")

local M = {}

M.search_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = "< VimRC >",
    cwd = "$HOME/.config/nvim/",
  })
end

M.search_notes = function()
  require("telescope.builtin").find_files({
    prompt_title = "< Notes >",
    cwd = "$HOME/OneDrive/notes/",
  })
end

M.current_dir_browser = function()
  require("telescope.builtin").file_browser({
    prompt_title = "< Current Dir >",
    cwd = vim.fn.expand("%:p:h"),
  })
end

M.search_current_project = function()
  require("telescope.builtin").find_files({
    prompt_title = "< Current Project >",
  })
end

M.search_all_projects = function()
  require("telescope.builtin").find_files({
    prompt_title = "< All Projects >",
    cwd = "$HOME/projects/",
  })
end

return M

