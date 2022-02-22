import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:torneiohp/Dependencias/ConstrutorCasas.dart';
import 'package:torneiohp/Dependencias/RecuperaH.dart';

import '../RecuperaG.dart';
import '../RecuperaR.dart';
import '../WidgetCasa.dart';

class Ravenclaw extends StatefulWidget {
  const Ravenclaw({Key? key}) : super(key: key);

  @override
  _RavenclawState createState() => _RavenclawState();
}

class _RavenclawState extends State<Ravenclaw> {
  @override
  Widget build(BuildContext context) {
    final _recuperaPontos = Provider.of<RecuperaR>(context);

    ConstrutorCasas ravenclaw = ConstrutorCasas(
      nome: 'ravenclaw',
      caminhoAnimacao: 'assets/ravenclaw.riv',
      pontos: _recuperaPontos.recuperaPontos('ravenclaw'),
    );
    var pontos = _recuperaPontos.pontos;

    print(pontos);
    print(ravenclaw.pontos);

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
            caminhoAnimacao: ravenclaw.caminhoAnimacao,
            animacao: 'parado',
            pontos: _recuperaPontos.pontos),
      ),
    );
  }
}
