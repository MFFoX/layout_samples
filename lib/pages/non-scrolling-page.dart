import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:layout_samples/widgets/drawer.dart';
import 'package:layout_samples/widgets/theme-data.dart';

class NonScrollingPage extends StatelessWidget {
  static const String routeName = '/non-scrolling';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: ThemeColors.MidnightExpress,
        drawer: AppDrawer(),
        body: Container(
          height: (MediaQuery.of(context).size.height),
          width: (MediaQuery.of(context).size.width),
          //padding: EdgeInsets.only(top: 40),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Center(child:
                        Image.asset("assets/kikbak/logo.png", width: 123, height: 42.43)
                    )
                ),
                Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Discover new leads", style: TextStyles.title.bold.lightColor),
                          Container(
                            padding: EdgeInsets.only(top: 33, left: 43, right: 43),
                            child: Text(
                                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio.",
                                style: TextStyles.bodyLight.lightColor.weight(FontWeight.w100), textAlign: TextAlign.center),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 55),
                            width: 93,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.circle, size: 8, color: Colors.white),
                                Icon(Icons.circle, size: 8, color: ThemeColors.LightSlateBlue),
                                Icon(Icons.circle, size: 8, color: Colors.white),
                                Icon(Icons.circle, size: 8, color: Colors.white),
                                Icon(Icons.circle, size: 8, color: Colors.white),
                                Icon(Icons.circle, size: 8, color: Colors.white)
                              ],
                            ),
                          )
                        ]
                      )
                    )
                ),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 4,
                    child: Container(
                      width: 290,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/kikbak/device-white.png"),
                          fit: BoxFit.cover,
                          alignment: AlignmentDirectional.topCenter
                        )
                      ),
                    )
                ),
              ],
            ),
          ),
        ));
  }
}
