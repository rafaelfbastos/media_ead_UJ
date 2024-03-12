// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @readonly
  double? _ava1;

  @readonly
  double? _ava2;

  @readonly
  double? _av2;

  @readonly
  double? _av3;

  @readonly
  double _ava1F = 6.0;

  @readonly
  double _ava2F = 6.0;

  @readonly
  double _av2F = 6.0;

  @computed
  double get av1 => ((_ava1 ?? 0.0) + (_ava2 ?? 0.0)) / 2;

  @computed
  bool get reprovado =>
      (_ava1 == 0 && _ava1 != null && _ava2 == 0 && _ava2 != null);

  @computed
  double get media {
    if (_av3 != null) {
      return av1 * 0.4 + (_av3 ?? 0.0) * 0.6;
    }
    return av1 * 0.4 + (_av2 ?? 0.0) * 0.6;
  }

  @computed
  bool get showMedia => (_ava1 != null && _ava2 != null && _av2 != null);

  @computed
  bool get showAv3 {
    final media = av1 * 0.4 + (_av2 ?? 0.0) * 0.6;

    return (media < 6 && _ava1 != null && _ava2 != null && _av2 != null);
  }

  @action
  setAva1(double ava1) {
    _ava1 = ava1;

    if (_ava2 == null && _av2 == null) {
      final x = (6 - ava1 * 0.2) / (0.8);
      _ava2F = x;
      _av2F = x;
    } else if (_ava2 != null && _av2 == null) {
      final x = (6 - av1 * 0.4) / 0.6;
      _av2F = x;
    } else if (_ava2 == null && _av2 != null) {
      final x = (6 - 0.6 * _av2! - 0.2 * ava1) / 0.2;
      _ava2F = x;
    }
  }

  @action
  setAva2(double ava2) {
    _ava2 = ava2;
    if (_ava1 == null && _av2 == null) {
      final x = (6 - ava2 * 0.2) / (0.8);
      _ava1F = x;
      _av2F = x;
    } else if (_ava1 != null && _av2 == null) {
      final x = (6 - av1 * 0.4) / 0.6;
      _av2F = x;
    } else if (_ava1 == null && _av2 != null) {
      final x = (6 - 0.6 * _av2! - 0.2 * ava2) / 0.2;
      _ava1F = x;
    }
  }

  @action
  setAv2(double av2) {
    _av2 = av2;
    if (_ava1 == null && _ava2 == null) {
      final x = (6 - av2 * 0.6) / 0.4;
      _ava1F = x;
      _ava2F = x;
    } else if (_ava1 != null && _ava2 == null) {
      final x = (6 - _ava1! * 0.2 - av2 * 0.6) / 0.2;
      _ava2F = x;
    } else if (_ava1 == null && _ava2 != null) {
      final x = (6 - _ava2! * 0.2 - av2 * 0.6) / 0.2;
      _ava1F = x;
    }
  }

  @action
  setAv2Null() {
    _av2 = null;
    _av3 = null;
    if (_ava1 == null && _ava2 == null) {
      _av2F = 6;
      _ava1F = 6;
      _ava2F = 6;
    } else if (_ava1 != null && _ava2 == null) {
      final x = (6 - _ava1! * 0.2) / 0.8;
      _ava2F = x;
      _av2F = x;
    } else if (_ava1 == null && _ava2 != null) {
      final x = (6 - _ava2! * 0.2) / 0.8;
      _ava1F = x;
      _av2F = x;
    } else {
      final x = (6 - av1 * 0.4) / 0.6;
      _av2F = x;
    }
  }

  @action
  setAva1Null() {
    _ava1 = null;
    _av3 = null;
    if (_ava2 == null && _av2 == null) {
      _av2F = 6;
      _ava1F = 6;
      _ava2F = 6;
    } else if (_ava2 != null && _av2 == null) {
      final x = (6 - _ava1! * 0.2) / 0.8;
      _av2F = x;
      _ava1F = x;
    } else if (_ava2 == null && _av2 != null) {
      final x = (6 - _av2! * 0.6) / 0.4;
      _ava1F = x;
      _ava2F = x;
    } else {
      final x = (6 - _ava2! * 0.2 - _av2! * 0.6) / 0.2;
      _ava1F = x;
    }
  }

  @action
  setAva2Null() {
    _ava2 = null;
    _av3 = null;
    if (_ava1 == null && _av2 == null) {
      _av2F = 6;
      _ava1F = 6;
      _ava2F = 6;
    } else if (_ava1 != null && _av2 == null) {
      final x = (6 - _ava1! * 0.2) / 0.8;
      _av2F = x;
      _ava2F = x;
    } else if (_ava1 == null && _av2 != null) {
      final x = (6 - _av2! * 0.6) / 0.4;
      _ava1F = x;
      _ava2F = x;
    } else {
      final x = (6 - _ava1! * 0.2 - _av2! * 0.6) / 0.2;
      _ava2F = x;
    }
  }

  @action
  setAv3(double? av3) {
    _av3 = av3;
  }

  @action
  reset() {
    _ava1 = null;
    _ava2 = null;
    _av2 = null;
    _av3 = null;
    _ava1F = 6.0;
    _ava2F = 6.0;
    _av2F = 6.0;
  }
}
