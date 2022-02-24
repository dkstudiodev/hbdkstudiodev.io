import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:torneiohp/Dependencias/ConstrutorCasas.dart';
import 'package:torneiohp/Dependencias/WidgetCasa.dart';

import 'ControleLista.dart';

class ListaCasaDestaque extends StatefulWidget {
  final functionControleLista;

  const ListaCasaDestaque({Key? key, required this.functionControleLista})
      : super(key: key);

  @override
  _ListaCasaDestaqueState createState() => _ListaCasaDestaqueState();
}

class _ListaCasaDestaqueState extends State<ListaCasaDestaque> {
  @override
  var _functrioControleLista;

  void initState() {
    // TODO: implement initState
    _functrioControleLista = widget.functionControleLista;
  }


  @override
  Widget build(BuildContext context) {
    final _controleLista = Provider.of<ControleLista>(context);
    ConstrutorCasas casa = _controleLista.primeiraCasa;

    return FutureBuilder<ConstrutorCasas>(
        future: _functrioControleLista,
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
              // ConstrutorCasas? casa = snapshot.data;
              return RiveAnimation.asset
                (casa.caminhoAnimacao,
              animations: ['pulsando'],
              );

                WidgetCasa(
                  caminhoAnimacao: casa.caminhoAnimacao,
                  animacao: 'pulsando',
                  pontos: casa.pontos);
          }
        });
  }
}