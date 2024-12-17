{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      jumphost = "gcloud compute ssh jumphost1 --project soundtrap-anthos --zone us-central1-a --tunnel-through-iap -- -oServerAliveInterval=60 -oTCPKeepAlive=yes";
      jump-proxy = "gcloud compute ssh jumphost1 - -project soundtrap-anthos - -zone us-central1-a - -tunnel-through-iap - - -L 8888:localhost:8888 -N -oServerAliveInterval=60 -oTCPKeepAlive=yes";
      k = "HTTPS_PROXY=localhost:8888 kubectl";
      deeplink_ios = "xcrun simctl openurl booted"; # deeplinks such as "com.soundtrap.studioapp://pricing"
      deeplink_android = "adb shell am start -a android.intent.action.VIEW -d";
      switch = "home-manager switch --flake $HOME/nixconf";
    };

    initExtra = ''
      . $HOME/.asdf/asdf.sh
      . $HOME/.asdf/plugins/java/set-java-home.zsh
      eval "$(/opt/homebrew/bin/brew shellenv)"
      export FLUTTER_ROOT="$(asdf where flutter)"

      bindkey -v
      bindkey '^R' history-incremental-search-backward
      bindkey '^ ' autosuggest-accept
    '';

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
