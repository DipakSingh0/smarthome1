import 'package:flutter/material.dart';
import 'package:new_app/pages/about.dart';
import 'package:new_app/pages/devices.dart';
import 'package:new_app/pages/logout.dart';
import 'package:new_app/pages/myinfo.dart';
import 'package:new_app/pages/notification.dart';
import 'package:new_app/pages/profile.dart';
import 'package:new_app/pages/room1.dart';
import 'package:new_app/pages/room2.dart';
import 'package:new_app/pages/room3.dart';
import 'package:new_app/pages/room4.dart';
import 'package:new_app/pages/room5.dart';
// import 'package:flutter_analog_clock/flutter_analog_clock.dart';
// import 'package:pretty_gauge/pretty_gauge.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0; // Index of the selected tab

  static const List<Widget> _pages = [
    DashboardWidget(),
    DevicesPage(),
    MyProfile(),
    About(),
    LogOut(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home-Smart-Home'),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyNotification()));
            },
          ),

          // ADMIN incon
          IconButton(
            onPressed: () {
              // Navigate to MyInfo page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyInfo(),
                ),
              );
            },
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'images/avisek.jpg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      
      drawer: const Drawer(
        child: DrawerContent(),
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.blue,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      // body: const DashboardWidget(),
    );
  }
}

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: const Text('Profile'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyProfile(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text('Conected Devices'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DevicesPage(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text('About'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const About(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text('LogOut'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LogOut(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class DashboardWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const DashboardWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // INSERTING WEATHER CONTENT HERE SO SPACING GIVEN HERE

      children: [
        const SizedBox(height: 50),
        const Divider(thickness: 1.5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              const Divider(thickness: 1.5),
              // const SizedBox(
              //   width: 200,
              //   height: 200,
              //   child: AnalogClockWidget(),
              // ),

              // Text(
              //   formattedTime,
              //   style: const TextStyle(
              //     fontSize: 18,
              //     color: Colors.lightBlue,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),

              // const Text(
              //   // formattedDate,
              //   // DateFormat.ABBR_MONTH_DAY,
              //   DateFormat.ABBR_MONTH_WEEKDAY_DAY,
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),

              //  const SizedBox(height: 20),

              const SizedBox(),
              // 2 rows, each containing two buttons
              
              //Living room
              ElevatedButton(
                onPressed: () {
                  // Navigate to Room 1
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LivingRoom(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(30.0), //Button size
                  backgroundColor: Colors.lightBlueAccent,
                  shadowColor: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text('LivingRoom'),
              ),

              const SizedBox(width: 20,), //Spacing between buttons
              
               //Dining room
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Dining_Room(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(30.0), //Batton size
                  backgroundColor: Colors.lightBlueAccent,
                  shadowColor: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text('DiningRoom'),
              ),

              const SizedBox(width: 20),

              //Hall
              ElevatedButton(
                onPressed: () {
                  // Navigate to Room 3
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Hall(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(30.0),
                  backgroundColor: Colors.lightBlueAccent,
                  shadowColor: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text('      Hall        '),
              ),
              
              const SizedBox(width: 25),
              

              //kitchen
              ElevatedButton(
                onPressed: () {
                  // Navigate to Room 4
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Kitchen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(30.0),
                  backgroundColor: Colors.lightBlueAccent,
                  shadowColor: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text('    Kitchen    '),
              ),

              const SizedBox(height: 20),

              //analog clock
              //  SizedBox(
              //   width: 175,
              //   height: 200,
              //   child: AnalogClock(
              //     dateTime: DateTime.now(),
              //     isKeepTime: false,
              //     hourHandColor: Colors.black,
              //     minuteHandColor: Colors.black,
              //     secondHandColor: Colors.red,
              //     hourNumberColor: Colors.black,
              //     dialBorderColor: Colors.lightGreen,
              //     dialColor: Colors.lightBlue,
              //     centerPointColor: Colors.lightBlue,
              //   ),

              // child: SizedBox(
              //   child: PrettyGauge(
              //       gaugeSize: 200,
              //       segments: [
              //           GaugeSegment('Low', 20, Colors.red),
              //           GaugeSegment('Medium', 40, Colors.orange),
              //           GaugeSegment('High', 40, Colors.green),
              //       ],
              //       currentValue: 46,
              //       displayWidget: const Text('Fuel in tank', style: TextStyle(fontSize: 12)),
              //   ),
              // ),
              // ),

              // const SizedBox(height: 20),

              const SizedBox( width: 20,), //Spacing between buttons
              

              //Animal farm
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Animal_Farm(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(30.0), //Batton size
                  backgroundColor: Colors.lightBlueAccent,
                  shadowColor: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text('AnimalFarm'),
              ),

              const SizedBox(height: 20),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     PrettyGauge(
              //       gaugeSize: 150,
              //       segments: [
              //         GaugeSegment('Low', 20, Colors.red),
              //         GaugeSegment('Medium', 40, Colors.orange),
              //         GaugeSegment('High', 40, Colors.green),
              //       ],
              //       currentValue: 46,
              //       displayWidget: const Text('Humidite of room',
              //           style: TextStyle(fontSize: 11.0)),
              //     ),

              //     const SizedBox(width: 20), //spacing between gauges

              //     PrettyGauge(
              //       gaugeSize: 150,
              //       segments: [
              //         GaugeSegment('Cold', 30, Colors.lightGreen),
              //         GaugeSegment('Normal', 30, Colors.blue),
              //         GaugeSegment('Hot', 40, Colors.red),
              //       ],
              //       currentValue: 25,
              //       displayWidget:
              //           const Text('Temperature', style: TextStyle(fontSize: 12)),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        const Divider(thickness: 1.5),
        
      ],
      
    );
    
  }
}
