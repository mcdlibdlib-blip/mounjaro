{ pkgs, ... }: {
  channel = "stable-24.11";

  packages = [
    pkgs.nodejs_22
    pkgs.python3
  ];

  env = {};

  idx = {
    extensions = [
      "google.gemini-cli-vscode-ide-companion"
    ];

    previews = {
      enable = true;
      previews = {
        web = {
          command = ["python3" "-m" "http.server" "$PORT" "--bind" "0.0.0.0"];
          manager = "web";
        };
      };
    };
  };

  workspace = {
    onCreate = {
      install-claude-code = "npm install -g @anthropic-ai/claude-code";
      default.openFiles = [ "style.css" "main.js" "index.html" ];
    };
    onStart = {
      ensure-claude-code = "which claude || npm install -g @anthropic-ai/claude-code";
    };
  };
}
