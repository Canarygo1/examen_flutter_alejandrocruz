import 'package:examen_flutter_alejandrocruz/data/model/propertis.dart';
import 'package:examen_flutter_alejandrocruz/detail_ui/detail_screen.dart';
import 'package:examen_flutter_alejandrocruz/home_ui/home_presenter.dart';
import 'package:flutter/material.dart';

import '../Injector.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeView {
  HomePresenter homePresenter;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();

  String eyes = "Select the eyes";
  String nose = "Select the nose";
  String mouth = "Select the mouth";
  String url = "";
  List<String> eyesValues = ["hola", "adios", "se fue"];
  List<String> noseValues = ["hola", "adios", "se fue"];
  List<String> moutValues = ["hola", "adios", "se fue"];

  @override
  void initState() {
    homePresenter = HomePresenter(this, Injector.instance.remoteRepository);
    homePresenter.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
          child: Text("Register your avatar"),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: GestureDetector(
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailSceen(url, nameController.text)))
                          },
                      child: Text(
                        "SAVE AVATAR",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: usernameController,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: "username", prefixIcon: Icon(Icons.person)),
            ),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: "name", prefixIcon: Icon(Icons.person)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                  child: Text("Build your avatar",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold))),
            ),
            DropdownButton<String>(
                items: eyesValues.map((String val) {
                  return new DropdownMenuItem<String>(
                    value: val,
                    child: new Text(val),
                  );
                }).toList(),
                hint: Text(eyes),
                onChanged: (newVal) {
                  eyes = newVal;
                  setState(() {
                    homePresenter.selectionChanged(eyes, mouth, nose);
                  });
                }),
            DropdownButton<String>(
                items: noseValues.map((String val) {
                  return new DropdownMenuItem<String>(
                    value: val,
                    child: new Text(val),
                  );
                }).toList(),
                hint: Text(nose),
                onChanged: (newVal) {
                  nose = newVal;
                  print(mouth);
                  setState(() {
                    homePresenter.selectionChanged(eyes, mouth, nose);
                  });
                }),
            DropdownButton<String>(
                items: moutValues.map((String val) {
                  return new DropdownMenuItem<String>(
                    value: val,
                    child: new Text(val),
                  );
                }).toList(),
                hint: Text(mouth),
                onChanged: (newVal) {
                  mouth = newVal;
                  print(mouth);
                  setState(() {
                    homePresenter.selectionChanged(eyes, mouth, nose);
                  });
                }),
            url.isEmpty
                ? Container()
                : CircleAvatar(
                    backgroundImage: NetworkImage(url),
                    radius: 190,
                  )
          ],
        ),
      ),
    );
  }

  @override
  showOptions(List<Propertis> propertis) {
    setState(() {
      eyesValues = propertis[0].atributtes;
      noseValues = propertis[1].atributtes;
      moutValues = propertis[2].atributtes;
    });
  }

  @override
  showImage(String url) {
    this.url = url;
  }
}
