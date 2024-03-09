import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_ead/helpers/ui/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Logo extends StatelessWidget {
  final Uri url;
  const Logo({ super.key, required this.url });

   @override
   Widget build(BuildContext context) {
       return InkWell(
          onTap: () => launchUrl(url),
          child: IntrinsicWidth(
            child: Row(
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
                  "UNIJORGE",
                  style: GoogleFonts.bebasNeue(
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                )
              ],
            ),
          ),
        );
  }
}