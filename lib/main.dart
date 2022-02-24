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
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
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

    final _controleLista = Provider.of<ControleLista>(context);
    final _controleListaFunction = _controleLista.ListaCasas();

    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("casa").snapshots().listen((snapshot) {
      for (DocumentSnapshot item in snapshot.docs) {
        dynamic dados = item.data();
      }
    });

    return Stack(
      children: [
        Container(
          height: altura,
          width: largura,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          // height: altura,
          // width: largura,
        ),
        LayoutBuilder(
          builder: ( context,constraints) {
          return Scaffold(
            backgroundColor: Colors.black54,
            body: Column(
              children: [
                Center(
                  child: ClipOval(
                    child: Container(
                      color: Colors.white.withAlpha(80),
                      child: IconButton(
                        highlightColor: Color(0xff51cc9c),
                        color: Color(0xff51cc9c),
                        iconSize: 70,
                        icon: Image.asset(
                          'assets/images/logo_dk.png',
                          scale: 0.5,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    child: Text(
                      'Primerio Lugar',
                      style: TextStyle(fontSize: 40, color: Color(0xff51cc9c)),
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: 300,
                  child: WidgetCasaDestaque(),
                ),

                // GridView.count(
                //     crossAxisCount: 8,
                // children: [
                //   Expanded(
                //       child: Container(
                //         height: 300,
                //
                //         child: Gryffindor(),
                //       )),
                //   Expanded(
                //       child: Container(
                //         height: 300,
                //
                //         child: Huffepuff(),
                //       )),
                //   Expanded(
                //       child: Container(
                //         height: 300,
                //
                //         child: Ravenclaw(),
                //       )),
                //   Expanded(
                //       child: Container(
                //         height: 300,
                //
                //         child: Slytherin(),
                //       )),
                //
                // ],
                // ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            height: 300,
                            // color: Colors.red,
                            child: Gryffindor(),
                          )),
                      Expanded(
                          child: Container(
                            height: 300,
                            // color: Colors.yellow,
                            child: Huffepuff(),
                          )),
                      Expanded(
                          child: Container(
                            height: 300,
                            // color: Colors.blue,
                            child: Ravenclaw(),
                          )),
                      Expanded(
                          child: Container(
                            height: 300,
                            // color: Colors.green,
                            child: Slytherin(),
                          )),
                    ],
                  ),
                )
              ],
            ),
          );
        },

        ),
      ],
    );
  }
}
