import 'package:flutter/material.dart';
import '../../../Constant/theme.dart';

vaccineContent({
  dynamic size,
  String? text,
  TextEditingController? controller,
  String? hint,
  bool? isReadOnly,
  bool? isSuffix,
  Function()? onPressed,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
          child: Text(
            text!,
            style: MyTheme.lightTheme.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.grey[500]),
          ),
        ),
        SizedBox(height: size.height * 0.005),
        SizedBox(
          height: size.height * 0.05,
          child: TextFormField(
            controller: controller,
            readOnly: isReadOnly!,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 3.0),
                hintText: hint,
                suffixIcon: isSuffix == true
                    ? IconButton(
                        onPressed: isSuffix == true ? onPressed : () {},
                        icon: const Icon(
                          Icons.date_range,
                          size: 20,
                        ))
                    : const SizedBox(
                        width: 0.0,
                        height: 0.0,
                      ),
                hintStyle: MyTheme.lightTheme.textTheme.subtitle1!
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
          ),
        ),
        SizedBox(height: size.height * 0.01),
      ],
    ),
  );
}
