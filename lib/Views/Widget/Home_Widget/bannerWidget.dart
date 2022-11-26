import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../Model/banner_model/banner_model.dart';
import '../../../Services/Banner_Services/banner_services.dart';

bannerWidget(
    {dynamic size,
    Function(int, CarouselPageChangedReason)? onPageChanged,
    int? lenght}) {
  return FutureBuilder<List<BannnerModel>>(
      future: BannerServices().getBanner(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return CarouselSlider.builder(
            itemCount: snapShot.data!.length,
            options: CarouselOptions(
                height: size.height * 0.20,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: onPageChanged),
            itemBuilder: (context, itemIndex, pageViewIndex) {
              lenght = snapShot.data!.length;
              return Container(
                height: size.height * 0.175,
                width: size.width * 0.95,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.005),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey[100]!)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      'https://leqahyshop.hypercare-eg.com/image/${snapShot.data![itemIndex].image!}',
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('error');
                      },
                    )),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
}
