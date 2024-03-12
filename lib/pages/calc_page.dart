import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_ead/controller/controller.dart';
import 'package:media_ead/helpers/debouncer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:media_ead/helpers/ui/my_colors.dart';
import 'package:media_ead/widgets/custom_footer.dart';
import 'package:media_ead/widgets/info_dialog.dart';
import 'package:media_ead/widgets/logo.dart';
import 'package:media_ead/widgets/media_dialog.dart';
import 'package:media_ead/widgets/media_dialog_a3.dart';
import 'package:media_ead/widgets/nota_field.dart';
import 'package:media_ead/widgets/reprovado_dialog.dart';
import 'package:mobx/mobx.dart';

class CalcPage extends StatefulWidget {
  final Controller _controller;
  const CalcPage({super.key, required Controller controller})
      : _controller = controller;

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  final toDispose = <ReactionDisposer>[];

  @override
  void initState() {
    final reprovadoReaction =
        reaction((_) => widget._controller.reprovado, (reprovado) {
      showDialog(
          context: context, builder: (context) => const ReprovadoDialog());
    });

    toDispose.add(reprovadoReaction);
    super.initState();
  }

  @override
  void dispose() {
    toDispose.map((dispose) => dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deboucer = Debouncer(milliseconds: 300);
    final Uri unijorge = Uri.parse('https://www.unijorge.edu.br/');

    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        backgroundColor: MyColors.bage,
        title: Logo(url: unijorge),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            color: MyColors.vinho,
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const InfoDialog(),
            ),
          )
        ],
      ),
      body: Observer(
        builder: (context) => SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: AutoSizeText(
                  'Calculadora de média das matérias EAD',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoMono(
                      color: MyColors.bage,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                width: 300,
                child: Column(
                  children: [
                    NotaField(
                      label: 'AVA1:',
                      hintText:
                          "Nota mínima requerida ${widget._controller.ava1F.toStringAsFixed(2)}",
                      onChanged: (value) => deboucer.run(() {
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
                      onChanged: (value) => deboucer.run(() {
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
                      label: 'A2:',
                      hintText:
                          "Nota mínima requerida ${widget._controller.av2F.toStringAsFixed(2)}",
                      onChanged: (value) => deboucer.run(() {
                        final av2 = double.tryParse(value);
                        if (value.isEmpty) {
                          widget._controller.setAv2Null();
                        }
                        if (av2 != null) {
                          widget._controller.setAv2(av2);
                        }
                      }),
                    ),
                    (widget._controller.showAv3)
                        ? NotaField(
                            label: 'A3:',
                            hintText:
                                "Nota mínima requerida ${widget._controller.av2F.toStringAsFixed(2)}",
                            onChanged: (value) => deboucer.run(() {
                              final av3 = double.tryParse(value);
                              if (value.isEmpty) {
                                widget._controller.setAv3(null);
                              }
                              if (av3 != null) {
                                widget._controller.setAv3(av3);
                              }
                            }),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () => showDialog(
                    context: context,
                    builder: (context) => (widget._controller.av3 != null)
                        ? MediaDialogA3(controller: widget._controller)
                        : MediaDialog(controller: widget._controller)),
                child: Tooltip(
                  verticalOffset: -1,
                  message: 'Entenda o cálculo',
                  child: Column(
                    children: [
                      Text(
                        (widget._controller.showMedia)
                            ? "Média: ${widget._controller.media.toStringAsFixed(2)}"
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
                      Text(
                        (widget._controller.showMedia)
                            ? (widget._controller.media < 6)
                                ? 'Reprovado'
                                : 'Aprovado'
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
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(flex: 1, child: CustomFooter())
          ]),
        ),
      ),
    );
  }
}
