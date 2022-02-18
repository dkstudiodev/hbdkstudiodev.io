import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:torneiohp/Dependencias/casas/Huffepuff.dart';
import 'package:torneiohp/Dependencias/casas/Ravenclaw.dart';
import 'package:torneiohp/Dependencias/RecuperaH.dart';
import 'package:torneiohp/Dependencias/casas/Slytherin.dart';
import 'package:torneiohp/Dependencias/WidgetCasa.dart';
import 'Dependencias/ConstrutorCasas.dart';
import 'Dependencias/ControleLista.dart';
import 'Dependencias/casas/Gryffindor.dart';
import 'Dependencias/RecuperaG.dart';
import 'Dependencias/RecuperaR.dart';
import 'Dependencias/RecuperaS.dart';
import 'Dependencias/WidgetCasaDestaque.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDTfp3cndx3-Fwja8_ZrZ1LnQJEeMPv_qo",
          authDomain: "torneiohp-3a805.firebaseapp.com",
          projectId: "torneiohp-3a805",
          storageBucket: "torneiohp-3a805.appspot.com",
          messagingSenderId: "892366349462",
          appId: "1:892366349462:web:c448e420e64f7c17804eb7"));
  runApp(MultiProvider(
    providers: [
      Provider<Gryffindor>(
        create: (_) => Gryffindor(),
      ),
      Provider<RecuperaG>(
        create: (_) => RecuperaG(),
      ),
      Provider<RecuperaH>(
        create: (_) => RecuperaH(),
      ),
      Provider<RecuperaS>(
        create: (_) => RecuperaS(),
      ),
      Provider<RecuperaR>(
        create: (_) => RecuperaR(),
      ),
      Provider<ControleLista>(
        create: (_) => ControleLista(),
      )
    ],
    child:  MaterialApp(
      theme: ThemeData(
        fontFamily: 'HARRYP',
      ),
      home: PaginaRanking(),
    ),
  ));
}

class PaginaRanking extends StatelessWidget {
  const PaginaRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;

    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("casa").snapshots().listen(
            ( snapshot ){

          for( DocumentSnapshot item in snapshot.docs ){
            dynamic dados = item.data();
            print("Dados exibicao: " + dados["nome"] + " - " + dados["pontos"] );
          }

        }
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            height: altura / 2,
            width: largura,
            child: Center(child: WidgetCasaDestaque()),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.red,
                  child: Gryffindor(),
                )),
                Expanded(
                    child: Container(
                  color: Colors.yellow,
                  child: Huffepuff(),
                )),
                Expanded(
                    child: Container(
                  color: Colors.green,
                  child: Ravenclaw(),
                )),
                Expanded(
                    child: Container(
                  color: Colors.blue,
                  child: Slytherin(),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
