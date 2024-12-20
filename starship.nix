{ ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      gcloud.disabled = true;
      # line_break.disabled = true;
    };
  };
}
