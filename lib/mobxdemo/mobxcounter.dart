import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'counter_mobx.dart';
import 'package:mobx/mobx.dart';

class MobxDemo extends StatelessWidget {
  MCounter mcounter = MCounter();  // 跨页面的话 store 需要最好用 provider 管理
  @override
  Widget build(BuildContext context) {
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
          Container(
              child: Observer(
                builder: (ctx) => Text(
                    mcounter.counter.toString()
                ),
              )
          ),
          Align(
            alignment: Alignment.topRight,
            child: FloatingActionButton(onPressed: () {
              // 自增
              mcounter.incream();
            },
            child: Icon(Icons.plus_one),),
          )
        ],
      ),
    );
  }

}