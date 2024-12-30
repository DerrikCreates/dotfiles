return {
	"seblj/roslyn.nvim",
	event = { "BufReadPre", "BufNewFile" },

	dependencies = { "roslyn.nvim" },

	opts = {
		config = {
			settings = {
				["csharp|inlay_hints"] = {
					csharp_enable_inlay_hints_for_implicit_object_creation = true,
					csharp_enable_inlay_hints_for_implicit_variable_types = true,
					csharp_enable_inlay_hints_for_lambda_parameter_types = true,
					csharp_enable_inlay_hints_for_types = true,
					dotnet_enable_inlay_hints_for_indexer_parameters = true,
					dotnet_enable_inlay_hints_for_literal_parameters = true,
					dotnet_enable_inlay_hints_for_object_creation_parameters = true,
					dotnet_enable_inlay_hints_for_other_parameters = true,
					dotnet_enable_inlay_hints_for_parameters = true,
					dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
					dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
					dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
				},
				["csharp|code_lens"] = {
					dotnet_enable_references_code_lens = true,
				},
			},
		},
		broad_search = true,
	},

	config = function()
		require("roslyn").setup({
			-- how to on_attach for roslyn lsp
			-- https://github.com/seblj/roslyn.nvim/issues/8#issuecomment-2198336099
			
			config = {
				on_attach = function(client)
					require("lsp-overloads").setup(client, {})
				end,
			},
		})
	end,
}
