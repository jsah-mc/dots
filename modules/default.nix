{
  # Central feature flags
  configOptions = {
    hyprland = true;
    waybar = true;
    fonts = true;
    terminal = true;
    rofi = true;
    wlogout = true;
    gtk = true;
    extra = true;
    matugen = true;
  };

  # Conditionally import modules
  moduleIf = enabled: path: if enabled then [ path ] else [ ];
}
