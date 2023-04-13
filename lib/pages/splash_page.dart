import 'package:flutter/material.dart';
import 'package:flymovies/pages/login_page.dart';
import 'package:splash_view/source/presentation/presentation.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

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
      title: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            AppLocalizations.of(context)!.msg_loading,
            style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Broadway',
                fontWeight: FontWeight.bold),
          )),
      logo: Image.asset('assets/images/splash.png'),
      loadingIndicator: const CircularProgressIndicator(),
      done: Done(const LoginPage()),
    );
  }
}
