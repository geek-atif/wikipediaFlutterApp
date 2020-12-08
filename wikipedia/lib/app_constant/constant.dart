class Constant {
  static var baseUrl = "https://en.wikipedia.org/";
  static var queryURL= "/w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description";
  static var webView = "${baseUrl}wiki/";
  static var defaultQuery = "android";
  static var defaultQueryNumber = 10;
  static var cacheFileName = "WikipediaCacheData.json";

}
