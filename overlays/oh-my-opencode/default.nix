# oh-my-opencode overlay - 自前で最新バージョンを管理するための Overlay
#
# バージョン更新手順:
# 1. 以下のコマンドでバージョンとハッシュを取得:
#    nix-prefetch-url https://registry.npmjs.org/oh-my-opencode/-/oh-my-opencode-<VERSION>.tgz
# 2. version と hash を更新する

final: prev: {
  oh-my-opencode = prev.stdenvNoCC.mkDerivation (finalAttrs: {
    pname = "oh-my-opencode";
    version = "3.2.3";

    src = prev.fetchurl {
      url = "https://registry.npmjs.org/oh-my-opencode/-/oh-my-opencode-${finalAttrs.version}.tgz";
      # v3.2.3 のハッシュ
      # 取得方法: nix-prefetch-url https://registry.npmjs.org/oh-my-opencode/-/oh-my-opencode-3.2.3.tgz
      sha256 = "0gxmay8wwvc4i1x4kan3f2sq6z5qwipappghqbs2p6nb1gjy42wr";
    };

    dontUnpack = true;

    strictDeps = true;

    buildInputs = with prev; [ bun ];

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/lib/node_modules/oh-my-opencode"
      tar -xzf "$src" -C "$out/lib/node_modules/oh-my-opencode" --strip-components=1

      mkdir -p "$out/bin"
      ln -s "$out/lib/node_modules/oh-my-opencode/dist/cli.js" "$out/bin/oh-my-opencode"
      chmod +x "$out/bin/oh-my-opencode"

      runHook postInstall
    '';

    doInstallCheck = true;
    nativeInstallCheckInputs = with prev; [ writableTmpDirAsHomeHook ];

    installCheckPhase = ''
      runHook preInstallCheck

      "$out/bin/oh-my-opencode" --version

      runHook postInstallCheck
    '';

    meta = {
      description = "The Best Agent Harness. Meet Sisyphus: The Batteries-Included Agent that codes like you.";
      homepage = "https://github.com/code-yeongyu/oh-my-opencode";
      license = prev.lib.licenses.mit;
      mainProgram = "oh-my-opencode";
      platforms = prev.lib.platforms.linux ++ prev.lib.platforms.darwin;
      sourceProvenance = [ prev.lib.sourceTypes.binaryBytecode ];
    };
  });
}
