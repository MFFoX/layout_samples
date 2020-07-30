import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout_samples/widgets/app-bar.dart';
import 'package:layout_samples/widgets/drawer.dart';
import 'package:layout_samples/widgets/theme-data.dart';

class HomePage extends StatelessWidget {
  final String title;
  static const String routeName = '/';

  HomePage({Key key, this.title = "Sample Layouts"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title, backgroundColor: ThemeColors.LightSlateBlue),
        drawer: AppDrawer(),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 23, horizontal: 9),
          color: ThemeColors.LightSlateBlue,
          height: double.infinity,
          width: (MediaQuery.of(context).size.width),
          child: Column(
            children: [
              Container(
                height: 91,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Flexible(
                      flex:1,
                        child: Text("Balance", style: TextStyles.body.lightColor.size(15))
                    ),
                    Flexible(
                        flex: 2,
                        child: Text('\$2,300', style: TextStyles.title.lightColor.bold)
                    ),
                    Flexible(
                        flex:1,
                        child: Text("+4.2% from last week", style: TextStyles.bodyLight.c(ThemeColors.LightSkyBlue).size(15))
                    ),
                  ]
                )
              ),
              Container(
                child: ListView.builder(itemBuilder: null)
              )
            ]
          )
        )
    );
  }
}