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
  double _ava1F = 7.0;

  @readonly
  double _ava2F = 7.0;

  @readonly
  double _av2F = 7.0;

  @computed
  double get av1 => ((_ava1 ?? 0.0) + (_ava2 ?? 0.0)) / 2;

  @computed
  double get media => av1 * 0.4 + (_av2 ?? 0.0) * 0.6;

  @action
  setAva1(double ava1) {
    _ava1 = ava1;

    if (_ava2 == null && _av2 == null) {
      final x = (7 - ava1 * 0.2) / (0.8);
      _ava2F = x;
      _av2F = x;
    } else if (_ava2 != null && _av2 == null) {
      final x = (7 - av1 * 0.4) / 0.6;
      _av2F = x;
    }
  }

  @action
  setAva2(double ava2) {
    _ava2 = ava2;
    if (_ava1 == null && _av2 == null) {
      final x = (7 - ava2 * 0.2) / (0.8);
      _ava1F = x;
      _av2F = x;
    } else if (_ava1 != null && _av2 == null) {
      final x = (7 - av1 * 0.4) / 0.6;
      _ava1F = x;
    }
  }

  @action
  setAv2(double av2) {
    _av2 = av2;
    if (_ava1 == null && _ava2 == null) {
      final x = (7 - av2 * 0.6) / 0.4;
      _ava1F = x;
      _ava2F = x;
    } else if (_ava1 != null && _av2 == null) {
      final x = (7 - av1 * 0.4) / 0.6;
      _ava1F = x;
    }
  }

  @action
  av2Null() => _av2 = null;
}
