import 'package:flutter/material.dart';
import 'network_aware_widget.dart';

class CheckNetworkWidget extends StatelessWidget {
  final Widget child;

  const CheckNetworkWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return NetworkAwareWidget(
      onlineChild: child,
      offlineChild: Center(
        child: Image.asset(
          'assets/images/no_internet.jpg',
          height: height,
          width: width,
        ),
      ),
    );
  }
}
