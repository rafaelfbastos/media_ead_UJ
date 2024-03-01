
import 'package:flutter/material.dart';
import 'package:media_ead/app_widget.dart';
import 'package:media_ead/controller/controller.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {

  const AppModule({ super.key });

   @override
   Widget build(BuildContext context) {
       return Provider<Controller>(
        create: (context)=>Controller(),
       child: const AppWidget(),
       ) ;
  }
}