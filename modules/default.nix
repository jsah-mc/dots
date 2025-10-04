{
  # Central feature flags
  configOptions = {
    # GUI stuff
    hyprland = true;
    waybar = true;
    fonts = true;
    terminal = true;
    rofi = true;
    wlogout = true;
    gtk = true;
    extra = true;
  };

  # Conditionally import modules
  moduleIf = enabled: path: if enabled then [ path ] else [ ];
}
