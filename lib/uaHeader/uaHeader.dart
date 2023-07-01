class UaHeader {
  String uaName;
  String Data;

  UaHeader(this.uaName, this.Data);
}

List<UaHeader> UaHeaderList = [
  UaHeader("Android 12",
      "Mozilla/5.0 (Linux; Android 12; RMX3085) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36"),
  UaHeader("Window 10",
      "Mozilla/5.0 (Windows NT 10.0; WOW64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.5666.197 Safari/537.36"),
  UaHeader("Mac",
      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 uacq"),
  UaHeader("Linux",
      "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 uacq"),
  UaHeader("ChromiumOs",
      "Mozilla/5.0 (X11; CrOS x86_64 14541.0.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36"),
  UaHeader("Ubuntu",
      "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.11 (KHTML, like Gecko) Ubuntu/14.04.6 Chrome/81.0.3990.0 Safari/537.36"),
  UaHeader("Debian",
      "Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/532.4 (KHTML, like Gecko) Chrome/4.0.237.0 Safari/532.4 Debian"),
  UaHeader("Windows Phone",
      "Mozilla/5.0 (Windows Phone 10.0; Android 4.2.1; Microsoft; Lumia 650) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.85 Safari/537.36"),
];

// Map<String, UaHeader> UaHeaderList = {

//   '':UaHeader(uaName, Data),
// };
