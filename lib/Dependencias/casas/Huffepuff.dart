import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:torneiohp/Dependencias/ConstrutorCasas.dart';
import 'package:torneiohp/Dependencias/RecuperaH.dart';

import '../WidgetCasa.dart';

class Huffepuff extends StatefulWidget {
  const Huffepuff({Key? key}) : super(key: key);

  @override
  _HuffepuffState createState() => _HuffepuffState();
}

class _HuffepuffState extends State<Huffepuff> {
  @override
  Widget build(BuildContext context) {
    final _recuperaPontos = Provider.of<RecuperaH>(context);

    ConstrutorCasas huffepuff = ConstrutorCasas(
      nome: 'huffepuff',
      caminhoAnimacao: 'assets/huffepuff.riv',
      pontos: _recuperaPontos.recuperaPontos('hufflepuff'),
    );
    var pontos = _recuperaPontos.pontos;

    print(pontos);
    print(huffepuff.pontos);

    Future.delayed(Duration(seconds: 3), () {
      _recuperaPontos.carregando = true;
      print(_recuperaPontos.carregando);
      print(_recuperaPontos.pontos);
    });

    return Observer(
      builder: (_) => Container(
        child: _recuperaPontos.carregando == false
            ? Container(
          height: 600,
          width: 600,
          child: RiveAnimation.asset(
            'assets/poison_loader.riv',
            fit: BoxFit.cover,
            animations: ['idle'],
          ),
        )
            : WidgetCasa(
            caminhoAnimacao: huffepuff.caminhoAnimacao,
            animacao: 'parado',
            pontos: _recuperaPontos.pontos),
      ),
    );
  }
}
