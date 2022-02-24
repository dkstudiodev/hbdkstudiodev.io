import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'ControleLista.dart';
import 'ListaCasaDestaque.dart';

class WidgetCasaDestaque extends StatefulWidget {



  const WidgetCasaDestaque({Key? key}) : super(key: key);

  @override
  _WidgetCasaDestaqueState createState() => _WidgetCasaDestaqueState();
}

class _WidgetCasaDestaqueState extends State<WidgetCasaDestaque> {
  @override
  Widget build(BuildContext context) {
    final _controleListaCasa = Provider.of<ControleLista>(context);
    final functionControleLista = _controleListaCasa.ListaCasas();

    return Observer(
      builder: (_) => Container(
          child: _controleListaCasa.carregando == false
              ? Container(
            height: 300,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: RiveAnimation.asset(
                'assets/trophyhovering.riv',
                fit: BoxFit.cover,
                animations: ['pesquisando'],
              ),
            ),
          )
              : ListaCasaDestaque(functionControleLista: functionControleLista,)),
    );
  }
}
