import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:t20_worldcup/screens/highlightscreen.dart';
import 'package:t20_worldcup/screens/historyscreen.dart';
import 'package:t20_worldcup/screens/livscore.dart';
import 'package:t20_worldcup/screens/schedulescreen.dart';
import 'package:t20_worldcup/screens/teamsscreen.dart';
import 'package:t20_worldcup/screens/veneuesscreen.dart';

import '../widgets/homeitems.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T20 WorldCup'),
        backgroundColor: Colors.purple,
        actions: const [
          Icon(Icons.star),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.zero,
              child: Container(
                color: Colors.purple,
                child: DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.highlight , color: Colors.white, size: 100,),
                      Text(
                        'T20 World Cup',
                        style: TextStyle(color: Colors.white , fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Schedule'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScheduleScreen(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Venues'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => VenuesScreen(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HistoryScreen(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Teams'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Teamsscreen(),
                ));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Rate App'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            homeitems(
              iconData: Icons.access_time,
              title: 'Schedule',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ScheduleScreen())));
              },
            ),
            homeitems(
              iconData: Icons.location_on,
              title: 'Venues',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const VenuesScreen())));
              },
            ),
            homeitems(
              iconData: Icons.history,
              title: 'History',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const HistoryScreen())));
              },
            ),
            homeitems(
              iconData: Icons.group,
              title: 'Teams',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const Teamsscreen())));
              },
            ),
            homeitems(
              iconData: Icons.live_tv,
              title: 'LiveScore',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const LiveScore())));
              },
            ),
            homeitems(
              iconData: Icons.video_call,
              title: 'Highlights',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const HighlightScreen())));
              },
            )
          ],
        ),
      ),
    );
  }
}
