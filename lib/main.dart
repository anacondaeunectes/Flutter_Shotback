import 'package:flutter/material.dart';

final String ejemplo =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacus erat, scelerisque sit amet aliquet in, varius vitae diam. Vestibulum tempus ultrices justo, et scelerisque lectus tincidunt non. Aenean sit amet tortor et elit molestie rhoncus in eu purus. Etiam non sagittis lacus. Pellentesque hendrerit, risus ac volutpat cursus, lacus velit malesuada enim, eget ullamcorper velit elit consequat ante. Proin facilisis auctor augue eu bibendum. Quisque sed bibendum ipsum, ut commodo nunc. Pellentesque aliquet nisl nec diam ornare, in lobortis velit molestie. In ultricies purus non libero efficitur, id tempor magna maximus.";

void main() {
  runApp(MainScreen());
}

//Vista principal de la aplicacion.
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(   //Otorga el estilo de MaterialDesign
      title: 'ShotBack',
      home: Scaffold(     //Scaffold que contiene el appBar y el body de la vista  
        backgroundColor: Colors.lime,
        appBar: AppBar(
            title: Center(child: Text("Shotback")), backgroundColor: Colors.green),
        body: ListView(   //El body se trata de un ListView de Cards que muestran una imagen y su titulo
          children: <Widget>[
            ShotbackCard(Shotback(
              Image.asset("assets/fuji.jpg"),
              "Monte Fuji",
              ejemplo,
                DateTime.now(),
                "Tokio, Japon"
            )),
            ShotbackCard(Shotback(
                Image.asset("assets/mountain.jpg"),
                "Fiordo noruego",
                ejemplo,
                DateTime.now(),
                "Stavanger, Noruega")),
            ShotbackCard(Shotback(
                Image.asset("assets/saintMichel.jpg"),
                "Mont Saint Michel",
                ejemplo,
                DateTime.now(),
                "Normandia, Francia")),
            ShotbackCard(Shotback(
                Image.asset("assets/murallaChina.jpg"),
                "Muralla china",
                ejemplo,
                DateTime.now(),
                "Pekin, China")),
            ShotbackCard(Shotback(
                Image.asset("assets/plazaObradoiro.jpg"),
                "Plaza Obradoiro",
                ejemplo,
                DateTime.now(),
                "Santiago de Compostela, España"))
          ],
        ),
      ),
    );
  }
}

//Clase que representa la pantalla secundaria donde se muestra informacion ampliada asociada a la foto elegida
class ShotbackScreen extends StatelessWidget {
  Shotback shotback;

  ShotbackScreen(Shotback shotback) {
    this.shotback = shotback;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Nuevo Scaffold para esta pantalla secundaria
      appBar: AppBar(
          //Este AppBar incluye por defecto un leadign Button que nos permite "poppear" esta pantalla y volve a la anterior
          title: Text(this.shotback.title),
          backgroundColor: Colors.green),
      body: ListView(
        //Cuerpo de la pantalla
        children: [
          this.shotback.image,
          Card(
            //Card para la localizacion
            color: Colors.green,
            child: Padding(   //Widget que genera un espaciamiento del widget hijo
              padding: const EdgeInsets.all(10.0),
              child: Row(   //Widget que coloca los elementos hijos en fila
                children: [
                  Icon(Icons.place, color: Colors.black),
                  VerticalDivider(
                    color: Colors.white,
                    thickness: 5,
                    width: 5,
                  ),
                  Text(this.shotback.location,
                      style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
          Card(
            //Card para la fecha
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.date_range, color: Colors.black),
                  VerticalDivider(
                    color: Colors.white,
                    thickness: 5,
                    width: 5,
                  ),
                  Text(this.shotback.date.toString(),
                      style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
          Card(
            color: Colors.green,
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  Text(this.shotback.description,
                      style: TextStyle(color: Colors.white))
                ])),
          )
        ],
      ),
    );
  }
}

//Clase que representa un Widget Card y le otorga una apariencia en funcion del objeto ShotBack pasado por parametro
class ShotbackCard extends StatelessWidget {
  
  Shotback shotback;

  //Constrcutor
  ShotbackCard(Shotback shotback) {
    this.shotback = shotback;
  }

  //Getter
  Shotback getShotback() {
    return this.shotback;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(   //Widget que permite controlar cuando la Card es tocada y reaccionar a ello.
        child: Stack(
          //Este widget permite el sobreposicionamiento de widgets. En este caso, la imagen, el primero de los hijos, ocupa todo el espacio otorgado por el widget padre y el segundo hijo se posiciona encima de este
          children: [
            this.shotback.image,
            Positioned(
                bottom: 0.0, //El widget hijo se colocara en la parte inferior
                child: Container(
                    //Rectangulo inferior blanco de cada tarjeta
                    color: Colors.white,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment
                        .centerLeft, //Le otorga un alineamiento al widget hijo
                    child: Container(
                      //Contenedor del texto del titulo
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        shotback.title,
                        textAlign: TextAlign.left,
                      ),
                    )))
          ],
        ),
        onTap: () {   //Al ser tocada una Card, se abrira una segunda pantalla con la informacion de ese ShotBack
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShotbackScreen(this.shotback)));
        },
      ),
    );
  }
}

//Clase que representa los atributos de cada imagen
class Shotback {
  Image image;
  String title;
  String description;
  String location;
  DateTime date;
  //Contactos[]

//Constructor
  Shotback(this.image, //Parametro obligatorio
      [this.title = "",
      this.description,
      this.date,
      this.location]); //Parametros opcionales. El titulo por defecto es un string sin texto

}
