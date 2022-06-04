import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: Scaffold(
        body: MyApp(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool imageVisible = false;
  int step = 0;
  double opacity = 1.0;
  List<String> messages = [
    'Chà một năm trôi qua thật nhanh nhỉ!',
    'Bạn đã có một năm thật đáng nhớ chứ?',
    'Tháng này có một ngày rất trọng đại đối với bạn đúng không?',
    'Ngày này 20 năm trước một người mà mình rất quý mến ra đời',
    'Chúc mừng sinh nhật bạn!',
  ];

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacity -= 0.2;
        if (opacity <= 0) {
          opacity = 1.0;
          step++;
          if (step == messages.length) {
            step = 0;
            imageVisible = false;
          } else if (step == messages.length - 1) {
            imageVisible = true;
          }
        }
      });
    });
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 500),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                messages[step],
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Visibility(
              visible: imageVisible,
              child: Image.asset(
                'assets/iu.jpg',
                width: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
