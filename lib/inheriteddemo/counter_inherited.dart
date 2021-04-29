import 'package:flutter/material.dart';

class CounterInherited extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterInheritedState();
  }
}

class _CounterInheritedState extends State<CounterInherited> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget'),
      ),
      body: ShareWidget(
          count,
          Stack(
            children: [
              _CounterWidget(),
              Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      count += 1;
                    });
                  },
                  child: Icon(Icons.plus_one),
                ),
              )
            ],
          )),
    );
  }
}

class _CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text((ShareWidget.of(context)?.counter ?? 0).toString());
  }
}

class ShareWidget extends InheritedWidget {
  int counter = 0;
  Widget child;

  ShareWidget(this.counter, this.child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static ShareWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}
