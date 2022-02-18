import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class WidgetCasa extends StatelessWidget {

  final dynamic caminhoAnimacao;
  final dynamic animacao;
  final dynamic pontos;

  const WidgetCasa({

    required this.caminhoAnimacao,
    required this.animacao,
    required this.pontos,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          height: 250,
          width: 250,
          child: RiveAnimation.asset(
            caminhoAnimacao!,
            animations: [animacao],
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          child: Text(this.pontos.toString(),
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),),
        )
      ],
    );

  }
}
