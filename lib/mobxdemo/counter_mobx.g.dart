// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MCounter on MCounterBase, Store {
  final _$counterAtom = Atom(name: 'MCounterBase.counter');

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  final _$MCounterBaseActionController = ActionController(name: 'MCounterBase');

  @override
  void incream() {
    final _$actionInfo = _$MCounterBaseActionController.startAction(
        name: 'MCounterBase.incream');
    try {
      return super.incream();
    } finally {
      _$MCounterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter}
    ''';
  }
}
