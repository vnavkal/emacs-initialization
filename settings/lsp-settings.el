(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((python-mode . lsp))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)

(require 'lsp-docker)

(defvar lsp-docker-client-packages
    '(lsp-css lsp-clients lsp-bash lsp-go lsp-pyls lsp-html lsp-typescript
      lsp-terraform lsp-cpp))

(defvar lsp-docker-client-configs
   (list
   (list :server-id 'bash-ls :docker-server-id 'bashls-docker :server-command "bash-language-server start")
   (list :server-id 'clangd :docker-server-id 'clangd-docker :server-command "ccls")
   (list :server-id 'css-ls :docker-server-id 'cssls-docker :server-command "css-languageserver --stdio")
   (list :server-id 'dockerfile-ls :docker-server-id 'dockerfilels-docker :server-command "docker-langserver --stdio")
   (list :server-id 'gopls :docker-server-id 'gopls-docker :server-command "gopls")
   (list :server-id 'html-ls :docker-server-id 'htmls-docker :server-command "html-languageserver --stdio")
   (list :server-id 'pyls :docker-server-id 'pyls-docker :server-command "pyls")
   (list :server-id 'ts-ls :docker-server-id 'tsls-docker :server-command "typescript-language-server --stdio")))

(lsp-docker-init-clients
  :path-mappings '(("~/fin/" . "/projects"))
  :client-packages lsp-docker-client-packages
  :client-configs lsp-docker-client-configs)

(provide 'lsp-settings)
