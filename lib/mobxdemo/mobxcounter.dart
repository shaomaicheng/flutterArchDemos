import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'counter_mobx.dart';
import 'package:mobx/mobx.dart';

MCounter mcounter = MCounter();  // 跨页面的话 store 需要最好用 provider 管理

class MobxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('MobxDemo#build');
    autorun((reaction) {
      // 每次都执行 effect
      debugPrint('autorun:${mcounter.counter}');
    });

    reaction((_) => mcounter.counter, (msg)=> debugPrint('reaction:$msg'));

    when((_) {
      return mcounter.counter == 3;
    }, () {
      // 特定时机处理 effect
      debugPrint('when: ${mcounter.counter}');
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('mobx'),
      ),
      body: Stack(
        children: [
          _MobxCounterText(),
          _MobxCounterButton()
        ],
      ),
    );
  }

}

class _MobxCounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('_MobxCounterText#build');
    return Container(
        child: Observer(
          builder: (ctx) => Text(
              mcounter.counter.toString()
          ),
        )
    );
  }

}

class _MobxCounterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('_MobxCounterButton#build');
    return Align(
      alignment: Alignment.topRight,
      child: FloatingActionButton(onPressed: () {
        // 自增
        mcounter.incream();
      },
        child: Icon(Icons.plus_one),),
    );
  }


}