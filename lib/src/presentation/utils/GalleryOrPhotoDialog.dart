import 'package:flutter/material.dart';

GalleryOrPhotoDialog(
    BuildContext context, Function() pickImage, Function() takePhoto) {
  return showDialog(
      context: context,
      builder: (BuildContext contextx) => AlertDialog(
              title: Text(
                "Selecciona una opción",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(contextx);
                      pickImage();
                    },
                    child: Text(
                      'Galería',
                      style: TextStyle(color: Colors.black),
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(contextx);
                      takePhoto();
                    },
                    child: Text(
                      'Camara',
                      style: TextStyle(color: Colors.black),
                    ))
              ]));
}
