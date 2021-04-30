

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HooksCounter extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var counter = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: Text('hooks'),
      ),
      body: Stack(
        children: [
          Text(counter.value.toString()),
          Align(
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              onPressed: (){
                counter.value++;
              },
              child: Icon(Icons.plus_one),
            ),
          )
        ],
      ),
    );
  }
}

Store store;  // 真实应用应该用Provider管理起来
Reducer reducer = ( state,  action) {
  debugPrint('state: $state, action:$action');
  return action['value'];
};

class HooksReducerCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('HooksReducerCounter#build');
      return Scaffold(
        appBar: AppBar(
          title: Text('hooks'),
        ),
        body: Stack(
          children: [
            _CounterText(),
            _CounterButton()
          ],
        ),
      );
  }
}

class _CounterText extends HookWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('_CounterText#build');
    store = useReducer(reducer, initialState: 0, initialAction: {
      'value':0
    });
   return  Container(
    child: Text('${store.state}'),
   );
  }

}

class _CounterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('_CounterButton#build');
    return  Align(
      alignment: Alignment.topRight,
      child: FloatingActionButton(
        onPressed: (){
          int count = store.state;
          store.dispatch({
            'value': count+=1
          });
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }

}