import 'package:flutter/material.dart';

final String ejemplo = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacus erat, scelerisque sit amet aliquet in, varius vitae diam. Vestibulum tempus ultrices justo, et scelerisque lectus tincidunt non. Aenean sit amet tortor et elit molestie rhoncus in eu purus. Etiam non sagittis lacus. Pellentesque hendrerit, risus ac volutpat cursus, lacus velit malesuada enim, eget ullamcorper velit elit consequat ante. Proin facilisis auctor augue eu bibendum. Quisque sed bibendum ipsum, ut commodo nunc. Pellentesque aliquet nisl nec diam ornare, in lobortis velit molestie. In ultricies purus non libero efficitur, id tempor magna maximus.";

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
        backgroundColor: Colors.lime,
        appBar: AppBar(
          title: Text("Galería de imágenes"),
          backgroundColor: Colors.green
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
                "https://aws.traveler.es/prod/designs/v1/assets/1000x667/21250.jpg"), "Monte Fuji", ejemplo, DateTime.now(),"Japan" ))
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
        backgroundColor: Colors.green
      ),
      body: ListView(//Cuerpo de la pantalla
        children: [
          Image.network("https://aws.traveler.es/prod/designs/v1/assets/1000x667/21250.jpg"),
          Card(//Card para la localizacion
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.place, color: Colors.black),
                  VerticalDivider(color: Colors.white, thickness: 5, width: 5,),
                  Text(this.shotback.location, style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
          Card(//Card para la fecha
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.date_range, color: Colors.black),
                  VerticalDivider(color: Colors.white, thickness: 5, width: 5,),
                  Text(this.shotback.date.toString(), style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
          Card(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [Text(this.shotback.description, style: TextStyle(color: Colors.white))])
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
  String description;
  String location;
  DateTime date;
  //Contactos[]

  Shotback(this.image,//Parametro obligatorio
      [this.title = "", this.description, this.date, this.location]);//Parametros opcionales. El titulo por defecto es un string sin texto
  
}
