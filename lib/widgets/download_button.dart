import 'dart:html' as html;
import 'package:flutter/material.dart';

class DownloadButton extends StatelessWidget {
  final double? width;
  final String file;
  final Color? color;
  final String icon;

  const DownloadButton(
      {super.key,
      this.width,
      required this.file,
      this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width,
      child: ListTile(
        onTap: () {
          html.AnchorElement(href: 'assets/$file')
            ..setAttribute('download', file)
            ..click();
        },
        leading: Image.asset(
          'assets/$icon',
          height: 40,
        ),
        title: Text(
          file,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
