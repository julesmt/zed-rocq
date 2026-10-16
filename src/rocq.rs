use zed_extension_api::{self as zed, Result, settings::LspSettings};

struct RocqExtension;

impl zed::Extension for RocqExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        let binary = LspSettings::for_worktree("rocq-lsp", worktree)
            .ok()
            .and_then(|settings| settings.binary);
        let args = binary
            .as_ref()
            .and_then(|binary| binary.arguments.clone())
            .unwrap_or_default();
        let command = binary
            .and_then(|binary| binary.path)
            .or_else(|| worktree.which("rocq-lsp"))
            .or_else(|| worktree.which("coq-lsp"))
            .or_else(|| worktree.which("vsrocqtop"))
            .ok_or("Install rocq-lsp, coq-lsp, or vsrocqtop, or set lsp.rocq-lsp.binary.path")?;

        Ok(zed::Command {
            command,
            args,
            env: worktree.shell_env(),
        })
    }
}

zed::register_extension!(RocqExtension);
