(local M (require "a"))
(fn func [] ;TODO
  (let [
        start (M.findbefore "'")
        end (M.findafter "'")]
      (M.replace "'" "\"" start end)
      (M.replace "\"" "'" start end)
    )
  )
