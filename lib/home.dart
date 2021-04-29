import 'package:flutter/material.dart';

import 'main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '首页'
        ),
      ),
      body: Container(
        child: Column(
          children: _childs(
              context,
              Routers.routers
          ),
        ),
      ),
    );
  }

  List<Widget> _childs(BuildContext context,Map<String, WidgetBuilder> routes) {
    return routes.keys.map((e) {
      debugPrint(e);
      return Container(
        margin: EdgeInsets.all(8),
        child: MaterialButton(
          child: Text(e),
          onPressed: (){
            Navigator.of(context)
                .pushNamed(e);
          },
        )
      );
    }).toList();
  }

}