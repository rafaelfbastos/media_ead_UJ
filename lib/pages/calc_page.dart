import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_ead/controller/controller.dart';
import 'package:media_ead/helpers/debouncer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:media_ead/helpers/ui/my_colors.dart';
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
    final _deboucer = Debouncer(milliseconds: 300);

    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        backgroundColor: MyColors.bage,
        title: Row(
          children: [
            SizedBox(
              height: 50,
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Calculadora de média das matérias EAD",
              style: GoogleFonts.bebasNeue(
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            )
          ],
        ),
      ),
      body: Observer(
        builder: (context) => Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  NotaField(
                    label: 'AVA1:',
                    hintText:
                        "Nota mínima requerida ${widget._controller.ava1F.toStringAsFixed(2)}",
                    onChanged: (value) => _deboucer.run(() {
                      final ava1 = double.tryParse(value);
                      if (value.isEmpty) {
                        widget._controller.setAva1Null();
                      }
                      if (ava1 != null) {
                        widget._controller.setAva1(ava1);
                      }
                    }),
                  ),
                  NotaField(
                    label: 'AVA2:',
                    hintText:
                        "Nota mínima requerida ${widget._controller.ava2F.toStringAsFixed(2)}",
                    onChanged: (value) => _deboucer.run(() {
                      final ava2 = double.tryParse(value);
                      if (value.isEmpty) {
                        widget._controller.setAva2Null();
                      }
                      if (ava2 != null) {
                        widget._controller.setAva2(ava2);
                      }
                    }),
                  ),
                  NotaField(
                    label: 'AV2:',
                    hintText:
                        "Nota mínima requerida ${widget._controller.av2F.toStringAsFixed(2)}",
                    onChanged: (value) => _deboucer.run(() {
                      final av2 = double.tryParse(value);
                      if (value.isEmpty) {
                        widget._controller.setAv2Null();
                      }
                      if (av2 != null) {
                        widget._controller.setAv2(av2);
                      }
                    }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                (widget._controller.showMedia)
                    ? "Media: ${widget._controller.media.toStringAsFixed(2)}"
                    : "",
                style: GoogleFonts.bebasNeue(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: (widget._controller.media < 6)
                        ? MyColors.vermelho
                        : MyColors.azulado,
                    shadows: [
                      const Shadow(
                          color: Colors.black45,
                          offset: Offset(1, 2),
                          blurRadius: 1)
                    ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
