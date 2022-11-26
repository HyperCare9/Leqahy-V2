import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Constant/theme.dart';
import '../../../Model/Zone_model/zone_model.dart';
import '../../../Services/Zone_services/zone_services.dart';
import '../General_Widget/loading.dart';

zoneWidget({required BuildContext context, dynamic size}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: CupertinoAlertDialog(
            title: Text(
              'Zones',
              style: MyTheme.lightTheme.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            content: FutureBuilder<List<ZoneModel>>(
              future: ZoneAPI().getAllZones(countryID: '63'),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return ListView.builder(
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapShot.data![index].name!),
                        );
                      });
                } else {
                  return loading();
                }
              },
            ),
          ),
        );
      });
}
