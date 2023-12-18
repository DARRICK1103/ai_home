import 'package:ai_home/lock_page/info.dart';
import 'package:flutter/material.dart';

class DoorAcess extends StatelessWidget {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: height * 0.25,
              width: width,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FaceInfo()),
                              );
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 23,
                        bottom: 9,
                        left: 10,
                      ),
                      child: Text(
                        "Smart Door Access",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 7,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "No 118, Jalan Oz 2",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // white space face enrollment
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              height: height * 0.75,
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              RoundedCard(
                                data: YourData(
                                  title: 'Item 1',
                                  subtitle: 'Subtitle 1',
                                  imagePath: 'images/thermostat.png',
                                ),
                              ),
                              RoundedCard(
                                data: YourData(
                                  title: 'Item 2',
                                  subtitle: 'Subtitle 2',
                                  imagePath: 'images/thermostat.png',
                                ),
                              ),
                              RoundedCard(
                                data: YourData(
                                  title: 'Item 1',
                                  subtitle: 'Subtitle 1',
                                  imagePath: 'images/thermostat.png',
                                ),
                              ),
                              RoundedCard(
                                data: YourData(
                                  title: 'Item 2',
                                  subtitle: 'Subtitle 2',
                                  imagePath: 'images/thermostat.png',
                                ),
                              ),
                              RoundedCard(
                                data: YourData(
                                  title: 'Item 1',
                                  subtitle: 'Subtitle 1',
                                  imagePath: 'images/thermostat.png',
                                ),
                              ),
                              RoundedCard(
                                data: YourData(
                                  title: 'Item 2',
                                  subtitle: 'Subtitle 2',
                                  imagePath: 'images/thermostat.png',
                                ),
                              ),
                              RoundedCard(
                                data: YourData(
                                  title: 'Item 1',
                                  subtitle: 'Subtitle 1',
                                  imagePath: 'images/thermostat.png',
                                ),
                              ),
                              RoundedCard(
                                data: YourData(
                                  title: 'Item 2',
                                  subtitle: 'Subtitle 2',
                                  imagePath: 'images/thermostat.png',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YourData {
  String title;
  String subtitle;
  String imagePath;

  YourData({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}

class RoundedCard extends StatelessWidget {
  final YourData data;

  RoundedCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          // Left: Photo
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
              ),
              image: DecorationImage(
                image: AssetImage(data.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Right: Title and Subtitle
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    data.subtitle,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
