import 'package:examen_flutter_alejandrocruz/detail_ui/detail_presenter.dart';
import 'package:flutter/material.dart';

class DetailSceen extends StatefulWidget {
  final String url;
  final String name;

  DetailSceen(this.url, this.name);

  @override
  _DetailSceenState createState() => _DetailSceenState();
}

class _DetailSceenState extends State<DetailSceen> implements DetailView {
  DetailPresenter _presenter;

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
            "Hello " + widget.name,
            style: TextStyle(
              fontSize: 60,
            ),
          )),
          widget.url.isEmpty
              ? Container()
              : Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.url),
                    radius: 190,
                  ),
                )
        ],
      ),
    );
  }
}
