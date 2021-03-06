import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:torneiohp/Dependencias/WidgetCasa.dart';
import 'ConstrutorCasas.dart';
import 'ControleLista.dart';

class ListaCasaDestaque extends StatefulWidget {

  final functionControleLista;
  const ListaCasaDestaque({Key? key, required this.functionControleLista}) : super(key: key);

  @override
  _ListaCasaDestaqueState createState() => _ListaCasaDestaqueState();
}

class _ListaCasaDestaqueState extends State<ListaCasaDestaque> {

  dynamic _functionControleLista;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _functionControleLista = widget.functionControleLista;

  }
  Widget build(BuildContext context) {
    final _controleListaCasa = Provider.of<ControleLista>(context);



    return FutureBuilder<ConstrutorCasas>(
        future: _functionControleLista,
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
              return WidgetCasa(
                  caminhoAnimacao:
                      _controleListaCasa.primeiraCasa!.caminhoAnimacao,
                  animacao: 'pulsando',
                  pontos: _controleListaCasa.primeiraCasa!.pontos);
          }
        });
  }
}
