import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'ControleLista.dart';
import 'ListaCadasDestaque.dart';

class WidgetCasaDestaque extends StatefulWidget {
  const WidgetCasaDestaque({Key? key}) : super(key: key);

  @override
  _WidgetCasaDestaqueState createState() => _WidgetCasaDestaqueState();
}

class _WidgetCasaDestaqueState extends State<WidgetCasaDestaque> {
  @override
  Widget build(BuildContext context) {
    final _controleListaCasa = Provider.of<ControleLista>(context);

    Future.delayed(Duration(seconds: 3), () {
      _controleListaCasa.carregando = true;
      print('trocou  $_controleListaCasa.carregando');
    });
    return Observer(
      builder: (_) => Container(
          child: _controleListaCasa.carregando == false
              ? Container(
            height: 200,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: RiveAnimation.asset(
                'assets/poison_loader.riv',
                fit: BoxFit.cover,
                animations: ['idle'],
              ),
            ),
          )
              : ListaCasaDestaque()),
    );
  }
}
