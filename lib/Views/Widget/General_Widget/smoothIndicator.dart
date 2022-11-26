import '../../../Constant/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

smoothIndicator({int? activeIndex, int? itemCount}) {
  return AnimatedSmoothIndicator(
    activeIndex: activeIndex!,
    count: itemCount!,
    effect: const SlideEffect(
      activeDotColor: mainColor,
      dotColor: subColor,
      dotWidth: 8,
      dotHeight: 8,
    ),
  );
}
