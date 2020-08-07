class UrlSave {
  String url = "";

  UrlSave(this.url);

  factory UrlSave.fromMap(Map<String, dynamic> map) {
    String username = map['username'];
    return UrlSave(username);
  }

  toMap() {
    Map<String, dynamic> map = Map();
    map['username'] = this.url;
    return map;
  }
}
