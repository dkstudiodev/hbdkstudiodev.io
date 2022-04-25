// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MonitoraPontos.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MonitoraPontos on _MonitoraPontosBase, Store {
  final _$MonitoraPontosDBAsyncAction =
      AsyncAction('_MonitoraPontosBase.MonitoraPontosDB');

  @override
  Future MonitoraPontosDB() {
    return _$MonitoraPontosDBAsyncAction.run(() => super.MonitoraPontosDB());
  }

  final _$_MonitoraPontosBaseActionController =
      ActionController(name: '_MonitoraPontosBase');

  @override
  void showToast(String nome, int pontos, String casa) {
    final _$actionInfo = _$_MonitoraPontosBaseActionController.startAction(
        name: '_MonitoraPontosBase.showToast');
    try {
      return super.showToast(nome, pontos, casa);
    } finally {
      _$_MonitoraPontosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
