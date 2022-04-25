import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import '../../widgets/toast.dart';
part 'MonitoraPontos.g.dart';

class MonitoraPontos = _MonitoraPontosBase with _$MonitoraPontos;

abstract class _MonitoraPontosBase with Store {



@action
void showToast(String nome, int pontos, String casa)=> Fluttertoast.showToast(
    msg: 'O professor $nome  adicionou ${pontos.toString()} pontos para a casa $casa',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 10,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0
);

  @action
  MonitoraPontosDB() async {
    print('comecou a monitorar');
    FirebaseFirestore db = FirebaseFirestore.instance;

    db.collection('registroPontos').snapshots().listen((snapshot){

      for( DocumentSnapshot item in snapshot.docs ){
         dynamic dados = item.data();
         Toaster toasterGet = Toaster(
           casa: dados['casa'],
           pontos: dados['pontos'],
         );
         showToast(dados['professor'], dados['pontos'], dados['casa']);
       }
    });

  }


}