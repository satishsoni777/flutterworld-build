import 'package:flutter/material.dart';
import 'package:flutterworld/resources/images/app_image.dart';
import 'package:flutterworld/resources/images/strings/app_strings.dart';
import 'package:flutterworld/routes/navigator_manager.dart';
import 'package:flutterworld/routes/routes.dart';
import 'package:flutterworld/style/app_colors.dart';

class CenterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        AspectRatio(
          aspectRatio: 1.0,
          child: GridView(
              children: [
                FlutterCard(
                  AppStrings.flutterObjQuestion,
                ),
                FlutterCard(
                  AppStrings.flutterTutorial,
                ),
                FlutterCard(
                  AppStrings.flutterWidgets,
                  route: Routes.flutterWidgets,
                ),
                FlutterCard(AppStrings.flutterBlog),
                FlutterCard(AppStrings.allFlutterAppsLinks),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (MediaQuery.of(context).size.width /
                    MediaQuery.of(context).size.height),
                crossAxisCount: 3,
              )),
        )
      ],
    );
  }
}

class FlutterCard extends StatelessWidget {
  final String title;
  final bool isActive;
  final String route;
  const FlutterCard(this.title, {this.isActive = false, this.route});
  @override
  Widget build(BuildContext context) {
    return SmallCardResposive(
      onTap: (s) {
        if (route != null) NavigatorManager.next(route, context);
      },
      child: Center(child: Text(title)),
    );
  }
}

class HomeAppLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * .3,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterLogo(
                size: MediaQuery.of(context).size.height * .18,
              ),
              Text(
                AppStrings.lutterWorld
                .trim(),
                style: TextStyle(fontSize: 60.0, color: Colors.blue),
              )
            ],
          ),
        ));
  }
}

class SmallCardResposive extends StatelessWidget {
  final Widget child;
  final Function(String) onTap;
  SmallCardResposive({@required this.child, this.onTap})
      : assert(onTap != null);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340.0,
      height: 400.0,
      child: Card(
        elevation: 8.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Center(
            child: InkWell(
                borderRadius: BorderRadius.circular(10.0),
                hoverColor: AppColors.hoverColor,
                onTap: () => onTap(''),
                child: child)),
      ),
    );
  }
}
