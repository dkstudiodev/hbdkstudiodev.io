import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:torneiohp/Dependencias/ConstrutorCasas.dart';
part 'ControleGeralListen.g.dart';
 
class ControleGeralListen = _ControleGeralListenBase with _$ControleGeralListen;
 
abstract class _ControleGeralListenBase with Store {
  
  ConstrutorCasas? casa;

  Future <ConstrutorCasas?> RecuperaDadosDestaque() async{
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection('casas')
  .snapshots()
  .listen((event) async {
    
    QuerySnapshot querySnapshot = await db.collection('casas')
    .orderBy('pontos', descending: true)
        .get();

    for(DocumentSnapshot item in querySnapshot.docs){
      dynamic dados = item.data();
      ConstrutorCasas casaIns = ConstrutorCasas(
           pontos: dados['pontos'],
           nome: dados['nome'],
           caminhoAnimacao: dados['caminhoAnimacao']);
      casa = casaIns;
    }

  });
  return casa;
  }
  
  
}