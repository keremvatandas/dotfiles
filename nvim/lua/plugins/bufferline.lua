-----------------------------------------------------------
-- Tabline configuration file
-----------------------------------------------------------

-- Plugin: bufferline and bufdelete

-- https://github.com/akinsho/bufferline.nvim
-- https://github.com/famiu/bufdelete.nvim

require('bufferline').setup {
    options = {
        close_command = "BufDel! %d",
        right_mouse_command = "BufDel! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or " " )
                s = s .. n .. sym
            end
            return s
        end,
        offsets = {{
            filetype = "NvimTree",
            text = " File Explorer",
            highlight = 'Directory',
            text_align = "center",
            padding = 1
        }},
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = 'slant',
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        sort_by = 'id',

        custom_areas = {
            right = function()
                local result = {}
                local error = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
                local warning = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
                local info = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
                local hint = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

                if error ~= 0 then
                    table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
                end

                if warning ~= 0 then
                    table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
                end

                if hint ~= 0 then
                    table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
                end

                if info ~= 0 then
                    table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
                end
                return result
            end,
        }

    },
}


