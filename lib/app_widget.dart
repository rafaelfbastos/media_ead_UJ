import 'package:flutter/material.dart';
import 'package:media_ead/helpers/ui/ui_config.dart';
import 'package:media_ead/pages/calc_page.dart';
import 'package:media_ead/pages/splash_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {

  const AppWidget({ super.key });

   @override
   Widget build(BuildContext context) {
       return  MaterialApp(
        debugShowCheckedModeBanner:false ,
      theme: UiConfig.theme,
      title: "Média EAD",
      routes: {
        '/':(context) =>  const SplashPage(),
        '/calculadora':(context) =>  CalcPage(controller: context.read(),),
      },
    );
    
       
  }
}