import 'package:examen_flutter_alejandrocruz/home_ui/home_presenter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeView{
  HomePresenter homePresenter;
  @override
  void initState() {
    homePresenter = HomePresenter(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hola"),
      ),
      body: Center(child: Text("hola")),
    );
  }
}
