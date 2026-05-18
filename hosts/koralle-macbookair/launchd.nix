{ pkgs, ... }: {
  # Podman VMをログイン時に自動起動
  launchd.user.agents.podman-machine = {
    command = "${pkgs.podman}/bin/podman machine start";
    serviceConfig = {
      KeepAlive = false;
      StandardOutPath = "/tmp/podman-machine.log";
      StandardErrorPath = "/tmp/podman-machine.error";
    };
  };
}
