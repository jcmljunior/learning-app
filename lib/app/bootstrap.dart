import 'package:flutter/material.dart';

import 'controller/bootstrap_controller.dart';
import 'view/splash_screen_view.dart';
import 'view/initial_view.dart';

class Bootstrap extends StatefulWidget {
  const Bootstrap({super.key});

  @override
  State<StatefulWidget> createState() => BootstrapState();
}

class BootstrapState extends State<Bootstrap> {
  final BootstrapController _controller = BootstrapController();

  @override
  initState() {
    super.initState();

    // Inicialização de tema.
    updateTheme(
      _controller.colorSelected,
      _controller.useMaterial3,
      _controller.useLightMode,
    );
  }

  bool getUseLightMode() {
    return _controller.useLightMode;
  }

  int getColorSelected() {
    return _controller.colorSelected;
  }

  void updateTheme(int colorIndex, bool useMaterial3, bool useLightMode) {
    setState(() {
      _controller.themeData =
          _controller.updateTheme(colorIndex, useMaterial3, useLightMode);
    });
  }

  void handleBrightnessChange() {
    setState(() {
      _controller.handleBrightnessChange();
    });
  }

  void handleMaterialVersionChange() {
    setState(() {
      _controller.handleMaterialVersionChange();
    });
  }

  void handleColorSelect(int value) {
    setState(() {
      _controller.handleColorSelect(value);
    });
  }

  Map<String, WidgetBuilder> getAllRoutes() {
    return <String, WidgetBuilder>{
      '/': (BuildContext context) => const SplashScreenView(),
      '/initial': (BuildContext context) => const InitialView(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: getUseLightMode() ? ThemeMode.light : ThemeMode.dark,
      theme: _controller.themeData,
      initialRoute: '/',
      routes: getAllRoutes(),
    );
  }
}
