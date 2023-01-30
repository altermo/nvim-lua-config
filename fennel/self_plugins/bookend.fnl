(local M {})
(tset M :bookmarks {})
(fn getfloatwinopt []
  (let [
        width (math.floor (* vim.o.columns 0.5))
        height (math.floor (* vim.o.lines 0.5))
        ]
    {
    :relative "win"
    :width width
    :height height
    :col (math.floor (/ (- vim.o.columns width) 2))
    :row (math.floor (/ (- vim.o.lines height) 2))
    :style "minimal"
    }
    )
  )
(fn M.goto_file []
  (let [buf (vim.api.nvim_create_buf true true)
            win (vim.api.nvim_open_win buf false (getfloatwinopt))
            ]
    (vim.api.nvim_buf_set_lines buf 0 -1 false
                                (icollect [k v (pairs M.bookmarks)]
                                  (.. k " : " v)
                                  ))
    (vim.cmd.redraw)
    (match (vim.fn.getcharstr)
      " " (M.add_file (vim.fn.getcharstr))
      "\x80kb" (tset M.bookmarks (vim.fn.getcharstr) nil)
      "" nil
      char (vim.cmd.edit (. M.bookmarks char))
      )
    (vim.api.nvim_win_close win false)
    (vim.api.nvim_buf_delete buf {})
    )
  )
(fn M.add_file [char]
  (let [file (vim.fn.expand "%:p")]
    (tset M.bookmarks char file)
    ))
M
