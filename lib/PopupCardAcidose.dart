import 'package:flutter/material.dart';
import 'dart:math' as math;

class PopupCardAcidose extends StatelessWidget {
  const PopupCardAcidose({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: math.min(450, MediaQuery.sizeOf(context).width - 16.0),
        minHeight: math.min(300, MediaQuery.sizeOf(context).width - 16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 90.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              "Pas de risque d'acidose",
              style: TextStyle(
                  color: Color(0XFF035B6F),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              selectionColor: Color(0XFF035B6F),
            ),
          ),
          const SizedBox(height: 100.0),
          MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: const Color(0xff708907),
              minWidth: 2,
              padding: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
              onPressed: () {},
              child: const Text(
                "OK",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.bold,
                ),
              )),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
