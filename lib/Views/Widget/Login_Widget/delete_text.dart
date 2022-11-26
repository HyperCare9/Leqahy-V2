// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DeleteText extends StatelessWidget {
  TextEditingController? passwordController;
  bool? isVisiable;
  Function()? onTap;
  DeleteText({
    Key? key,
    this.passwordController,
    this.isVisiable,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.06,
      child: TextField(
        controller: passwordController,
        obscureText: isVisiable == true ? false : true,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: 0.0, horizontal: size.width * 0.02),
            hintText: 'Enter your password'.tr(),
            suffixIcon: InkWell(
                onTap: onTap,
                child: isVisiable == true
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off)),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            )),
      ),
    );
  }
}
