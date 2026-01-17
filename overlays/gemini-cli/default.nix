# Gemini CLI overlay - 自前で最新バージョンを管理するための Overlay
#
# バージョン更新手順:
# 1. 以下のコマンドでハッシュを取得:
#    nix-prefetch-url https://github.com/google-gemini/gemini-cli/releases/download/v<VERSION>/gemini.js
# 2. version と hash を更新する
#
# 参照: nixpkgs pkgs/by-name/ge/gemini-cli-bin/package.nix

final: prev: {
  gemini-cli = prev.stdenvNoCC.mkDerivation (finalAttrs: {
    pname = "gemini-cli";
    version = "0.26.0";

    src = prev.fetchurl {
      url = "https://github.com/google-gemini/gemini-cli/releases/download/v${finalAttrs.version}/gemini.js";
      # v0.26.0 のハッシュ
      # 取得方法: nix-prefetch-url https://github.com/google-gemini/gemini-cli/releases/download/v0.26.0/gemini.js
      hash = "sha256-IOx+n39JGYmHp42ObLD30H2Lgpju6bDBQ7fHLP1oc60=";
    };

    dontUnpack = true;

    strictDeps = true;

    buildInputs = with prev; [
      nodejs
      ripgrep
    ];

    installPhase = ''
      runHook preInstall

      install -D "$src" "$out/bin/gemini"

      # ideal method to disable auto-update
      sed -i.bak '/disableautoupdate: {/,/}/ s/default: false/default: true/' "$out/bin/gemini"

      # use `ripgrep` from `nixpkgs`, more dependencies but prevent downloading incompatible binary on NixOS
      # this workaround can be removed once the following upstream issue is resolved:
      # https://github.com/google-gemini/gemini-cli/issues/11438
      sed -i.bak 's#const existingPath = await resolveExistingRgPath();#const existingPath = "${prev.lib.getExe prev.ripgrep}";#g' "$out/bin/gemini"

      runHook postInstall
    '';

    doInstallCheck = true;
    nativeInstallCheckInputs = with prev;
      [ prev.writableTmpDirAsHomeHook ]
      ++ prev.lib.optionals (with prev.stdenvNoCC.hostPlatform; isDarwin && isx86_64) [ prev.sysctl ];

    installCheckPhase = ''
      runHook preInstallCheck

      "$out/bin/gemini" -v

      runHook postInstallCheck
    '';

    meta = {
      description = "AI agent that brings the power of Gemini directly into your terminal";
      homepage = "https://github.com/google-gemini/gemini-cli";
      license = prev.lib.licenses.asl20;
      mainProgram = "gemini";
      platforms = prev.lib.platforms.linux ++ prev.lib.platforms.darwin;
      sourceProvenance = [ prev.lib.sourceTypes.binaryBytecode ];
    };
  });
}
