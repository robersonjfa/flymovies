import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flymovies/daos/database.dart';
import 'package:flymovies/models/user.dart';
import 'package:flymovies/pages/main_page.dart';
import 'package:flymovies/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:window_manager/window_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => const Duration(milliseconds: 2250);
  late final db;
  User? user;

  @override
  void initState() {
    initDb();
    super.initState();
    resizeWindow();
  }

  initDb() async {
    db = await $FloorAppDatabase
        .databaseBuilder(Utils.getDatabasePath())
        .build();
  }

  resizeWindow() async {
    WindowOptions windowOptions = const WindowOptions(
        titleBarStyle: TitleBarStyle.normal,
        windowButtonVisibility: true,
        center: true,
        size: Size(800, 800),
        skipTaskbar: false);

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.maximize();
      await windowManager.focus();
    });
  }

  Future<String?> _authUser(LoginData data) async {
    return Future.delayed(loginTime).then((_) async {
      user = await db.userDao.findUserByEmail(data.name);
      if (user == null || user!.password != data.password) {
        return 'Usuário e/ou senha inválidos!';
      } else {
        return null;
      }
    });
  }

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      User u = db.userDao.findUserByEmail(name);
      if (u != null) {
        return 'Usuário não existe!';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'FLYMOVIES',
      messages: LoginMessages(
          userHint: 'E-mail',
          passwordHint: 'Senha',
          flushbarTitleError: 'Erro Login',
          confirmPasswordHint: 'Confirmar senha',
          forgotPasswordButton: 'Esqueceu a senha?',
          confirmPasswordError: 'Senha não confere!',
          loginButton: 'Login',
          signupButton: 'Cadastrar-se',
          providersTitleFirst: 'Logar com:'),
      logo: const AssetImage('assets/images/splash.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      userValidator: (value) {
        if (value!.isEmpty) return 'E-mail inválido';
        return null;
      },
      passwordValidator: (value) {
        if (value!.isEmpty) return 'Senha inválida';
        return null;
      },
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          callback: () async {
            await Future.delayed(loginTime);
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.facebookF,
          label: 'Facebook',
          callback: () async {
            await Future.delayed(loginTime);
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.linkedinIn,
          label: 'Linkedin',
          callback: () async {
            await Future.delayed(loginTime);
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.githubAlt,
          label: 'GitHub',
          callback: () async {
            await Future.delayed(loginTime);
            return null;
          },
        ),
      ],
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MainPage(title: 'FlyMovies App', user: user),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
