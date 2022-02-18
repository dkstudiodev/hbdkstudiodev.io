// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecuperaS.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecuperaS on _RecuperaSBase, Store {
  final _$pontosAtom = Atom(name: '_RecuperaSBase.pontos');

  @override
  dynamic get pontos {
    _$pontosAtom.reportRead();
    return super.pontos;
  }

  @override
  set pontos(dynamic value) {
    _$pontosAtom.reportWrite(value, super.pontos, () {
      super.pontos = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_RecuperaSBase.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$recuperaPontosAsyncAction =
      AsyncAction('_RecuperaSBase.recuperaPontos');

  @override
  Future recuperaPontos(String nomeCasa) {
    return _$recuperaPontosAsyncAction
        .run(() => super.recuperaPontos(nomeCasa));
  }

  final _$_RecuperaSBaseActionController =
      ActionController(name: '_RecuperaSBase');

  @override
  void ObservarCarregamento(bool isloading) {
    final _$actionInfo = _$_RecuperaSBaseActionController.startAction(
        name: '_RecuperaSBase.ObservarCarregamento');
    try {
      return super.ObservarCarregamento(isloading);
    } finally {
      _$_RecuperaSBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pontos: ${pontos},
carregando: ${carregando}
    ''';
  }
}
