import 'package:flutter/material.dart';
import 'package:flutterworld/resources/images/strings/app_strings.dart';

import 'center_home_body.dart';
import 'left_home_drawer.dart';
import 'right_home_drawer.dart';

class HomePage extends StatelessWidget {
  Widget _body(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: LeftBody()),
        Expanded(
          child: CenterBody(),
          flex: 6,
        ),
        Expanded(child: RightBody(), flex: 2),
      ],
    );
  }

  MediaQueryData media;
  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
        AppStrings.flutterWidgets,
          style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
        ),
        centerTitle: false,
        actions: [
          TextButton(
            child: Text(AppStrings.writeStory),
           onPressed: (){
             //TODO::
           },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(icon: Icon(Icons.people), onPressed: () {
                  //TODO::
            }),
          )],
      ),
      body: _body(context),
    );
  }
}
