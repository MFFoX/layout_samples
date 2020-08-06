import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:layout_samples/models/generator.dart';
import 'package:layout_samples/models/seller.dart';
import 'package:layout_samples/widgets/app-bar.dart';
import 'package:layout_samples/widgets/drawer.dart';
import 'package:layout_samples/widgets/theme-data.dart';
import 'package:ultimate_data_generator/ultimate_data_generator.dart';

class HomePage extends StatelessWidget {
  final String title;
  static const String routeName = '/';
  final Seller seller = UserGen.generateSeller();

  HomePage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title, backgroundColor: ThemeColors.LightSlateBlue),
        drawer: AppDrawer(),
        body: Container(
            padding: EdgeInsets.only(top: 23, left: 9, right: 9),
            color: ThemeColors.LightSlateBlue,
            width: (MediaQuery.of(context).size.width),
            height: double.infinity,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 9),
              child: Column(children: [
                Container(
                    height: 150,
                    padding: EdgeInsets.only(bottom: 59),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 1,
                              child: Text("Balance",
                                  style: TextStyles.body.lightColor.size(15))),
                          Flexible(
                              flex: 2,
                              child: Text(
                                  Gen.generateAPrice(
                                      priceRange: PriceRange.medium),
                                  style: TextStyles.title.lightColor.bold)),
                          Flexible(
                              flex: 1,
                              child: Text(
                                  "+${UserGen.getSmallDouble().toStringAsFixed(2)}% from last week",
                                  style: TextStyles.bodyLight
                                      .c(ThemeColors.LightSkyBlue)
                                      .size(15))),
                        ])),
                Container(
                  color: Colors.transparent,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: buildRecentLeads()),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 9),
                ),
                Container(
                  color: Colors.transparent,
                  child: Container(
                      padding: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: buildMyFriends()),
                ),
              ]),
            )));
  }

  Widget buildRecentLeads() {
    var recentLeads = seller.leads.take(3);
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        itemCount: recentLeads.length + 1,
        separatorBuilder: (context, i) {
          if (i == 0) return Divider(height: 0, color: Colors.transparent);
          return Divider(color: ThemeColors.MidnightExpress, height: 1);
        },
        itemBuilder: (context, i) {
          if (i == 0)
            return ListTile(
                title: Padding(
              padding: EdgeInsets.only(top: 27, bottom: 15),
              child: Text("Recent Active Leads",
                  style: TextStyles.body.bold.size(17)),
            ));

          final currentLead = seller.leads[i - 1];
          final randomFriend =
              seller.friends[Random().nextInt(seller.friends.length)];

          return ListTile(
              isThreeLine: true,
              title: Text(currentLead.fullName,
                  style: TextStyles.body.bold.size(15).c(Colors.black87)),
              subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(currentLead.businessName,
                          style: TextStyles.body.size(11).c(Colors.black87)),
                    ),
                    Text("From: ${randomFriend.fullName}",
                        style: TextStyles.body.size(11).c(Colors.black45))
                  ]));
        });
  }

  Widget buildMyFriends() {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        physics: new NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: seller.friends.length + 1,
        separatorBuilder: (context, i) {
          if (i == 0) return Divider(height: 0, color: Colors.transparent);
          return Divider(color: ThemeColors.MidnightExpress, height: 1);
        },
        itemBuilder: (context, i) {
          if (i == 0)
            return ListTile(
                title: Padding(
              padding: EdgeInsets.only(top: 27, bottom: 15),
              child: Text("My Friends", style: TextStyles.body.bold.size(17)),
            ));

          final currentFriend = seller.friends[i - 1];

          return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(currentFriend.profilePic),
              ),
              title: Text(currentFriend.fullName,
                  style: TextStyles.body.bold.size(15).c(Colors.black87)),
              subtitle: Text(currentFriend.recentAction,
                  style: TextStyles.body.size(11).c(Colors.black45)));
        });
  }
}
