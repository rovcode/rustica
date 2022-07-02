import 'package:flutter/material.dart';
import 'package:rustica/Api/api/Config/Config.dart';

class VistaApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UseCaseConfig _albumConfig = UseCaseConfig();
    return Container(
      child: FutureBuilder(
          key: Key('futureBuilder'),
          future: _albumConfig.caso_uso.getByID("1"),
          builder: (BuildContext context, AsyncSnapshot snapshot) =>
              asycnHelper(snapshot)),
    );
  }

  Widget asycnHelper(AsyncSnapshot snapshot) {
    Widget element = Container();
    if (snapshot.hasError) {
      element = Text('Error ');
    } else if (!snapshot.hasData) {
      element = Center(
        child: CircularProgressIndicator(),
      );
    } else {
      element = ApiView(
        numSillas: snapshot.data.num_sillas,
        estado: snapshot.data.estado,
        piso: snapshot.data.piso,
      );
    }
    return element;
  }
}

class ApiView extends StatelessWidget {
  final int numSillas;
  final String estado;
  final String piso;

  ApiView({required this.numSillas, required this.estado, required this.piso});
  @override
  Widget build(BuildContext context) {
    final element = Container(
      height: 150,
      decoration: BoxDecoration(color: Colors.amber),
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
           Text(numSillas.toString()),
          Column(
            children: [
              Container(
                width: 200,
                padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
                child: Text(
                  estado,
                  key: Key('title-album-api'),
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(piso),
              ),
            ],
          )
        ],
      ),
    );

    return element;
  }
}

class ShowImagen extends StatelessWidget {
  final String url;
  final double widthImage;
  final double heightImage;
  ShowImagen(
      {required this.url, required this.heightImage, required this.widthImage});
  @override
  Widget build(BuildContext context) {
    Widget element = Image.network(
      url,
      width: widthImage,
      height: heightImage,
    );
    return element;
  }
}