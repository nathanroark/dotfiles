local C = require("astronvim.utils.status.env").fallback_colors

return { -- this table overrides highlights in all themes
  -- Config for transparent bg
  Normal = { bg = C.none },
  NormalNC = { bg = C.none },
  CursorColumn = { bg = C.none },
  CursorLine = { bg = C.none },
  CursorLineNr = { bg = C.none },
  NeoTreeNormal = { bg = C.none },
  NeoTreeNormalNC = { bg = C.none },
  LineNr = { bg = C.none },
  SignColumn = { bg = C.none },
  EndOfBuffer = { bg = C.none },
  FoldColumn = { bg = C.none },
  Folded = { bg = C.none },
  VertSplit = { bg = C.none },
  StatusLine = { bg = C.none },
  TabLine = { bg = C.none },
  TabLineFill = { bg = C.none },
}
