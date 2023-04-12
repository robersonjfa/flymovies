import 'package:flutter/material.dart';
import 'package:flymovies/pages/loginpage.dart';
import 'package:splash_view/source/presentation/presentation.dart';
import 'package:window_manager/window_manager.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    resizeWindow();
  }

  resizeWindow() async {
    WindowOptions windowOptions = const WindowOptions(
      size: Size(350, 700),
      center: true,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
      windowButtonVisibility: false,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashView(
      duration: const Duration(seconds: 3),
      logo: Image.asset('assets/images/splash.png'),
      loadingIndicator: const CircularProgressIndicator(),
      done: Done(const LoginPage()),
    );
  }
}
