import 'package:flutter/material.dart';
import 'package:flymovies/models/user.dart';
import 'package:flymovies/pages/actors_page.dart';
import 'package:flymovies/pages/movies_page.dart';
import 'package:flymovies/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title, this.user});

  final String title;
  final User? user;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;
  final List<Widget> _pages = const [
    ActorsPage(),
    MoviesPage(),
    SettingsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title} - Bem-vindo(a): ${widget.user!.name}"),
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        backgroundColor: Colors.green,
        fixedColor: Colors.white,
        iconSize: 30,
        currentIndex: _currentPage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Actors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
