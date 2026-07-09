{ ... }: {
  # Macのターミナルでsudoコマンドを使用したときにTouchIDを使用する
  security.pam.services.sudo_local.touchIdAuth = true;
}