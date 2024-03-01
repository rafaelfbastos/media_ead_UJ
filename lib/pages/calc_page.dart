import 'package:flutter/material.dart';
import 'package:media_ead/controller/controller.dart';
import 'package:media_ead/helpers/debouncer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:media_ead/widgets/nota_field.dart';

class CalcPage extends StatefulWidget {
  final Controller _controller;
  const CalcPage({super.key, required Controller controller})
      : _controller = controller;

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  @override
  Widget build(BuildContext context) {
    final _deboucer = Debouncer(milliseconds: 500);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular media'),
      ),
      body: Observer(
        builder: (context) => Column(children: [
          NotaField(
            hintText: widget._controller.ava1F.toStringAsFixed(2),
            onChanged: (value) => _deboucer.run(() {
              final ava1 = double.tryParse(value);
              if (ava1 != null) {
                widget._controller.setAva1(ava1);
              } else {
                widget._controller.setAva1(0.0);
              }
            }),
          ),
          NotaField(
           hintText: widget._controller.ava2F.toStringAsFixed(2),
            onChanged: (value) => _deboucer.run(() {
              final ava2 = double.tryParse(value);
              if (ava2 != null) {
                widget._controller.setAva2(ava2);
              } else {
                widget._controller.setAva2(0.0);
              }
            }),
          ),
          NotaField(
           hintText: widget._controller.av2F.toStringAsFixed(2),
            onChanged: (value) => _deboucer.run(() {
              final av2 = double.tryParse(value);
              if (av2 != null) {
                widget._controller.setAv2(av2);
              } else {
                widget._controller.setAv2(0.0);
              }
            }),
          ),
          Text(widget._controller.media.toStringAsFixed(2))
        ]),
      ),
    );
  }
}
