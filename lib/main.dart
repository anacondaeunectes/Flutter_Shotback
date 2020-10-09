import 'package:flutter/material.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
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
          children: <Widget>[
            ShotbackCard(Shotback(
                Image.network(
                    "https://aws.traveler.es/prod/designs/v1/assets/1000x667/21250.jpg"),
                "Madrid no es", )),
            ShotbackCard(Shotback(Image.network(
                "https://aws.traveler.es/prod/designs/v1/assets/1000x667/21250.jpg"),
                "Fuji")),
            ShotbackCard(Shotback(Image.network(
                "https://aws.traveler.es/prod/designs/v1/assets/1000x667/21250.jpg"), "Monte Fuji", Text("Viaje en el verano de 2003 a Japon"),DateTime.now(),"Japan" ))
          ],
        ),
      ),
    );
  }
}

//Clase que representa la pantalla secundaria donde se muestra informacion ampliada asociada a la foto elegida
class ShotbackScreen extends StatelessWidget{

Shotback shotback;

ShotbackScreen(Shotback shotback) {
    this.shotback = shotback;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(//Nuevo Scaffold para esta pantalla secundaria
      appBar: AppBar(//Este AppBar incluye por defecto un leadign Button que nos permite "poppear" esta pantalla y volve a la anterior
        title: Text(this.shotback.title),
      ),
      body: Column(//Cuerpo de la pantalla
        children: [
          Image.network("https://aws.traveler.es/prod/designs/v1/assets/1000x667/21250.jpg"),
          Card(//Card para la localizacion
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.place, color: Colors.white,),
                  Text(this.shotback.location)
                ],
              ),
            ),
          ),
          Card(//Card para la fecha
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.date_range, color: Colors.white),
                  Text(this.shotback.date.toString())
                ],
              ),
            ),
          ),
          Card(
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Expanded(child: Row(children: [this.shotback.description],))
            ),
          )
        ],
      ),
    );
  }

}

class ShotbackCard extends StatelessWidget {
  Shotback shotback;

  ShotbackCard(Shotback shotback) {
    this.shotback = shotback;
  }

  Shotback getShotback(){
    return this.shotback;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
              child: Stack(//Este widget permite el sobreposicionamiento de widgets. En este caso, la imagen, el primero de los hijos, ocupa todo el espacio otorgado por el widget padre y el segundo hijo se posiciona encima de este
          children: [
            Image.network(
                "https://static.vix.com/es/sites/default/files/styles/4x3/public/imj/p/paisajes-espectaculares-del-mundo-1.jpg"),
            Positioned(
                bottom: 0.0,//El widget hijo se colocara en la parte inferior
                child: Container(//Rectangulo inferior blanco de cada tarjeta
                    color: Colors.white,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,//Le otorga un alineamiento al widget hijo
                    child: Container(//Contenedor del texto del titulo
                      margin: EdgeInsets.only(left: 10),
                      child: Text(shotback.title, textAlign: TextAlign.left,
                    ),
                    )))
          ],
        ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShotbackScreen(this.shotback)));
      },
      ),
    );
  }
}

//https://aws.traveler.es/prod/designs/v1/assets/1000x667/21250.jpg
//https://static.vix.com/es/sites/default/files/styles/4x3/public/imj/p/paisajes-espectaculares-del-mundo-1.jpg

class Shotback {
  Image image;
  String title;
  Text description;
  String location;
  DateTime date;
  //Contactos[]

  Shotback(this.image,//Parametro obligatorio
      [this.title = "", this.description, this.date, this.location]);//Parametros opcionales. El titulo por defecto es un string sin texto
}
