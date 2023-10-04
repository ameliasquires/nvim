local config = {
    cmd = {
      '/usr/lib/jvm/openjdk-17/bin/java',

      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xmx1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

      '-jar', '/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar',

      '-configuration', '/usr/share/java/jdtls/config_linux',

      '-data', '/usr/share/java/jdtls/config_linux/p/'..vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
      --'/usr/bin/jdtls'
    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}

require('jdtls').start_or_attach(config)
