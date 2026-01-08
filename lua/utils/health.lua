vim.api.nvim_create_user_command("HealthCheck", function()
	require("utils.health").run()
end, {})
