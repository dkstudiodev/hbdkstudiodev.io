import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mobx/mobx.dart';
import 'package:torneiohp/Dependencias/ConstrutorCasas.dart';
part 'RecuperaR.g.dart';

class RecuperaR = _RecuperaRBase with _$RecuperaR;

abstract class _RecuperaRBase with Store {

  @observable
  dynamic pontos;

  @observable
  bool carregando = false;

  @action
  void ObservarCarregamento (bool isloading){

    if (isloading){
      carregando = true;
    } else carregando = false;
  }

  @action
  recuperaPontos(String nomeCasa) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    db.collection('casas').snapshots().listen((snapshot){
      carregando = false;
      Future.delayed (Duration(seconds: 1), ()async {

        DocumentSnapshot documentSnapshot =
        await db.collection('casas').doc(nomeCasa).get();

        dynamic dados = documentSnapshot.data();

        pontos = await dados['pontos'];

        carregando = true;

      });

    });
    return pontos;
  }


}
