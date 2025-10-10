{
  lib,
  config,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.modules;
in
{
  options.modules.code.enable = mkEnableOption "Enable VsCode";

  config = mkIf cfg.code.enable {
    programs.vscode = {
      enable = true;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        # Other extensions
        jnoortheen.nix-ide
        pkief.material-product-icons
        esbenp.prettier-vscode
        formulahendry.code-runner
        bradlc.vscode-tailwindcss
        dbaeumer.vscode-eslint
      ];
      profiles.default.userSettings = {
        "workbench.productIconTheme" = "material-product-icons";
        "window.titleBarStyle" = "native";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.formatOnSave" = true;
        "workbench.activityBar.location" = "top";
        "workbench.sideBar.location" = "right";
        "window.commandCenter" = false;
        "code-runner.executorMapByFileExtension" = {
          ".py" = "";
          ".vb" = "cd $dir && vbc /nologo $fileName && $dir$fileNameWithoutExt";
          ".vbs" = "cscript //Nologo";
          ".scala" = "scala";
          ".jl" = "julia";
          ".cr" = "crystal";
          ".ml" = "ocaml";
          ".zig" = "zig run";
          ".exs" = "elixir";
          ".hx" = "haxe --cwd $dirWithoutTrailingSlash --run $fileNameWithoutExt";
          ".rkt" = "racket";
          ".scm" = "csi -script";
          ".ahk" = "autohotkey";
          ".au3" = "autoit3";
          ".kt" =
            "cd $dir && kotlinc $fileName -include-runtime -d $fileNameWithoutExt.jar && java -jar $fileNameWithoutExt.jar";
          ".kts" = "kotlinc -script";
          ".dart" = "dart";
          ".pas" = "cd $dir && fpc $fileName && $dir$fileNameWithoutExt";
          ".pp" = "cd $dir && fpc $fileName && $dir$fileNameWithoutExt";
          ".d" = "cd $dir && dmd $fileName && $dir$fileNameWithoutExt";
          ".hs" = "runhaskell";
          ".nim" = "nim compile --verbosity =0 --hints =off --run";
          ".csproj" = "dotnet run --project";
          ".fsproj" = "dotnet run --project";
          ".lisp" = "sbcl --script";
          ".kit" = "kitc --run";
          ".v" = "v run";
          ".vsh" = "v run";
          ".sass" = "sass --style expanded";
          ".cu" = "cd $dir && nvcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
          ".ring" = "ring";
          ".sml" = "cd $dir && sml $fileName";
          ".mojo" = "mojo run";
          ".erl" = "escript";
          ".spwn" = "spwn build";
          ".pkl" = "cd $dir && pkl eval -f yaml $fileName -o $fileNameWithoutExt.yaml";
          ".gleam" = "gleam run -m $fileNameWithoutExt";
          ".nix" = "home-manager switch --flake";
        };
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };
        "terminal.integrated.defaultProfile.linux" = "zsh";
        "files.associations" = {
          "*.css" = "tailwindcss";
        };
        "editor.quickSuggestions" = {
          "strings" = "on";
        };
        "tailwindCSS.includeLanguages" = {
          "plaintext" = "html";
        };
      };
    };
    catppuccin = {
      vscode.profiles.default = {
        icons.enable = true;
        enable = true;
      };
    };
  };
}
