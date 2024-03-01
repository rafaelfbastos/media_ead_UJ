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
    } else if (_ava2 != null && _av2 == null) {}
  }

  @action
  setAva2(double ava2) => _ava2 = ava2;

  @action
  setAv2(double av2) => _av2 = av2;
}
