import 'package:ai_home/CCTV/streaming.dart';
import 'package:ai_home/lock_page/lock.dart';
import 'package:ai_home/light/light.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Row1 extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var height;

  Row1({Key? key, required this.height}) : super(key: key);

  @override
  State<Row1> createState() => _Row1State();
}

class _Row1State extends State<Row1> {
  //Row1({super.key});
  bool isLightOn = false;
  bool isDoorOpen = false;

  // Callback function to update isDoorOpen
  void updateLightState(bool newIsLightOn) {
    setState(() {
      isLightOn = newIsLightOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          width: (screenWidth / 2) - 33,
          height: (widget.height / 2) - 30,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoorAcess()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero, // Remove padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: isDoorOpen ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0)
                        .copyWith(top: 10.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset("images/thermostat.png"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Smart Door",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isDoorOpen ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Transform.rotate(
                        angle: -90 * 3.141592653589793 / 180,
                        child: Switch(
                          value: isDoorOpen,
                          onChanged: (value) {
                            setState(() {
                              isDoorOpen = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ),
        ),

        /*
        Container(
          width: (screenWidth / 2) - 35,
          height: (widget.height / 2) - 33,
          color: Colors.green,
          margin: const EdgeInsets.only(top: 10),
          child: const Center(
            child: SizedBox(
              width: 100,
              height: 20,
              child: Icon(Icons.lock),
            ),
          ),
        ),
        */
        Container(
          width: (screenWidth / 2) - 33,
          height: (widget.height / 2) - 30,
          margin: const EdgeInsets.only(top: 15),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SmartLight(
                    lightData: LightData(isLightOn: isLightOn),
                    updateLightState: updateLightState,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero, // Remove padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: isLightOn ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0)
                        .copyWith(top: 10.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset("images/thermostat.png"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Light Bulb",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: isLightOn ? Colors.white : Colors.black),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Transform.rotate(
                        angle: -90 * 3.141592653589793 / 180,
                        child: Switch(
                          value: isLightOn,
                          onChanged: (value) {
                            setState(() {
                              isLightOn = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ),
        ),
        /*
        Container(
          width: (screenWidth / 2) - 33,
          height: (widget.height / 2) - 30,
          margin: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: isLightOn ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0)
                    .copyWith(top: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset("images/thermostat.png"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Light Bulb",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isLightOn ? Colors.white : Colors.black),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Transform.rotate(
                    angle: -90 * 3.141592653589793 / 180,
                    child: Switch(
                      value: isLightOn,
                      onChanged: (value) {
                        setState(() {
                          isLightOn = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
            ],
          ),
        ),
        */
      ],
    );
  }

  gradiant() {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Colors.black,
            Colors.black54,
          ])),
    );
  }
}

// ignore: must_be_immutable
class Row2 extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var height;

  Row2({Key? key, required this.height}) : super(key: key);

  @override
  State<Row2> createState() => _Row2State();
}

class _Row2State extends State<Row2> {
  bool isCCTVOn = false;
  bool isGameOn = false;
  //const Row2({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: (screenWidth / 2) - 35,
          height: (widget.height / 2) - 38,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                // Streaming
                MaterialPageRoute(
                    builder: (context) => WebSocketStreamWidget()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero, // Remove padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: isCCTVOn ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0)
                        .copyWith(top: 10.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset("images/thermostat.png"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Text(
                            "CCTV",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: isCCTVOn ? Colors.white : Colors.black),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Transform.rotate(
                        angle: -90 * 3.141592653589793 / 180,
                        child: Switch(
                          value: isCCTVOn,
                          onChanged: (value) {
                            setState(() {
                              isCCTVOn = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: (screenWidth / 2) - 35,
          height: (widget.height / 2) - 40,
          margin: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: isGameOn ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0)
                    .copyWith(top: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset("images/thermostat.png"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Buzzer",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isGameOn ? Colors.white : Colors.black),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Transform.rotate(
                    angle: -90 * 3.141592653589793 / 180,
                    child: Switch(
                      value: isGameOn,
                      onChanged: (value) {
                        setState(() {
                          isGameOn = value;
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
