import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flymovies/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Use temp variable to only update color when press dialog 'submit' button
  ColorSwatch? _tempMainColor;
  SharedPreferences? prefs;

  loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    loadPrefs();
  }

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('CANCEL'),
            ),
            TextButton(
              child: const Text('SAVE'),
              onPressed: () {
                Navigator.of(context).pop();
                prefs!.setInt('color', _tempMainColor!.value);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Settings",
                  ),
                ],
              ),
              ListTile(
                leading: const Icon(Icons.color_lens),
                tileColor: Colors.orange,
                title: Text("Primary Color"),
                onTap: () {
                  _openDialog(
                      "Main Color picker",
                      MaterialColorPicker(
                        allowShades: false,
                        selectedColor: Colors.green,
                        onMainColorChange: (color) =>
                            setState(() => _tempMainColor = color),
                      ));
                },
              ),
              const Divider(),
              ElevatedButton(
                child:
                    Row(children: const [Icon(Icons.logout), Text("Logout")]),
                onPressed: () => {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()))
                },
              ),
            ])));
  }
}
