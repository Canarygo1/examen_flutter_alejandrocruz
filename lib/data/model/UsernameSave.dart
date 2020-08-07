class UsernameSave {
  final String username;
  final String url;
  UsernameSave(this.username,this.url);

  factory UsernameSave.fromMap(Map<String, dynamic> map) {
    String username = map['username'];
    String url = map['url'];

    return UsernameSave(username,url);
  }

  toMap() {
    Map<String, dynamic> map = Map();
    map['username'] = this.username;
    map['url'] = this.url;

    return map;
  }
}
