import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/initial_route.dart';
import '../../../Constant/string.dart';
import '../../../Constant/theme.dart';
import '../../../Model/accademy_model/posts_model.dart';
import '../../../Services/Posts_Services/posts_services.dart';
import '../../../ViewModel/Accademy_ViewModel/accademy_ciewmodel.dart';
import 'postScreen.dart';
import '../../Widget/General_Widget/loading.dart';
import '../../Widget/General_Widget/pageTitle.dart';
import '../../../Services/Cart_Services/cardsAPI.dart';
import '../../../ViewModel/Home_ViewModel/homeViewModel.dart';
import '../../Widget/Home_Widget/buildDrawer.dart';

class AccademyScreen extends StatefulWidget {
  static String routeName =
      InitailRoute().route(routeEN: 'Academy', routeAR: 'الأكاديميه');
  const AccademyScreen({Key? key}) : super(key: key);

  @override
  State<AccademyScreen> createState() => _AccademyScreenState();
}

class _AccademyScreenState extends State<AccademyScreen> {
  AccademyViewModel accademyVM = AccademyViewModel();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeViewModel homeVM = HomeViewModel();

  @override
  void initState() {
    super.initState();
    getCard();
  }

  getCard() async {
    await CardAPI().getCard(languageID: LanguageData().language);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      drawer: Container(
          color: darkGrey,
          width: size.width * 0.60,
          child: DrawerWidget(
            closeDrawwer: () => scaffoldKey.currentState!.closeDrawer(),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          homeVM.buildAppBar(
              size: size,
              context: context,
              cartLenght: customCardModel.length,
              onMenuTapp: () => scaffoldKey.currentState!.openDrawer(),
              isPre: true,
              isSuf: false,
              preIcon: Icons.arrow_back_ios,
              preColor: mainColor,
              isProduct: false,
              isProductCategory: false,
              preFun: () {
                getCard();
                Navigator.of(context).pop();
              }),
          SizedBox(height: size.height * 0.01),
          pageTitle(context: context, size: size, text: 'Accademy Posts'.tr()),
          SizedBox(height: size.height * 0.02),
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: FutureBuilder<List<PostsModel>>(
                  future: PostsAPI().getAllPosts(
                      languageID: context.locale == const Locale('en', 'US')
                          ? '1'
                          : '2'),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapShot.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  EdgeInsets.only(bottom: size.height * 0.025),
                              decoration: BoxDecoration(
                                  // color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                      color: Colors.grey, width: 1.0)),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.02,
                                        vertical: size.height * 0.01),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          child: Text(
                                            snapShot.data![index].name![0],
                                            style: MyTheme
                                                .lightTheme.textTheme.headline2,
                                          ),
                                        ),
                                        SizedBox(width: size.width * 0.02),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(snapShot.data![index].name!,
                                                style: MyTheme.lightTheme
                                                    .textTheme.subtitle1!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            Text(
                                              snapShot
                                                  .data![index].dateCreated!,
                                              style: MyTheme.lightTheme
                                                  .textTheme.subtitle2!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey[600]),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.height * 0.02),
                                    child: Text(
                                      snapShot.data![index].description!,
                                      maxLines: 3,
                                      style: MyTheme
                                          .lightTheme.textTheme.subtitle1!
                                          .copyWith(
                                              locale: context.locale ==
                                                      const Locale('en', 'US')
                                                  ? const Locale('en', 'US')
                                                  : const Locale('ar', 'EG'),
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                              builder: (_) => PostScreen(
                                                    postID: snapShot
                                                        .data![index].postId,
                                                    authorID: snapShot
                                                        .data![index].authorId,
                                                    comments: snapShot
                                                        .data![index].comments,
                                                    views: snapShot
                                                        .data![index].views,
                                                    date: snapShot.data![index]
                                                        .dateUpdated,
                                                    img: snapShot
                                                        .data![index].image,
                                                    name: snapShot
                                                        .data![index].name,
                                                    postDescribtion: snapShot
                                                        .data![index]
                                                        .description,
                                                  )));
                                      PostsAPI().updatePostView(
                                          customerID:
                                              CustomerData().cusID.toString(),
                                          postID: snapShot.data![index].postId);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: size.height * 0.01,
                                          horizontal: size.width * 0.05),
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.height * 0.0005),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: mainColor,
                                                  width: 1.05))),
                                      child: Text(
                                        'Read more'.tr(),
                                        style: MyTheme
                                            .lightTheme.textTheme.subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: mainColor),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                        vertical: size.height * 0.01),
                                    height: size.height * 0.26,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                            color: Colors.grey, width: 1.0),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: snapShot
                                                        .data![index].image !=
                                                    'https://leqahyapp.hypercare-eg.com/media/'
                                                ? NetworkImage(snapShot
                                                    .data![index].image!)
                                                : const NetworkImage(
                                                    'https://leqahyapp.hypercare-eg.com/media/image/notfound/chicken-virus.png'))),
                                  ),
                                  SizedBox(height: size.height * 0.015),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1.0,
                                    height: 0.0,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.01),
                                          child: SizedBox(
                                            width: size.width * 0.30,
                                            child: accademyVM.cusRow(
                                                icon: Icons.comment,
                                                data1: snapShot
                                                    .data![index].comments,
                                                data2: 'Comments'.tr()),
                                          ),
                                        ),
                                        const VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 2,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.01),
                                          child: SizedBox(
                                            width: size.width * 0.30,
                                            child: accademyVM.cusRow(
                                                icon: Icons.visibility,
                                                data1:
                                                    snapShot.data![index].views,
                                                data2: 'Views'.tr()),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return loading();
                    }
                  },
                )),
          ),
        ],
      ),
    ));
  }
}
