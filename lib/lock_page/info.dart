import 'package:ai_home/lock_page/scan.dart';
import 'package:flutter/material.dart';

class FaceInfo extends StatefulWidget {
  const FaceInfo({super.key});

  @override
  State<FaceInfo> createState() => _FaceInfoState();
}

class _FaceInfoState extends State<FaceInfo> {
  // int selectedGenderIndex = 0; // Default to Male
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(),
                        child: Image.asset(
                          "images/background.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 10,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Face Enrollment",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
            // Information
            Positioned(
              left: (MediaQuery.of(context).size.width - 300) / 2,
              top: (MediaQuery.of(context).size.height - 150) / 2,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter your name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        child: Text(
                          'Gender',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          GenderButton(
                            label: 'Male',
                            icon: Icons.male,
                            onPressed: () {
                              // Set the selected index to the male button
                              setState(() {
                                selectedGenderIndex = 0;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          GenderButton(
                            label: 'Female',
                            icon: Icons.female,
                            onPressed: () {
                              // Set the selected index to the female button
                              setState(() {
                                selectedGenderIndex = 1;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          hintText: 'Enter your age',
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 60,
                left: (width - 110) / 2,
                child: MinimalistButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScaningFace()),
                  );
                })),
          ],
        ),
      ),
    );
  }
}

int selectedGenderIndex = 0; // Default to Male

class GenderButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onPressed;

  const GenderButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedGenderIndex == 0 && label == 'Male' ||
        selectedGenderIndex == 1 && label == 'Female';

    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
            ),
            SizedBox(width: 8.0),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MinimalistButton extends StatefulWidget {
  final VoidCallback onPressed;

  const MinimalistButton({required this.onPressed});

  @override
  _MinimalistButtonState createState() => _MinimalistButtonState();
}

class _MinimalistButtonState extends State<MinimalistButton> {
  late bool isPressed;

  @override
  void initState() {
    super.initState();
    isPressed = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isPressed ? Colors.grey[800] : Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'Next Step',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
