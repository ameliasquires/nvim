my neovim config:3

## dependencies

* nvim >=0.8 (probably)

* lsps [listed below](#lsps)

## lsps

* clangd (c/c++)

* jdtls (java)
    
    * jdtls must be writable (idk why) `# chmod +777 -R /usr/share/java/jdtls/config_linux/`

* zls (zig)

* lua-language-server (lua)

install w/ 
    `NVIM_DEBUG=1 nvim +PackerInstall`
