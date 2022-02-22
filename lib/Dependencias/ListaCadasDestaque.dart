import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'ConstrutorCasas.dart';
import 'ControleLista.dart';


class ListaCasaDestaque extends StatefulWidget {
  const ListaCasaDestaque({Key? key}) : super(key: key);

  @override
  _ListaCasaDestaqueState createState() => _ListaCasaDestaqueState();
}

class _ListaCasaDestaqueState extends State<ListaCasaDestaque> {
  @override
  Widget build(BuildContext context) {

    final _controleListaCasa = Provider.of<ControleLista>(context);

    return FutureBuilder<List<ConstrutorCasas>>(
      future: _controleListaCasa.ListaCasas(),
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
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, indice) {
                List<ConstrutorCasas>? listaCasas = snapshot.data;
                ConstrutorCasas casas = listaCasas![indice];
                return Container(
                  height: 400,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: RiveAnimation.asset(
                      casas.caminhoAnimacao,
                      fit: BoxFit.cover,
                      animations: ['pulsando'],
                    ),
                  ),
                );
              },
            );
        }
      },
    );
  }
}
