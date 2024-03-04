// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_ead/helpers/ui/my_colors.dart';

class NotaField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? label;
  final String hintText;
  const NotaField({
    Key? key,
    this.onChanged,
    required this.hintText,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              label ?? "",
              style: GoogleFonts.bebasNeue(
                color: MyColors.bage,
                fontSize: 18,
              ),
            ),
          ),
          TextField(
              style: GoogleFonts.bebasNeue(color: MyColors.vinho),
              decoration: InputDecoration(
                hintText: hintText,
                fillColor: MyColors.bage,
                filled: true,
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              onChanged: onChanged),
        ],
      ),
    );
  }
}
