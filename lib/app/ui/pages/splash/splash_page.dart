import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  // ignore: no_logic_in_create_state
  _SplashPage createState() {
    print('1. createState');
    return _SplashPage();
  }
}

class _SplashPage extends State<SplashPage> {
  late int counter;

  @override
  void initState() {
    counter = 0;
    super.initState();
    print('2. initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('3. didChangeDependencies');
  }

  @override
  void didUpdateWidget(SplashPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('5. didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('7. deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('8. dispose');
  }

  void method1() {
    setState(() {
      print('6. setState');
      counter = counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('4. build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateFul Widget'),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () {
              initState();
            },
            child: Text('$counter')),
      ),
    );
  }
}
