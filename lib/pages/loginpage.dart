import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flymovies/pages/mainpage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:window_manager/window_manager.dart';

const users = {'flymovies@gmail.com': 'flymovies'};

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => const Duration(milliseconds: 2250);

  @override
  void initState() {
    super.initState();
    resizeWindow();
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

  Future<String?> _authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Usuário não existe!';
      }
      if (users[data.name] != data.password) {
        return 'Senha não confere!';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
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
          flushbarTitleError: 'tefdsasdasd',
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
        // TODO: precisa ser um e-mail válido/
        if (value!.isEmpty) return 'E-mail inválido';
      },
      passwordValidator: (value) {
        // TODO: Validar a senha, com no mínimo 6 caracteres(letras e números)
        if (value!.isEmpty) return 'Senha inválida';
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
          builder: (context) => const MainPage(title: 'FlyMovies App'),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
