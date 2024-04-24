import 'package:flutter/material.dart';
import 'package:namer_app/src/calender_screen.dart';

class RenderedPage extends StatefulWidget {
  const RenderedPage({Key? key}) : super(key: key);

  @override
  State<RenderedPage> createState() => _MyRenderedPageState();
}

class _MyRenderedPageState extends State<RenderedPage> {
  static const proBonoRed =
      Color.fromARGB(255, 189, 42, 42); //find actual color
  static const appBackgroundColor = Color(0xFFE4E3D3);
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const CalendarScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    String getTitleText() {
      switch (_selectedIndex) {
        case 0:
          return "Home";
        case 1:
          return "Events";
        case 2:
          return "Club Info";
        case 3:
          return "Academics";
        case 4:
          return "Profile";
      }
      return "Missing Index";
    }

    return Scaffold(
      appBar: AppBar(
        // leading: Builder(
        //     builder: (context) => IconButton(
        //         icon: const Icon(Icons.dehaze),
        //         onPressed: () => Scaffold.of(context).openDrawer())),
        backgroundColor: proBonoRed,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          getTitleText(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      backgroundColor: appBackgroundColor, //Still determining background color
      endDrawer: Drawer(
        backgroundColor: proBonoRed,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 80,
            ),
            ListTile(
                title: const Text('Home',
                    style: TextStyle(color: Color(0xFFFFFFFF))),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                }),
            ListTile(
                title: const Text('TBD',
                    style: TextStyle(color: Color(0xFFFFFFFF))),
                selected: _selectedIndex == 1,
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                }),
            ListTile(
                title: const Text('TBD',
                    style: TextStyle(color: Color(0xFFFFFFFF))),
                selected: _selectedIndex == 2,
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context);
                }),
            ListTile(
                title: const Text('TBD',
                    style: TextStyle(color: Color(0xFFFFFFFF))),
                selected: _selectedIndex == 3,
                onTap: () {
                  _onItemTapped(3);
                  Navigator.pop(context);
                }),
            ListTile(
                title: const Text('Profile',
                    style: TextStyle(color: Color(0xFFFFFFFF))),
                selected: _selectedIndex == 4,
                onTap: () {
                  _onItemTapped(4);
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
