import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:torneiohp/Dependencias/ConstrutorCasas.dart';
import 'package:torneiohp/Dependencias/RecuperaG.dart';
import 'package:torneiohp/Dependencias/RecuperaH.dart';

import '../WidgetCasa.dart';

class Gryffindor extends StatefulWidget {
  const Gryffindor({Key? key}) : super(key: key);

  @override
  _GryffindorState createState() => _GryffindorState();
}

class _GryffindorState extends State<Gryffindor> {
  @override
  Widget build(BuildContext context) {
    final _recuperaPontos = Provider.of<RecuperaG>(context);

    ConstrutorCasas gryffindor = ConstrutorCasas(
      nome: 'gryffindor',
      caminhoAnimacao: 'assets/gryffindor.riv',
      pontos: _recuperaPontos.recuperaPontos('gryffindor'),

    );
    var pontos = _recuperaPontos.pontos;

    print(pontos);
    print(gryffindor.pontos);

    Future.delayed(Duration(seconds: 3), () {
      _recuperaPontos.carregando = true;
      print(_recuperaPontos.carregando);
      print(_recuperaPontos.pontos);
    });

    return Observer(
      builder: (_) => Container(
        child: _recuperaPontos.carregando == false
            ? CircularProgressIndicator()
            : WidgetCasa(
                caminhoAnimacao: gryffindor.caminhoAnimacao,
                animacao: 'parado',
                pontos: _recuperaPontos.pontos),
      ),
    );
  }
}

