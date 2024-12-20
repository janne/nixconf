{ ... }: {
  programs.git = {
    enable = true;

    userName = "Jan Andersson";
    userEmail = "jan.andersson@soundtrap.com";

    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      lg = "log --oneline --graph";
    };

    extraConfig = {
      pull.rebase = true;
      merge.conflictstyle = "diff3";
    };
  };
}
