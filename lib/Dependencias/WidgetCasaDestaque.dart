import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:torneiohp/Dependencias/RecuperaG.dart';

import 'ConstrutorCasas.dart';
import 'ControleLista.dart';

class WidgetCasaDestaque extends StatefulWidget {
  const WidgetCasaDestaque({Key? key}) : super(key: key);

  @override
  _WidgetCasaDestaqueState createState() => _WidgetCasaDestaqueState();
}

class _WidgetCasaDestaqueState extends State<WidgetCasaDestaque> {
  @override
  Widget build(BuildContext context) {

    final _recuperaLista = Provider.of<ControleLista>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Observer(
        builder: (_)=>
            FutureBuilder<List<ConstrutorCasas>>(
              future: _recuperaLista.ListaCasas(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            'Carregando Aulas',

                          ),
                          CircularProgressIndicator(),
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return ListView.builder(

                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, indice) {
                        List<ConstrutorCasas>? listaCasas = snapshot.data;
                        ConstrutorCasas casas = listaCasas![indice];

                        return Container(
                            width: 400,
                            height: 400,
                            child: RiveAnimation.asset(
                              casas.caminhoAnimacao,
                              animations: ['pulsando'],

                            ),

                        );
                      },
                    );
                }
              },
            ),
      ),
    );
  }
}
