import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:layout_samples/widgets/app-bar.dart';
import 'package:layout_samples/widgets/drawer.dart';
import 'package:layout_samples/widgets/theme-data.dart';

class FormPage extends StatelessWidget {
  static const String routeName = '/form';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: appBar("Add Lead",
            backgroundColor: Colors.white,
            textColor: ThemeColors.MidnightExpress),
        drawer: AppDrawer(),
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
                children: [_buildTextFormColumn("Lead Name", "XYZ Company")])));
  }

  Widget _buildTextFormColumn(String labelText, String placeholderText) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(labelText, style: TextStyles.body.bold.size(15)),
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: placeholderText,
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                hintStyle: TextStyles.body.size(13).c(ThemeColors.MidGray),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ThemeColors.LightGray, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5)),

                )
            ),
            validator: (value) {
              if (value.isEmpty) {
                return placeholderText;
              }
              return null;
            },
        )
      ]
    );
  }
}
