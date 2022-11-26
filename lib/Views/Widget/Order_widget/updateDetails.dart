import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/theme.dart';
import '../../../Constant/validator.dart';

updateDetails({
  required BuildContext context,
  String? title,
  dynamic size,
  FToast? toast,
  TextEditingController? firstController,
  TextEditingController? lastController,
  TextEditingController? companyController,
  TextEditingController? addressController,
  TextEditingController? subAddressController,
  TextEditingController? cityController,
  TextEditingController? zoneController,
  TextEditingController? postalController,
  Function()? onSubmit,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Material(
        type: MaterialType.transparency,
        child: CupertinoAlertDialog(
          title: Text(
            title!,
            style: MyTheme.lightTheme.textTheme.headline2!
                .copyWith(color: mainColor),
          ),
          content: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              cusField(
                  title: 'First Name',
                  hintText: 'First Name',
                  size: size,
                  controller: firstController),
              SizedBox(height: size.height * 0.02),
              cusField(
                  title: 'Last Name',
                  hintText: 'Last Name',
                  size: size,
                  controller: lastController),
              SizedBox(height: size.height * 0.02),
              cusField(
                  title: 'Company Name',
                  hintText: 'Company Name',
                  size: size,
                  controller: companyController),
              SizedBox(height: size.height * 0.02),
              cusField(
                  title: 'Address',
                  hintText: 'Address',
                  size: size,
                  controller: addressController),
              SizedBox(height: size.height * 0.02),
              cusField(
                  title: 'Sub Address',
                  hintText: 'Sub Address',
                  size: size,
                  controller: subAddressController),
              SizedBox(height: size.height * 0.02),
              cusField(
                  title: 'City',
                  hintText: 'City',
                  size: size,
                  controller: cityController),
              SizedBox(height: size.height * 0.02),
              cusField(
                  title: 'Zone',
                  hintText: 'Zone',
                  size: size,
                  controller: zoneController),
              SizedBox(height: size.height * 0.02),
              cusField(
                  title: 'Postal Code',
                  hintText: 'Postal Code',
                  size: size,
                  controller: postalController),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                'Submit',
                style: MyTheme.lightTheme.textTheme.headline3!
                    .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              onPressed: onSubmit,
            ),
            CupertinoDialogAction(
              child: Text(
                'Cancel',
                style: MyTheme.lightTheme.textTheme.headline3!
                    .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    },
  );
}

cusField(
    {TextEditingController? controller,
    dynamic size,
    String? hintText,
    String? title,
    Function(String)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: Text(
          title!,
          style: MyTheme.lightTheme.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: size.height * 0.05,
        child: TextFormField(
          controller: controller,
          validator: (value) => Validator().validateEmpty(value: value!),
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
              hintText: hintText!,
              hintStyle: MyTheme.lightTheme.textTheme.subtitle2!
                  .copyWith(color: Colors.grey),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              )),
          onChanged: onChanged,
        ),
      ),
    ],
  );
}
