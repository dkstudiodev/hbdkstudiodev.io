import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mobx/mobx.dart';
import 'package:torneiohp/Dependencias/ConstrutorCasas.dart';

part 'RecuperaG.g.dart';

class RecuperaG = _RecuperaGBase with _$RecuperaG;

abstract class _RecuperaGBase with Store {
  @observable
  dynamic pontos;

  @observable
  bool carregando = false;

  List<ConstrutorCasas> Listacasa2 = [];


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
