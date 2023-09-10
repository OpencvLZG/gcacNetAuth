List<String> parseInterfaceIp(String data) {
  final regex = RegExp(r"InternetAddress\(\'(.+?)\', (\w+)\)");

  final match = regex.firstMatch(data);
  if (match != null) {
    final ip = match.group(1);
    final protocol = match.group(2);

    print(ip); // 10.34.68.234
    print(protocol); // IPv4
    return [ip.toString(), protocol.toString()];
  }
  return List.empty();
}
