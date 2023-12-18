import 'package:ai_home/home_page/background_wave.dart';
import 'package:ai_home/home_page/first_row_devices.dart';
import 'package:ai_home/home_page/notfication_and_person.dart';
import 'package:ai_home/home_page/welcome.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // ignore: non_constant_identifier_names
    double TopHeight = screenHeight - 200;
    return Column(
      children: [
        TopPart(
          height: TopHeight,
        ),
        Expanded(child: Container()),
        const BottomPart(),
      ],
    );
  }
}

// ignore: must_be_immutable
class TopPart extends StatelessWidget {
  // const TopPart({super.key});
  // ignore: prefer_typing_uninitialized_variables
  var height;
  TopPart({Key? key, required this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 33),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: const TopBar(), // height: 40
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const WelcomeText(), // height: 45
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Devices(
              height: height - 90,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Devices extends StatelessWidget {
  // const Devices({super.key});
  // ignore: prefer_typing_uninitialized_variables
  var height;
  Devices({Key? key, required this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row1(
          height: height,
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 16.0), // Adjust the margin as needed
          child: Row2(
            height: height,
          ),
        ),
      ],
    );
  }
}
