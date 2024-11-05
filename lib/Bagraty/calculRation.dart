import 'package:bagraty_project/Bagraty/Apports.dart';
import 'package:bagraty_project/Bagraty/sqlHelper.dart';
import 'package:flutter/material.dart';

class CalculRation extends StatefulWidget {
  CalculRation();
  @override
  CalculRationState createState() => CalculRationState();
}

class CalculRationState extends State<CalculRation> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 30),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.5, 1.0],
              colors: [
                Color(0XFF035B6F),
                Colors.white,
                Color(0XFF708908),
              ],
            )),
            child: Column(
              children: [Apports(), Text('')],
            )));
  }
}
/*
import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BlurredAppBar({
    Key? key,
    required this.title,
    required this.left_icon,
    required this.right_icon,
    required this.colorCode,
    required this.left_press,
    required this.right_press,
  }) : super(key: key);

  final String title;
  final IconData left_icon;
  final IconData right_icon;
  final Color colorCode;
  final Function left_press;
  final Function right_press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      //padding: EdgeInsets.only(top: 10),
      height: 70,
      // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      width: size.width,

      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //BackButton(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    left_icon,
                    color: Colors.black,
                  ),
                ),
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 18)),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    right_icon,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Change background color
      extendBodyBehindAppBar: true,
      appBar: BlurredAppBar(
        title: "Requests",
        //comment if you wan to hide icons of left or right
        left_icon: Icons.autorenew_rounded,
        right_icon: Icons.delete,
        colorCode: Colors.blue,
        left_press: () {},
        right_press: () {},
      ),
    );
  }
}
*/