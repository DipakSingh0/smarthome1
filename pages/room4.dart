
import 'package:flutter/material.dart';

class Kitchen extends StatelessWidget {
  const Kitchen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Kitchen'),
        backgroundColor: Colors.indigo[400],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           

            

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Bulb Button
                BulbButton(),

                SizedBox(width: 20.0), // Adjust the spacing between buttons

                // Fan Button
                BulbButton(),
              ],
            ),

            SizedBox(height: 20.0),

            // Smart TV Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SmartTVButton(),
                
                SizedBox(height: 20.0),
                SizedBox(width: 20.0),

                
                // Air Conditioner Button
                FanButton(),
              SizedBox(height: 20.0),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BulbButton extends StatefulWidget {
  const BulbButton({Key? key}) : super(key: key);

  @override
  _BulbButtonState createState() => _BulbButtonState();
}

class _BulbButtonState extends State<BulbButton> {
  bool isBulbOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: isBulbOn ? Colors.blue : Colors.grey[300],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.lightbulb_outline,
            size: 50.0,
            color: Colors.black,
          ),
          const SizedBox(height: 10.0),
          Text(
            isBulbOn ? 'Bulb ON' : 'Bulb OFF',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              // Toggle the state when the "Toggle" text is pressed
              setState(() {
                isBulbOn = !isBulbOn;
              });
              // Add your logic for ON/OFF functionality here
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'ON/OFF',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FanButton extends StatefulWidget {
  const FanButton({Key? key}) : super(key: key);

  @override
  _FanButtonState createState() => _FanButtonState();
}

class _FanButtonState extends State<FanButton> {
  bool isFanOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: isFanOn ? Colors.green : Colors.grey[300],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.ac_unit,
            size: 50.0,
            color: Colors.black,
          ),
          const SizedBox(height: 10.0),
          Text(
            isFanOn ? 'Fan ON' : 'Fan OFF',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              setState(() {
                isFanOn = !isFanOn;
              });
              // Add your logic for ON/OFF functionality here
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'ON/OFF',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmartTVButton extends StatefulWidget {
  const SmartTVButton({Key? key}) : super(key: key);

  @override
  _SmartTVButtonState createState() => _SmartTVButtonState();
}

class _SmartTVButtonState extends State<SmartTVButton> {
  bool isSmartTVOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: isSmartTVOn ? Colors.red : Colors.grey[300],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.tv,
            size: 50.0,
            color: Colors.black,
          ),
          const SizedBox(height: 10.0),
          Text(
            isSmartTVOn ? 'Smart TV ON' : 'Smart TV OFF',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              setState(() {
                isSmartTVOn = !isSmartTVOn;
              });
              // Add your logic for ON/OFF functionality here
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.red.shade200,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'ON/OFF',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AirConditionerButton extends StatefulWidget {
  const AirConditionerButton({Key? key}) : super(key: key);

  @override
  _AirConditionerButtonState createState() => _AirConditionerButtonState();
}

class _AirConditionerButtonState extends State<AirConditionerButton> {
  bool isACOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: isACOn ? Colors.orange : Colors.grey[300],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.ac_unit,
            size: 50.0,
            color: Colors.black,
          ),
          const SizedBox(height: 10.0),
          Text(
            isACOn ? 'AC ON' : 'AC OFF',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              setState(() {
                isACOn = !isACOn;
              });
              // Add your logic for ON/OFF functionality here
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'ON/OFF',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

