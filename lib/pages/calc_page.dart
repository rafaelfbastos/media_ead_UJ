import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_ead/controller/controller.dart';
import 'package:media_ead/helpers/debouncer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:media_ead/helpers/ui/my_colors.dart';
import 'package:media_ead/widgets/custom_footer.dart';
import 'package:media_ead/widgets/info_dialog.dart';
import 'package:media_ead/widgets/logo.dart';
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
    final deboucer = Debouncer(milliseconds: 300);
    final Uri unijorge = Uri.parse('https://www.unijorge.edu.br/');

    popUp() {
      final ava1 = widget._controller.ava1;
      final ava2 = widget._controller.ava2;
      final av2 = widget._controller.av2;
      final av1 = widget._controller.av1;
      final media = widget._controller.media;
      final av1Peso = av1 * 4;
      final av2Peso = av2! * 6;

      showDialog(
          context: context,
          builder: ((context) => Dialog(
                child: IntrinsicWidth(
                  child: IntrinsicHeight(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Cálculo da média:',
                                style: GoogleFonts.roboto(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  icon: const Icon(Icons.close))
                            ],
                          ),
                          const Divider(),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 25, right: 25, bottom: 25),
                              child: Column(
                                children: [
                                  Text(
                                    'Notas:',
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Math.tex(
                                          'Ava1 = ${ava1?.toStringAsFixed(2)}',
                                          mathStyle: MathStyle.text),
                                      Math.tex(
                                          'Ava2 = ${ava2?.toStringAsFixed(2)}',
                                          mathStyle: MathStyle.text),
                                      Math.tex(
                                          'Av2 = ${av2.toStringAsFixed(2)}',
                                          mathStyle: MathStyle.text),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'A nota da AV1 é obtida através da média aritmética entre a (AVA1) e a (AVA2).',
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Math.tex(
                                      'Av1 = \\frac{ $ava1 + $ava2}{2} = $av1',
                                      mathStyle: MathStyle.display),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Para calcular a média ponderada entre a AV1 e a AV2, onde a AV1 tem peso 4 e a AV2 tem peso 6, você pode seguir os seguintes passos:',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '''
                    
                          \u2022 Multiplique a nota da AV1 pelo seu peso (4).
                          
                          \u2022 Multiplique a nota da AV2 pelo seu peso (6).
                          
                          \u2022 Some os resultados obtidos nos passos 1 e 2.
                          
                          \u2022 Divida a soma pelo total dos pesos (4 + 6 = 10).
                          ''',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Math.tex(
                                      'M= \\frac{ $av1 \\cdot 4 + $av2 \\cdot 6 }{10}',
                                      mathStyle: MathStyle.display),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Math.tex(
                                      'M = \\frac{ $av1Peso + $av2Peso }{10} = ${media.toStringAsFixed(2)}',
                                      mathStyle: MathStyle.display),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              )));
    }

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
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
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
              flex: 4,
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
                      label: 'AV2:',
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
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () => popUp(),
                child: Tooltip(
                  verticalOffset: -1,
                  message: 'Entenda o cálculo',
                  child: Text(
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
