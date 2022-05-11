local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

require('nvim-autopairs').setup {}

cmp.event:on('comfirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
