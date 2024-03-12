import 'package:flutter/material.dart';
import 'package:media_ead/widgets/download_button.dart';

class ReprovadoDialog extends StatelessWidget {
  const ReprovadoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Importante'),
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close))
        ],
      ),
      children: const [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Alunos que obtiverem nota 0 na A1 serão automaticamente reprovados. Para mais informações, consulte o documento abaixo.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Center(
          child: DownloadButton(
            width: 300,
            file: 'criterios-de-avaliacao.pdf',
            icon: 'pdf-download-icon.png',
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
