import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'ConstrutorCasas.dart';
part 'ControleLista.g.dart';

class ControleLista = _ControleListaBase with _$ControleLista;

abstract class _ControleListaBase with Store {



  @action
  Future<List<ConstrutorCasas>> ListaCasas() async {
    FirebaseFirestore db = FirebaseFirestore.instance;



    //Recupera todos os usuarios
    QuerySnapshot querySnapshot = await db
        .collection('casas')
        .orderBy('pontos', descending: true)

        .get();

    // print('query '+ querySnapshot.docs[0].toString());

    List<ConstrutorCasas> listaCasas = [];

    for (DocumentSnapshot item in querySnapshot.docs) {
      dynamic dados = item.data();

      ConstrutorCasas casa = ConstrutorCasas(
          pontos: dados['pontos'],
          nome: dados['nome'],
          caminhoAnimacao: dados['caminhoAnimacao']);

      listaCasas.add(casa);
    }
    return listaCasas;
  }


}