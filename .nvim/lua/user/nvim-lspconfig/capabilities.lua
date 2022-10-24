local capabilities = {}

-- Set Up LSP Server Capabilities
capabilities.capabilities = require("cmp_nvim_lsp").default_capabilities()

return capabilities
