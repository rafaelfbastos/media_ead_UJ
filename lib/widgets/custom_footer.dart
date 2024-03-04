import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_ead/helpers/ui/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.white24,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            'Desenvolvido por:',
            style: GoogleFonts.roboto(
              color: MyColors.bage,
              fontSize: 12,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: InkWell(
            child: Text(
              'Rafael Bastos',
              style: GoogleFonts.roboto(
                color: MyColors.bage,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              final Uri url = Uri.parse('https://github.com/rafaelfbastos');
              launchUrl(url);
            },
          ),
        )
      ],
    );
  }
}
