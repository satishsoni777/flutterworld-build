import 'package:flutter/material.dart';
import 'package:flutterworld/resources/images/strings/app_strings.dart';

class AppAppbar extends PreferredSize {
  AppAppbar() : super(preferredSize: Size(5.0, 70.0), child: Container());
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      elevation: 1.0,
      title: Text(
        AppStrings.flutterWord,
        style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
      ),
      centerTitle: false,
      actions: [
        TextButton(
          child: Text(AppStrings.writeStory),
          onPressed: () {
            //TODO::
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: IconButton(
              icon: Icon(Icons.people),
              onPressed: () {
                //TODO::
              }),
        )
      ],
    );
  }
}
