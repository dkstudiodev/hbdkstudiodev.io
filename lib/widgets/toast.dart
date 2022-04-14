import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toaster extends StatefulWidget {
  final String casa;
  final int pontos;
  const Toaster({Key? key, required this.casa, required this.pontos}) : super(key: key);



  @override
  _ToasterState createState() => _ToasterState();
}
void showToast(String nome, int pontos)=> Fluttertoast.showToast(
    msg: nome + pontos.toString(),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 10,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0
);
class _ToasterState extends State<Toaster> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: (){
          print('apertou');
          showToast(widget.casa, widget.pontos);
        },
        child: Text('aperte'),
      ),
    );
  }
}
