import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Galería de imágenes"),
          leading: IconButton(
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              print("hola");
            },
          ),
        ),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        ShotbackCard(),
        ShotbackCard(),
        ShotbackCard()
        ],
        ),
      ),
    );
  }
}


class ShotbackCard extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Image.network("https://static.vix.com/es/sites/default/files/styles/4x3/public/imj/p/paisajes-espectaculares-del-mundo-1.jpg"),
          Positioned(bottom: 0.0, child: Container(color: Colors.white, height: 50, width:MediaQuery.of(context).size.width, child: Text("Fuji"),))
        ],
      ),
    );
  }

}

//https://aws.traveler.es/prod/designs/v1/assets/1000x667/21250.jpg
//https://static.vix.com/es/sites/default/files/styles/4x3/public/imj/p/paisajes-espectaculares-del-mundo-1.jpg

class Shotback{

  Image image;
  String title;
  Text description;
  String location;
  DateTime date;
  //Contactos[]
}
