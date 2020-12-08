
class WikipediaResponse {
  ContinueData _continueData;
  Query _query;

  WikipediaResponse({ContinueData continueData, Query query}) {
    this._continueData = continueData;
    this._query = query;
  }

  ContinueData get continueData => _continueData;
  set continueData(ContinueData continueData) => _continueData = continueData;
  Query get query => _query;
  set query(Query query) => _query = query;

  WikipediaResponse.fromJson(Map<String, dynamic> json) {
    _continueData = json['continue_data'] != null
        ? new ContinueData.fromJson(json['continue_data'])
        : null;
    _query = json['query'] != null ? new Query.fromJson(json['query']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._continueData != null) {
      data['continue_data'] = this._continueData.toJson();
    }
    if (this._query != null) {
      data['query'] = this._query.toJson();
    }
    return data;
  }
}

class ContinueData {
  int _picontinue;
  String _continueData;

  ContinueData({int picontinue, String continueData}) {
    this._picontinue = picontinue;
    this._continueData = continueData;
  }

  int get picontinue => _picontinue;
  set picontinue(int picontinue) => _picontinue = picontinue;
  String get continueData => _continueData;
  set continueData(String continueData) => _continueData = continueData;

  ContinueData.fromJson(Map<String, dynamic> json) {
    _picontinue = json['picontinue'];
    _continueData = json['continue_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['picontinue'] = this._picontinue;
    data['continue_data'] = this._continueData;
    return data;
  }
}

class Query {
  List<Pages> _pages;

  Query({List<Pages> pages}) {
    this._pages = pages;
  }

  List<Pages> get pages => _pages;
  set pages(List<Pages> pages) => _pages = pages;

  Query.fromJson(Map<String, dynamic> json) {
    if (json['pages'] != null) {
      _pages = new List<Pages>();
      json['pages'].forEach((v) {
        _pages.add(new Pages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._pages != null) {
      data['pages'] = this._pages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  int _pageid;
  int _ns;
  String _title;
  int _index;
  Terms _terms;
  Thumbnail _thumbnail;

  Pages(
      {int pageid,
      int ns,
      String title,
      int index,
      Terms terms,
      Thumbnail thumbnail}) {
    this._pageid = pageid;
    this._ns = ns;
    this._title = title;
    this._index = index;
    this._terms = terms;
    this._thumbnail = thumbnail;
  }

  int get pageid => _pageid;
  set pageid(int pageid) => _pageid = pageid;
  int get ns => _ns;
  set ns(int ns) => _ns = ns;
  String get title => _title;
  set title(String title) => _title = title;
  int get index => _index;
  set index(int index) => _index = index;
  Terms get terms => _terms;
  set terms(Terms terms) => _terms = terms;
  Thumbnail get thumbnail => _thumbnail;
  set thumbnail(Thumbnail thumbnail) => _thumbnail = thumbnail;

  Pages.fromJson(Map<String, dynamic> json) {
    _pageid = json['pageid'];
    _ns = json['ns'];
    _title = json['title'];
    _index = json['index'];
    _terms = json['terms'] != null ? new Terms.fromJson(json['terms']) : null;
    _thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageid'] = this._pageid;
    data['ns'] = this._ns;
    data['title'] = this._title;
    data['index'] = this._index;
    if (this._terms != null) {
      data['terms'] = this._terms.toJson();
    }
    if (this._thumbnail != null) {
      data['thumbnail'] = this._thumbnail.toJson();
    }
    return data;
  }
}

class Terms {
  List<String> _description;

  Terms({List<String> description}) {
    this._description = description;
  }

  List<String> get description => _description;
  set description(List<String> description) => _description = description;

  Terms.fromJson(Map<String, dynamic> json) {
    _description = json['description'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this._description;
    return data;
  }
}

class Thumbnail {
  String _source;
  int _width;
  int _height;

  Thumbnail({String source, int width, int height}) {
    this._source = source;
    this._width = width;
    this._height = height;
  }

  String get source => _source;
  set source(String source) => _source = source;
  int get width => _width;
  set width(int width) => _width = width;
  int get height => _height;
  set height(int height) => _height = height;

  Thumbnail.fromJson(Map<String, dynamic> json) {
    _source = json['source'];
    _width = json['width'];
    _height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this._source;
    data['width'] = this._width;
    data['height'] = this._height;
    return data;
  }
}
