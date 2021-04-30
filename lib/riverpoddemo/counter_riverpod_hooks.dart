

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class CounterRiverpod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('CounterRiverpod#build');
    return Scaffold(
      appBar: AppBar(
        title: Text('riverpod'),
      ),
      body: ProviderScope(
        child: Stack(
          children: [
            _TextRiverpod(),
            _ButtonRiverpod()
          ],
        ),
      ),
    );
  }
}

class _Counter extends StateNotifier<int> {
  _Counter(int state) : super(state);

  void incream() {
    state++;
  }

}
final _counterProvider = StateNotifierProvider<_Counter, int>((_) => _Counter(0));

class _TextRiverpod extends HookWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('_TextRiverpod#build');
    final int count = useProvider(_counterProvider);
    return Container(
      child:Text(count.toString())
    );
  }

}

class _ButtonRiverpod extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    debugPrint('_ButtonRiverpod#build');
    return Align(
      alignment: Alignment.topRight,
      child: FloatingActionButton(
        onPressed: () {
          var counter = context.read(_counterProvider.notifier).incream();
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}