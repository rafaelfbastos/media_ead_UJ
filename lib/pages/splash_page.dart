import 'package:flutter/material.dart';
import 'package:media_ead/helpers/ui/my_colors.dart';
import 'package:media_ead/pages/calc_page.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final nav = Navigator.of(context);
      await Future.delayed(const Duration(seconds: 2));
      nav.pushReplacement(PageRouteBuilder(
          pageBuilder: (context, animation, secondAnimation) =>
              CalcPage(controller: context.read()),
          settings: const RouteSettings(name: '/calculadora')));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.bage,
      child: Hero(tag: 'logo', child: Image.asset("assets/logo.png")),
    );
  }
}
