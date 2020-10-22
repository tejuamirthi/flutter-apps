import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/widgets/DetailCarousel.dart';
import 'package:travel_ui/widgets/HotelCarousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print(index);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(_icons[index],
            size: 25.0,
            color: _selectedIndex == index
            ? Theme.of(context).primaryColor
            : Color(0xFFB4C1C4)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 100.0),
              child: Text(
                "What would you like to find?",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((item) => _buildIcon(item.key))
                  .toList(),
            ),
            SizedBox(height: 20.0),
            DetailCarousel(),
            SizedBox(height: 20.0),
            HotelCarousel(),
          ],
        ),
      ),
    );
  }
}
