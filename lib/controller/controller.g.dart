// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  Computed<double>? _$av1Computed;

  @override
  double get av1 => (_$av1Computed ??=
          Computed<double>(() => super.av1, name: 'ControllerBase.av1'))
      .value;
  Computed<double>? _$mediaComputed;

  @override
  double get media => (_$mediaComputed ??=
          Computed<double>(() => super.media, name: 'ControllerBase.media'))
      .value;

  late final _$_ava1Atom = Atom(name: 'ControllerBase._ava1', context: context);

  double? get ava1 {
    _$_ava1Atom.reportRead();
    return super._ava1;
  }

  @override
  double? get _ava1 => ava1;

  @override
  set _ava1(double? value) {
    _$_ava1Atom.reportWrite(value, super._ava1, () {
      super._ava1 = value;
    });
  }

  late final _$_ava2Atom = Atom(name: 'ControllerBase._ava2', context: context);

  double? get ava2 {
    _$_ava2Atom.reportRead();
    return super._ava2;
  }

  @override
  double? get _ava2 => ava2;

  @override
  set _ava2(double? value) {
    _$_ava2Atom.reportWrite(value, super._ava2, () {
      super._ava2 = value;
    });
  }

  late final _$_av2Atom = Atom(name: 'ControllerBase._av2', context: context);

  double? get av2 {
    _$_av2Atom.reportRead();
    return super._av2;
  }

  @override
  double? get _av2 => av2;

  @override
  set _av2(double? value) {
    _$_av2Atom.reportWrite(value, super._av2, () {
      super._av2 = value;
    });
  }

  late final _$_ava1FAtom =
      Atom(name: 'ControllerBase._ava1F', context: context);

  double get ava1F {
    _$_ava1FAtom.reportRead();
    return super._ava1F;
  }

  @override
  double get _ava1F => ava1F;

  @override
  set _ava1F(double value) {
    _$_ava1FAtom.reportWrite(value, super._ava1F, () {
      super._ava1F = value;
    });
  }

  late final _$_ava2FAtom =
      Atom(name: 'ControllerBase._ava2F', context: context);

  double get ava2F {
    _$_ava2FAtom.reportRead();
    return super._ava2F;
  }

  @override
  double get _ava2F => ava2F;

  @override
  set _ava2F(double value) {
    _$_ava2FAtom.reportWrite(value, super._ava2F, () {
      super._ava2F = value;
    });
  }

  late final _$_av2FAtom = Atom(name: 'ControllerBase._av2F', context: context);

  double get av2F {
    _$_av2FAtom.reportRead();
    return super._av2F;
  }

  @override
  double get _av2F => av2F;

  @override
  set _av2F(double value) {
    _$_av2FAtom.reportWrite(value, super._av2F, () {
      super._av2F = value;
    });
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  dynamic setAva1(double ava1) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setAva1');
    try {
      return super.setAva1(ava1);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAva2(double ava2) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setAva2');
    try {
      return super.setAva2(ava2);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAv2(double av2) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setAv2');
    try {
      return super.setAv2(av2);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
av1: ${av1},
media: ${media}
    ''';
  }
}
