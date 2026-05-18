{ username, ... }: {

  networking = {
    hostName = "${username}-macbookair";
    localHostName = "${username}-mac";

    knownNetworkServices = [
      "Wi-Fi"
      "Ethernet Adaptor"
      "Thunderbolt Ethernet"
    ];

    dns = [
      # Cloudflare
      # https://www.cloudflare.com/ja-jp/learning/dns/dns-records/dns-aaaa-record/
      # https://www.cloudflare.com/learning/dns/what-is-1.1.1.1/
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
  };
}
