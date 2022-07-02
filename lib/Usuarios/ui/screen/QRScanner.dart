import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

//void main() => runApp(MaterialApp(
 // theme: ThemeData(
 //     primarySwatch: Colors.green
 // ),
 // home: MyHomePage(),
//));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScanResult _scanResult;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Lector códigos QR'),
      ),
      body: Center(
          child:_scanResult==null?Text('Esperando datos de código'):Column(
            children: [
              Text('Contenido: ${_scanResult.rawContent}'),
              Text('Formato: ${_scanResult.format.toString()}'),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _scanCode();
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<void> _scanCode() async {
    var result = await BarcodeScanner.scan();
    setState(() {
      _scanResult = result;
    });
  }
}