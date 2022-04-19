import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'ConstrutorCasas.dart';

part 'ControleLista.g.dart';

class ControleLista = _ControleListaBase with _$ControleLista;

abstract class _ControleListaBase with Store {
  @observable
  bool carregando = false;

  @observable
  dynamic primeiraCasa;


  @action
  Future<ConstrutorCasas> ListaCasas() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection('casas').snapshots().listen((snapshott) {
      carregando = false;
      Future.delayed(Duration(seconds: 1), () async {
        QuerySnapshot querySnapshot = await db
            .collection('casas')
            .orderBy('pontos', descending: true)
            .limit(1)
            .get();

        for (DocumentSnapshot item in querySnapshot.docs) {
          dynamic dados = item.data();

          ConstrutorCasas casa = await ConstrutorCasas(
              pontos: dados['pontos'],
              nome: dados['nome'],
              caminhoAnimacao: dados['caminhoAnimacao']);

          primeiraCasa = casa;
        }
        carregando = true;
      });
    });

    return primeiraCasa;
  }
}
