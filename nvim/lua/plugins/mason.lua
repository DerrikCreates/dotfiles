return {
    "mason-org/mason.nvim",
    opts = {

         registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry"
        },

        ensure_installed = {
            "roslyn",
            "rzls",
            "lua-language-server"
        }
    }
}
