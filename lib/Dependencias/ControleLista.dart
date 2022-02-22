import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'ConstrutorCasas.dart';
part 'ControleLista.g.dart';

class ControleLista = _ControleListaBase with _$ControleLista;

abstract class _ControleListaBase with Store {
  @observable
  bool carregando = false;

  @action
  Future<List<ConstrutorCasas>> ListaCasas() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    List<ConstrutorCasas> listaCasas = [];

    //Recupera todos os usuarios
    db.collection('casas')
        .snapshots()
        .listen((snapshot) {
      carregando = false;
      print(carregando);

      carregando = true;
      print(carregando);

      // Future.delayed(Duration(seconds: 1), () async {
      //   print('carregando e igual a $carregando');
      //
      //     db.collection('casas').snapshots().listen((snapshot) async {
      //
      //       QuerySnapshot querySnapshot = await db
      //           .collection('casas')
      //           .orderBy('pontos', descending: true)
      //           .get();
      //
      //       for (DocumentSnapshot item in querySnapshot.docs) {
      //         dynamic dados = item.data();
      //
      //         ConstrutorCasas casa = ConstrutorCasas(
      //             pontos: dados['pontos'],
      //             nome: dados['nome'],
      //             caminhoAnimacao: dados['caminhoAnimacao']);
      //         carregando = true;
      //         listaCasas.add(casa);
      //
      //     }});
      // });

    });

    QuerySnapshot querySnapshot = await db
        .collection('casas')
        .orderBy('pontos', descending: true)
        .get();

    for (DocumentSnapshot item in querySnapshot.docs) {
      dynamic dados = item.data();

      ConstrutorCasas casa = ConstrutorCasas(
          pontos: dados['pontos'],
          nome: dados['nome'],
          caminhoAnimacao: dados['caminhoAnimacao']);

      listaCasas.add(casa);

      db.collection('casas').snapshots().listen((snapshot) {

      });

    }
    return listaCasas;
  }



}