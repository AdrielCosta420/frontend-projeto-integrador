import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projeto_integrador4/routes.dart';
import 'package:routefly/routefly.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  void initState() {
    Routefly.navigate(routePaths.login);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Colors.blue.shade500,
          size: 70,
        ),
      ),
    );
  }
}
