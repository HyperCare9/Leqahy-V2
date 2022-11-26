// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leqahy_v2/Constant/colors.dart';
import 'package:leqahy_v2/Constant/string.dart';
import 'package:leqahy_v2/Model/accademy_model/comment_model.dart';
import 'package:leqahy_v2/Model/accademy_model/postComment_model.dart';
import 'package:leqahy_v2/Services/Posts_Services/posts_services.dart';
import 'package:leqahy_v2/Views/Screens/AccademyScreen/accademy_screen.dart';
import 'package:leqahy_v2/Views/Screens/AccademyScreen/comment_header.dart';
import 'package:leqahy_v2/Views/Widget/General_Widget/buildToast.dart';
import 'package:leqahy_v2/Views/Widget/General_Widget/loading.dart';
import 'package:leqahy_v2/Views/Widget/productWidget/noProductWidget.dart';
import '../../../Constant/theme.dart';
import '../../Widget/General_Widget/buildHeader.dart';
import '../../Widget/General_Widget/pageTitle.dart';
import 'package:intl/intl.dart' as inital;

class PostScreen extends StatefulWidget {
  String? postID;
  String? name;
  String? date;
  String? authorID;
  String? postDescribtion;
  String? img;
  String? comments;
  String? views;
  PostScreen({
    Key? key,
    this.postID,
    this.name,
    this.date,
    this.authorID,
    this.postDescribtion,
    this.img,
    this.comments,
    this.views,
  }) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController commentController = TextEditingController();
  PostCommentModel? postCommentModel;
  DateTime date = DateTime.now();
  FToast toast = FToast();
  @override
  void initState() {
    super.initState();
    inital.Intl.defaultLocale = 'en';
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          buildcustomHeader(
              context: context,
              size: size,
              preColor: mainColor,
              sufColor: Colors.transparent,
              sufIcon: Icons.arrow_back_ios,
              preIcon: Icons.arrow_back_ios,
              preFun: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const AccademyScreen()));
              },
              sufFun: () {}),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: size.height * 0.02),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.name!,
                                  style: MyTheme.lightTheme.textTheme.bodyText2!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.date!,
                                  style: MyTheme.lightTheme.textTheme.subtitle2!
                                      .copyWith(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            widget.postDescribtion!,
                            style: MyTheme.lightTheme.textTheme.subtitle1!
                                .copyWith(
                              color: Colors.black,
                            ),
                          ),
                          // Html(
                          //   data: widget.postDescribtion,
                          //   defaultTextStyle: MyTheme
                          //       .lightTheme.textTheme.subtitle1!
                          //       .copyWith(
                          //     color: Colors.black,
                          //   ),
                          //   onLinkTap: (url) {
                          //     print("Opening $url...");
                          //   },
                          // ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.01,
                                vertical: size.height * 0.01),
                            height: size.height * 0.26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: widget.img !=
                                            'https://leqahyapp.hypercare-eg.com/media/'
                                        ? NetworkImage(widget.img!)
                                        : const NetworkImage(
                                            'https://leqahyapp.hypercare-eg.com/media/image/notfound/chicken-virus.png'))),
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 2.0,
                          ),
                          SizedBox(height: size.height * 0.01),
                          pageTitle(
                              context: context,
                              size: size,
                              text: 'Post Comments'.tr()),
                          SizedBox(height: size.height * 0.02),
                          FutureBuilder<List<SingleCommentModel>>(
                            future: PostsAPI()
                                .getAllComments(postID: widget.postID),
                            builder: (context, snapShot) {
                              if (snapShot.hasData) {
                                return snapShot.data!.isNotEmpty
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapShot.data!.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return commentHeader(
                                              context: context,
                                              size: size,
                                              title: snapShot.data![index].name!
                                                  .substring(0, 2)
                                                  .toUpperCase(),
                                              content: snapShot
                                                  .data![index].comment);
                                        })
                                    : noCompanyWidget(
                                        message: 'No comment founded');
                              } else {
                                return loading();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01, horizontal: size.width * 0.02),
            height: size.height * 0.07,
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: commentController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 1.0),
                      hintText: 'Enter your comment'.tr()),
                )),
                SizedBox(width: size.width * 0.02),
                InkWell(
                  onTap: () async {
                    postCommentModel = await PostsAPI().addComment(
                        postID: widget.postID,
                        authorID: widget.authorID,
                        comment: commentController.text,
                        customerID: CustomerData().cusID.toString(),
                        name:
                            '${CustomerData().cusFirstName} ${CustomerData().cusLastName}',
                        email: CustomerData().cusEmail,
                        date: inital.DateFormat('yyyy-MM-dd').format(date),
                        webSite: '');
                    if (postCommentModel!.status == true) {
                      showBottomToast(
                          colors: Colors.green,
                          icon: Icons.check,
                          toast: toast,
                          message: 'Add comment Success'.tr());
                      commentController.clear();
                      setState(() {});
                    } else {
                      showBottomToast(
                          colors: Colors.red,
                          icon: Icons.warning,
                          toast: toast,
                          message: 'Add comment Faield'.tr());
                    }
                  },
                  child: const Icon(
                    Icons.send,
                    color: mainColor,
                    size: 25,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
