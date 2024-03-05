import 'package:app/core/resource/assets.dart';
import 'package:app/features/main/article/presentation/viewmodel/model/data_model.dart';

class AppMarginManager {
  static const double m8 = 8;
  static const double m12 = 12;
  static const double m14 = 14;
  static const double m16 = 16;
  static const double m18 = 18;
  static const double m20 = 20;
}

class AppPaddingManager {
  static const double p8 = 8;
  static const double p12 = 12;
  static const double p14 = 14;
  static const double p16 = 16;
  static const double p18 = 18;
  static const double p20 = 20;
  static const double p28 = 28;
  static const double p35 = 35;
  static const double p87 = 87;
  static const double p100 = 100;
}

class AppSizeManager {
  static const double s0 = 0;
  static const double s1 = 1;
  static const double s2 = 2;
  static const double s1_5 = 1.5;
  static const double s4 = 4;
  static const double s6 = 6;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s14 = 14;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;
  static const double s28 = 28;
  static const double s40 = 40;
  static const double s45 = 45;
  static const double s50 = 50;
  static const double s60 = 60;
  static const double s90 = 90;
  static const double s100 = 100;
  static const double s120 = 120;
  static const double s140 = 140;
  static const double s160 = 160;
  static const double s180 = 180;
  static const double s190 = 190;
}

class KeyValues {
  static const String onBoardingItemKey = "OnBoardingValueKey";
  static const String savedItemKey = "SavedValueKey";
}

final testStringDescription =
    r'''If you have diabetes, your healthy eating plan should not be that different from a healthy eating plan for someone without diabetes. In fact, the American Diabetes Association (ADA) echoes the dietary guidelines recommended for the general public: A diet centered on fruits, vegetables, whole grains, legumes (peas and beans), and low-fat dairy products.
How carbs fit in
However, you'll want to pay special attention to your carbohydrate intake. For most people with diabetes, carbohydrates should account for about 45% to 55% of the total calories you eat each day.
Make sure you choose your carbohydrates wisely — ideally, from vegetables, whole grains, and fruits.
Try to avoid highly refined carbohydrates such as white bread, pasta, and rice, as well as candy, sugary soft drinks, and sweets. Refined carbohydrates tend to cause sharp spikes in blood sugar, and can boost blood triglyceride levels.

The facts on fiber
Vegetables, fruits, and whole grains not only provide more nutrition per calorie than refined carbohydrates, they also tend to be rich in fiber. Your body digests high-fiber foods more slowly — which means a more moderate rise in blood sugar.
Fiber comes in two forms: insoluble fiber, the kind found in whole grains, and soluble fiber, found in beans, dried peas, oats, and fruits. Soluble fiber in particular appears to lower blood sugar levels by improving insulin sensitivity, which may mean you need less diabetes medicine.
In addition, a number of studies suggest that eating plenty of fiber reduces the chances of developing heart disease — and people with diabetes need to do all they can to lower their risk.
For more smart strategies for controlling your blood sugar, check out Living Well with Diabetes , a Special Health Report from Harvard Medical School.

Disclaimer:
As a service to our readers, Harvard Health Publishing provides access to our library of archived content. Please note the date of last review or update on all articles.
No content on this site, regardless of date, should ever be used as a substitute for direct medical advice from your doctor or other qualified clinician.
''';

final List<ItemModel> mainList = [
  ItemModel(
      title: "Healthy eating for blood sugar control",
      description: testStringDescription,
      image: ImagesPath.fruit),
  ItemModel(title: "2", description: "2", image: ImagesPath.fruit),
  ItemModel(title: "3", description: "3", image: ImagesPath.fruit),
  ItemModel(title: "4", description: "4", image: ImagesPath.fruit),
  ItemModel(title: "1", description: "1", image: ImagesPath.fruit),
  ItemModel(title: "2", description: "2", image: ImagesPath.fruit),
  ItemModel(title: "3", description: "3", image: ImagesPath.fruit),
  ItemModel(title: "4", description: "4", image: ImagesPath.fruit),
  ItemModel(title: "1", description: "1", image: ImagesPath.fruit),
  ItemModel(title: "2", description: "2", image: ImagesPath.fruit),
  ItemModel(title: "3", description: "3", image: ImagesPath.fruit),
  ItemModel(title: "4", description: "4", image: ImagesPath.fruit),
  ItemModel(title: "1", description: "1", image: ImagesPath.fruit),
  ItemModel(title: "2", description: "2", image: ImagesPath.fruit),
  ItemModel(title: "3", description: "3", image: ImagesPath.fruit),
  ItemModel(title: "4", description: "4", image: ImagesPath.fruit),
];
