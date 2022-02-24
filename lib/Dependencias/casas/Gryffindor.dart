import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
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


    Future.delayed(Duration(seconds: 3), () {
      _recuperaPontos.carregando = true;

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
                caminhoAnimacao: gryffindor.caminhoAnimacao,
                animacao: 'parado',
                pontos: _recuperaPontos.pontos),
      ),
    );
  }
}
