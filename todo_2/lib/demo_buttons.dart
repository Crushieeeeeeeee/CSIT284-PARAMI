import 'package:flutter/material.dart';
class DemoButtons extends StatefulWidget {
  const DemoButtons({super.key});

  @override
  State<DemoButtons> createState() => _DemoButtonsState();
}

class _DemoButtonsState extends State<DemoButtons> {
  bool isUnderstood = false;

  @override
  Widget build(BuildContext context) {
    print('UIupdateDemo Create');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                isUnderstood = false;
              });
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                isUnderstood = true;
              });
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}