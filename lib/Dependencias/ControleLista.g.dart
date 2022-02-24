// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ControleLista.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControleLista on _ControleListaBase, Store {
  final _$carregandoAtom = Atom(name: '_ControleListaBase.carregando');

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

  final _$primeiraCasaAtom = Atom(name: '_ControleListaBase.primeiraCasa');

  @override
  dynamic get primeiraCasa {
    _$primeiraCasaAtom.reportRead();
    return super.primeiraCasa;
  }

  @override
  set primeiraCasa(dynamic value) {
    _$primeiraCasaAtom.reportWrite(value, super.primeiraCasa, () {
      super.primeiraCasa = value;
    });
  }

  final _$ListaCasasAsyncAction = AsyncAction('_ControleListaBase.ListaCasas');

  @override
  Future<ConstrutorCasas> ListaCasas() {
    return _$ListaCasasAsyncAction.run(() => super.ListaCasas());
  }

  @override
  String toString() {
    return '''
carregando: ${carregando},
primeiraCasa: ${primeiraCasa}
    ''';
  }
}
