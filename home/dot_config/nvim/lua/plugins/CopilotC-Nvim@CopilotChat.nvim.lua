return {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy=false,
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master"}
    },
    build = "make tiktoken",
    opts = {
	model = "gpt-4o"
    },
  }
