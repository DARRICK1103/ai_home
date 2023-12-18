import 'package:ai_home/home_page/first_row_devices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'dart:math';

class LightData {
  bool isLightOn;

  LightData({required this.isLightOn});
}

class SmartLight extends StatefulWidget {
  final LightData lightData;
  final Function(bool) updateLightState;

  SmartLight({required this.lightData, required this.updateLightState});

  @override
  State<SmartLight> createState() => _SmartLightState();
}

class _SmartLightState extends State<SmartLight> {
  late bool isLightOn;
  double brightness = 100;
  late Widget slider;

  @override
  void initState() {
    super.initState();
    // Initialize the local state with the received data
    isLightOn = widget.lightData.isLightOn;

    // Move the initialization of slider to initState
    slider = SleekCircularSlider(
      appearance: CircularSliderAppearance(
        size: 350,
        startAngle: 90,
        angleRange: 180,
        customWidths: CustomSliderWidths(
          progressBarWidth: 5,
          handlerSize: 7,
          shadowWidth: 7,
        ),
        customColors: CustomSliderColors(
          hideShadow: true,
          trackColor: Colors.grey[350],
          progressBarColor: Colors.black,
          dotColor: Colors.black,
        ),
        infoProperties: InfoProperties(
          mainLabelStyle: TextStyle(
            color: Colors.transparent,
            fontSize: 0,
          ),
        ),
      ),
      min: 0,
      max: 100,
      initialValue: brightness,
      onChange: (double value) {
        setState(() {
          brightness = value;
        });
        print(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 8),
                  child: Text(
                    "Smart Light",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 15),
                  child: SizedBox(
                    width: 55,
                    height: 35,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: CupertinoSwitch(
                        value: isLightOn,
                        onChanged: (value) {
                          setState(() {
                            isLightOn = !isLightOn;
                          });

                          // Call the callback function to update the first page's state
                          widget.updateLightState(isLightOn);
                        },
                        activeColor: Colors.green,
                        // Set the color to black
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "High",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 350,
                  height: 350,
                  child: Transform.translate(
                    offset: Offset(-160, 0),
                    child: Transform.flip(
                      flipX: true,
                      child: slider,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Low",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0, // Adjust the top position as needed
            right: 0, // Adjust the right position as needed
            child: Column(
              children: [
                Image.asset(
                  "images/light_wire.png",
                  width: 170, // Adjust the width as needed
                  height: 323, // Adjust the height as needed
                ),
                SizedBox(
                  height: 70,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${brightness.toInt()}%',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Brightness",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
