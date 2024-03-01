import 'package:flutter/material.dart';
import 'package:media_ead/helpers/ui/ui_config.dart';
import 'package:media_ead/pages/calc_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {

  const AppWidget({ super.key });

   @override
   Widget build(BuildContext context) {
       return  MaterialApp(
      theme: UiConfig.theme,
      title: "Média EAD",
      routes: {
        '/':(context) =>  CalcPage(controller: context.read(),),
      },
    );
       
  }
}