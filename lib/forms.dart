import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class Formulario extends StatelessWidget {

  TextEditingController tituloController = TextEditingController();
  TextEditingController fechaController = TextEditingController();
  TextEditingController lugarController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  Image imagePicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Formulario"),
        actions: [IconButton(icon: Icon(Icons.check), onPressed: () {} )],),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  child: Container(
                  height: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Icon(Icons.add_a_photo),
                  ),
              ),
              onTap: (){

                File file = ImagePicker().getImage(source: ImageSource.gallery) as File;

                imagePicked = Image.file(file);

              },
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Titulo"),
                    controller: tituloController
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Fecha"),
                    controller: fechaController
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Lugar"),
                    controller: lugarController
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Descripcion"),
                    controller: descripcionController
                  ),
                  
                ],
              ),
            )
          ],
        ),
      );
  }

  Shotback createShotback(){
    return Shotback(
      imagePicked,
      tituloController.text,
      descripcionController.text,
      DateTime.now(),
      lugarController.text
    );
  }

}
