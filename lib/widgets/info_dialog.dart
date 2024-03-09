import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Informações',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(),
          ),
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close))
        ],
      ),
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            'Aplicativo desenvolvido para auxiliar os estudantes a calcular as notas das disciplinas EAD.',
            style:
                GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            'Utilização:',
            style:
                GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            '\u2714 Digite as notas AVA1, AVA2 e AV3 nos respectivos campos, e a média será calculada.',
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            '\u2714 À medida que as notas forem preenchidas, o aplicativo calcula o quanto será necessário tirar nas outras avaliações para passar.',
            style:
                GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            '\u2714 Ao digitar todas as notas, a média aparece. Caso queira ver como o cálculo foi feito, basta clicar na média.',
            style:
                GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
