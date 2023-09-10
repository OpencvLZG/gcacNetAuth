Map<String, String> parseIp(String response) {
  RegExp scriptRegex = RegExp('<script>(.*?)</script>');
  var scriptMatch = scriptRegex.firstMatch(response);
  if (scriptMatch == null) return Map();
  var script = scriptMatch!.group(1);
  if (script == null) return Map();
  var loRegex = RegExp(r'location\.replace');
  bool hasLocationReplace = loRegex.hasMatch(script.toString());
  if (!hasLocationReplace) return Map();
  RegExp urlRegex = RegExp('"(.*?)"');
  var urlMatch = urlRegex.firstMatch(script.toString());
  if (urlMatch == null) return Map();
  var url = urlMatch!.group(1);
  Uri host = Uri.parse(url.toString());
  Map<String, String> params = host.queryParameters;
  return params;
}
