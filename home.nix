{ pkgs, ... }: {
  home.username = "janandersson";
  home.homeDirectory = "/Users/janandersson";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Programming
    cmake
    jq

    # Mac Apps
    spotify

    # Fonts
    nerd-fonts.fira-code

    # CLI utils
    tree

    # Neovim
    nixd
    nixfmt

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    MOB_TIMER_ROOM = "nudio";
    ANDROID_HOME = "$HOME/Library/Android/sdk";
    ANDROID_NDK_ROOT = "$HOME/Library/Android/sdk/ndk/26.1.10909125";
  };

  home.sessionPath = [
    "$HOME/.pub-cache/bin" # Dart global packages
    "$HOME/Library/Android/sdk/platform-tools" # Android
    "$HOME/src/studio/modules/acp_morothead/morothead_git/build-flatbuffers" # Moröthead
    "/Applications/IntelliJ IDEA CE.app/Contents/MacOS" # IntelliJ idea CLI command
    "/opt/homebrew/opt/mysql-client@8.4/bin" # mysql CLI command
  ];

  programs.home-manager.enable = true;

  programs.vscode.enable = true;
}
