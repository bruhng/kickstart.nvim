-- Roslyn LSP for C# (replaces the discontinued OmniSharp).
-- This is the same language server used by VS Code's C# Dev Kit.
-- Installed via Mason (`roslyn-language-server`), see lspconfig.lua's
-- extra `Crashdummyy/mason-registry` entry and `ensure_installed` list.
return {
  'seblyng/roslyn.nvim',
  ft = 'cs',
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  opts = {
    -- Search parent directories for a .sln if one isn't found next to the buffer.
    broad_search = true,
    settings = {
      ['csharp|inlay_hints'] = {
        csharp_enable_inlay_hints_for_implicit_object_creation = true,
        csharp_enable_inlay_hints_for_implicit_variable_types = true,
        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
        csharp_enable_inlay_hints_for_types = true,
        dotnet_enable_inlay_hints_for_parameters = true,
        dotnet_enable_inlay_hints_for_literal_parameters = true,
        dotnet_enable_inlay_hints_for_indexer_parameters = true,
        dotnet_enable_inlay_hints_for_object_creation_parameters = true,
        dotnet_enable_inlay_hints_for_other_parameters = true,
        dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
        dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
        dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
      },
      ['csharp|code_lens'] = {
        dotnet_enable_references_code_lens = true,
      },
    },
  },
}
