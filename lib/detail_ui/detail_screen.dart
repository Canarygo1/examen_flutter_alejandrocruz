import 'package:examen_flutter_alejandrocruz/InjectorSharedPreference.dart';
import 'package:examen_flutter_alejandrocruz/detail_ui/detail_presenter.dart';
import 'package:flutter/material.dart';

class DetailSceen extends StatefulWidget {
  @override
  _DetailSceenState createState() => _DetailSceenState();
}

class _DetailSceenState extends State<DetailSceen> implements DetailView {
  DetailPresenter _presenter;
  String username;
  String url="";

  @override
  void initState() {
    _presenter = DetailPresenter(
        this, InjectorSharedPreference.instance.localRepository);
    _presenter.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        children: <Widget>[
          Center(
              child: Text(
            "Hello " + username,
            style: TextStyle(
              fontSize: 60,
            ),
          )),
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(url),
              radius: 190,
            ),
          )
        ],
      ),
    );
  }

  @override
  showUsername(String username, String url) {
    setState(() {
      this.username = username;
      this.url = url;
    });
  }
}
