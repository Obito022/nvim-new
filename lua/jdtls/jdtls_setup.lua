local M = {}

function M.setup()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

    -- Mason JDTLS path
    local mason_jdtls = vim.fn.stdpath("data") .. "/mason/packages/jdtls/"
    local launcher_jar = mason_jdtls .. "plugins/org.eclipse.equinox.launcher_1.7.100.v20251014-1222.jar"

    local config = {
        cmd = {
            "java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xmx1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens", "java.base/java.util=ALL-UNNAMED",
            "--add-opens", "java.base/java.lang=ALL-UNNAMED",
            "-jar", launcher_jar,
            "-configuration", mason_jdtls .. "config_mac",
            "-data", workspace_dir,
        },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
        settings = { java = {} },
        init_options = { bundles = {} },
    }

    require("jdtls").start_or_attach(config)
end

return M

