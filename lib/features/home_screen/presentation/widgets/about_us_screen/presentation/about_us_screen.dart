import 'package:amad_furniture/features/home_screen/presentation/widgets/about_us_screen/presentation/manager/about_us_screen_cubit.dart';
import 'package:amad_furniture/features/home_screen/presentation/widgets/about_us_screen/presentation/manager/about_us_screen_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/constantes.dart';
import '../../my_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: getSectionHeight(context) - 280,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300 * MediaQuery.of(context).size.height / 800,
                      decoration: BoxDecoration(
                        color: ColorManager.myYellow.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 15,
                            left: 15,
                            bottom: 15,
                            right:
                                40 * MediaQuery.of(context).size.width / 900),
                        child: Container(
                          height:
                              300 * MediaQuery.of(context).size.height / 830,
                          // width: 500 * MediaQuery.of(context).size.width / 1440 ,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CarouselSlider(
                            // carouselController: SliderCubit.carouselController,
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              viewportFraction: 1,
                              autoPlay: true,
                            ),
                            items: /*SliderCubit.sliderItemsList?.slider?*/
                                [1, 2, 3, 4, 5, 6, 7, 8].map((sliderItem) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Image.asset(
                                      "assets/images/home_background.jpeg");
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SelectableText("عن منتجاتنا",
                          style: TextStyle(
                              fontSize:
                                  35 * MediaQuery.of(context).size.width / 1440,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 250 * MediaQuery.of(context).size.height / 900,
                        child: BlocBuilder<AboutUsCubit, AboutUsState>(
                          builder: (context, state) {
                            return  state is RetriveAboutUsLoading ? Center(child: CircularProgressIndicator()) :SelectableText(
                               AboutUsCubit.aboutUsModel!.aboutProducts ?? "",
                                style: TextStyle(
                                  fontSize: 15 *
                                      MediaQuery.of(context).size.width /
                                      1000 *
                                      MediaQuery.of(context).size.height /
                                      900,
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 280,
          decoration: const ShapeDecoration(
            color: ColorManager.myWhite,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: ColorManager.myGrayLite),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
            child: MediaQuery.of(context).size.width > 1000
                ? Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultSelectableText(
                            'اتصل بنا',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontFamily: 'Almarai',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DefaultSelectableText(
                            'البريد الالكتروني',
                            style: TextStyle(
                              color: Color(0xFF848484),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          DefaultSelectableText(
                            'Amad furniture1@gmail.com',
                            style: TextStyle(
                              color: Color(0xFF848484),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          DefaultSelectableText(
                            'رقم الجوال',
                            style: TextStyle(
                              color: Color(0xFF848484),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          DefaultSelectableText(
                            '(+966) 8989 7878',
                            style: TextStyle(
                              color: Color(0xFF848484),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          DefaultSelectableText(
                            'العنوان ',
                            style: TextStyle(
                              color: Color(0xFF848484),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          DefaultSelectableText(
                            'القاهره , مدينه نصر',
                            style: TextStyle(
                              color: Color(0xFF848484),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const DefaultSelectableText(
                            'تواصل معانا',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontFamily: 'Almarai',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width < 1010
                                    ? 436 *
                                        MediaQuery.of(context).size.width /
                                        1010
                                    : 436,
                                height: 48,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      width: 1,
                                      color: Color(0xFF959595),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 150),
                                  child: TextFormField(
                                    textAlign: TextAlign.start,
                                    // textDirection: TextDirection.ltr,
                                    decoration: InputDecoration(
                                      hintText: "ادخل البريد الالكتروني",
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        color: Colors.black
                                            .withOpacity(0.27000001072883606),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                color: ColorManager.myBlack,
                                minWidth: 140,
                                height: 55,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: const BorderSide(
                                        color: ColorManager.myBlack,
                                        style: BorderStyle.solid)),
                                child: const DefaultSelectableText(
                                  'ارسال',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.59,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 68,
                            width: 164,
                            child: Image.asset(
                              "assets/icons/Link → logo.png (1).png",
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                  "assets/icons/youtube-removebg-preview.jpg",
                                  height: 24,
                                  width: 24),
                              const SizedBox(
                                width: 25,
                              ),
                              Image.asset(
                                  "assets/icons/instagram-removebg-preview.jpg",
                                  height: 24,
                                  width: 24),
                              const SizedBox(
                                width: 25,
                              ),
                              Image.asset(
                                  "assets/icons/twitter-removebg-preview.jpg",
                                  height: 24,
                                  width: 24),
                              const SizedBox(
                                width: 25,
                              ),
                              Image.asset(
                                  "assets/icons/facebook__1_-removebg-preview.jpg",
                                  height: 24,
                                  width: 24),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DefaultSelectableText(
                              'اتصل بنا',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const DefaultSelectableText(
                              'البريد الالكتروني',
                              style: TextStyle(
                                color: Color(0xFF848484),
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const DefaultSelectableText(
                              'Amad furniture1@gmail.com',
                              style: TextStyle(
                                color: Color(0xFF848484),
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const DefaultSelectableText(
                              'رقم الجوال',
                              style: TextStyle(
                                color: Color(0xFF848484),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const DefaultSelectableText(
                              '(+966) 8989 7878',
                              style: TextStyle(
                                color: Color(0xFF848484),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const DefaultSelectableText(
                              'العنوان ',
                              style: TextStyle(
                                color: Color(0xFF848484),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const DefaultSelectableText(
                              'القاهره , مدينه نصر',
                              style: TextStyle(
                                color: Color(0xFF848484),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            const DefaultSelectableText(
                              'تواصل معانا',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width <
                                          1010
                                      ? 436 *
                                          MediaQuery.of(context).size.width /
                                          1010
                                      : 436,
                                  height: 48,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 1,
                                        color: Color(0xFF959595),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 150),
                                    child: TextFormField(
                                      textAlign: TextAlign.start,
                                      // textDirection: TextDirection.ltr,
                                      decoration: InputDecoration(
                                        hintText: "ادخل البريد الالكتروني",
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          color: Colors.black
                                              .withOpacity(0.27000001072883606),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  color: ColorManager.myBlack,
                                  minWidth: 140,
                                  height: 55,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: const BorderSide(
                                          color: ColorManager.myBlack,
                                          style: BorderStyle.solid)),
                                  child: const DefaultSelectableText(
                                    'ارسال',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.59,
                                      fontFamily: 'Almarai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Container(
                              height: 68,
                              width: 164,
                              child: Image.asset(
                                "assets/icons/Link → logo.png (1).png",
                              ),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                    "assets/icons/youtube-removebg-preview.jpg",
                                    height: 24,
                                    width: 24),
                                const SizedBox(
                                  width: 25,
                                ),
                                Image.asset(
                                    "assets/icons/instagram-removebg-preview.jpg",
                                    height: 24,
                                    width: 24),
                                const SizedBox(
                                  width: 25,
                                ),
                                Image.asset(
                                    "assets/icons/twitter-removebg-preview.jpg",
                                    height: 24,
                                    width: 24),
                                const SizedBox(
                                  width: 25,
                                ),
                                Image.asset(
                                    "assets/icons/facebook__1_-removebg-preview.jpg",
                                    height: 24,
                                    width: 24),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
