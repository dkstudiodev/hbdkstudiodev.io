import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:torneiohp/Dependencias/ConstrutorCasas.dart';
import 'package:torneiohp/Dependencias/RecuperaH.dart';
import 'package:torneiohp/Dependencias/RecuperaS.dart';

import '../RecuperaG.dart';
import '../WidgetCasa.dart';

class Slytherin extends StatefulWidget {
  const Slytherin({Key? key}) : super(key: key);

  @override
  _SlytherinState createState() => _SlytherinState();
}

class _SlytherinState extends State<Slytherin> {
  @override
  Widget build(BuildContext context) {
    final _recuperaPontos = Provider.of<RecuperaS>(context);

    ConstrutorCasas slytherin = ConstrutorCasas(
      nome: 'slytherin',
      caminhoAnimacao: 'assets/slytherin.riv',
      pontos: _recuperaPontos.recuperaPontos('slytherin'),
    );
    var pontos = _recuperaPontos.pontos;

    print(pontos);
    print(slytherin.pontos);

    Future.delayed(Duration(seconds: 3), () {
      _recuperaPontos.carregando = true;
      print(_recuperaPontos.carregando);
      print(_recuperaPontos.pontos);
    });

    return Observer(
      builder: (_) => Container(
        child: _recuperaPontos.carregando == false
            ? Container(
          height: 300,
          width: 300,
          child: RiveAnimation.asset(
            'assets/poison_loader.riv',
            fit: BoxFit.cover,
            animations: ['idle'],
          ),
        )

            : WidgetCasa(
            caminhoAnimacao: slytherin.caminhoAnimacao,
            animacao: 'parado',
            pontos: _recuperaPontos.pontos),
      ),
    );
  }
}
