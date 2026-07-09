{ username, ... }: {
  system = {
    stateVersion = 6;
    primaryUser = "${username}";

    defaults = {
      controlcenter = {
        # メニューバーにAirDropを表示しない
        AirDrop = false;
        # メニューバーにバッテリー残量を表示しない(Statsで表示しているため)
        BatteryShowPercentage = false;
        # メニューバーにBluetoothを表示する
        Bluetooth = true;
      };

      finder = {
        # 拡張子を常に表示する
        AppleShowAllExtensions = true;
        # 隠しファイルを常に表示する
        AppleShowAllFiles = true;
        # Finderアイコンをデスクトップに表示しない
        CreateDesktop = false;
        # 拡張子を変更するときに警告を表示しない
        FXEnableExtensionChangeWarning = false;
        # リストビューをデフォルトにする
        FXPreferredViewStyle = "Nlsv";
        # CD, DVDなどをデスクトップに表示しない
        ShowRemovableMediaOnDesktop = false;
        # Finderの下部にステータスバーを表示する
        ShowStatusBar = true;
        # 完全パスを表示する
        _FXShowPosixPathInTitle = true;
      };

      menuExtraClock = {
        # メニューバーの時計を24時間表示にする
        Show24Hour = true;
        # メニューバーに余裕がある場合は日付を表示する
        ShowDate = 0;
        # 日付を表示する
        ShowDayOfMonth = true;
        # 曜日を表示する
        ShowDayOfWeek = true;
        # 秒は表示しない
        ShowSeconds = false;
      };
    };
  };
}