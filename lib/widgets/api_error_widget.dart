import 'package:flutter/material.dart';

import '../import_packages.dart';

class ApiError extends StatelessWidget {
  final String errortxt;
  ApiError({required this.errortxt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              errortxt,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: nearlyBlack),
            ),
            const SizedBox(height: 10.0,),
            ElevatedButtonWidget(
                backGroundColor: mainColor,
                padding: 10.0,
                borderRadius: 10.0,
                borderColor: mainColor,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'))
          ],
        ),
      ),
    );
  }
}
