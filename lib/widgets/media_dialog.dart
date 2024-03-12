import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_ead/controller/controller.dart';

class MediaDialog extends StatelessWidget {
  final Controller _controller;
  const MediaDialog({ super.key, required Controller controller }):_controller=controller;

   @override
   Widget build(BuildContext context) {

     final ava1 = _controller.ava1;
      final ava2 = _controller.ava2;
      final av2 = _controller.av2;
      final av1 = _controller.av1;
      final media = _controller.media;
      final av1Peso = av1 * 4;
      final av2Peso = av2! * 6;

       return Dialog(
                child: IntrinsicWidth(
                  child: IntrinsicHeight(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          'A2 = ${av2.toStringAsFixed(2)}',
                                          mathStyle: MathStyle.text),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'A nota da A1 é obtida através da média aritmética entre a (AVA1) e a (AVA2).',
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Math.tex(
                                      'A1 = \\frac{ $ava1 + $ava2}{2} = $av1',
                                      mathStyle: MathStyle.display),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Para calcular a média ponderada entre a A1 e a A2, onde a A1 tem peso 4 e a A2 tem peso 6, você pode seguir os seguintes passos:',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      '\u2022 Multiplique a nota da A1 pelo seu peso (4).',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      '\u2022 Multiplique a nota da A2 pelo seu peso (6).',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      '\u2022 Some os resultados obtidos nos passos 1 e 2.',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      ' \u2022 Divida a soma pelo total dos pesos (4 + 6 = 10).',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.bold),
                                    ),
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
              );
  }
}