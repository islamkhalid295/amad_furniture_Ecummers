import 'dart:html' as html;

import 'package:cedage/features/home_screen/presentation/widgets/about_us_screen/presentation/manager/about_us_screen_cubit.dart';
import 'package:cedage/features/home_screen/presentation/widgets/about_us_screen/presentation/manager/about_us_screen_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/constantes.dart';
import '../../../../../../core/utils/my_widget.dart';
import '../../../manager/basic_data_cubit.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getSectionHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: BlocBuilder<BasicDataCubit, BasicDataState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SelectableText("مــن نــحـن",
                                      style: TextStyle(
                                          fontSize:
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .width >
                                              600
                                              ? 35 *
                                              MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width /
                                              1440
                                              : 35 *
                                              MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width /
                                              700,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  BlocBuilder<AboutUsCubit, AboutUsState>(
                                    builder: (context, state) {
                                      return state is RetriveAboutUsLoading
                                          ? Center(
                                          child: CircularProgressIndicator())
                                          : SelectableText(
                                          AboutUsCubit
                                              .aboutUsModel?.aboutUs ??
                                              "",
                                          style: TextStyle(
                                            fontSize: MediaQuery
                                                .of(context)
                                                .size
                                                .width >
                                                600
                                                ? 25 *
                                                MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width /
                                                1440
                                                : 25 *
                                                MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width /
                                                700 /**
                                              MediaQuery.of(context).size.height /
                                              900*/
                                            ,
                                          ));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          state is GetBasicDataLoading
                              ? Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                              : Container(
                            height: 200 *
                                MediaQuery
                                    .of(context)
                                    .size
                                    .height /
                                1200,
                            width:
                            200 * MediaQuery
                                .of(context)
                                .size
                                .width / 700,
                            decoration: BoxDecoration(
                              color: ColorManager.primary.withOpacity(0.5),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 15,
                                  right: 15,
                                  bottom: 15,
                                  left: 40 *
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width /
                                      900),
                              child: Image.asset(AssetsManager.camponyLogo),
                            ),

                          ),
                        ],
                      ),
                    ),
                    DefaultSelectableText(
                        "يمكن تصفح منتجاتنا عن طريق تحميل تطبيق الهاتف"),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        MaterialButton(
                          onPressed: () {
                            /* await launchUrl(Uri.parse('https://wa.me/+201091832829'));*/
                            ////TODO add app store link
                            html.window.open(
                                'https://wa.me/${BasicDataCubit.basicDataModel
                                    ?.callUs?.number}',
                                '_blank');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                AssetsManager.GooglePlayIcon,
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                              ),
                              if(MediaQuery
                                  .of(context)
                                  .size
                                  .width > 600)
                                ...
                              [SizedBox(width: 5,),
                              FittedBox(
                                child: Text(
                                  'Google Play',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorManager.myWhite,
                                    fontSize: 17.59 *
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width /
                                        1440,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              )],
                            ],
                          ),
                          height: 50,
                          minWidth: 50,
                          color: ColorManager.myBlack,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(width: 10,),
                        MaterialButton(
                          onPressed: () {
                            /* await launchUrl(Uri.parse('https://wa.me/+201091832829'));*/
                            ////TODO add app store link
                            html.window.open(
                                'https://wa.me/${BasicDataCubit.basicDataModel
                                    ?.callUs?.number}',
                                '_blank');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                AssetsManager.appStoreIcon,
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                              ),
                              if(MediaQuery
                                  .of(context)
                                  .size
                                  .width >600)
                                ...[
                                  SizedBox(width: 5,),
                                  FittedBox(
                                    child: Text(
                                      'App Store',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorManager.myWhite,
                                        fontSize: 17.59 *
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .width /
                                            1440,
                                        fontFamily: 'Almarai',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )

                                ],
                            ],
                          ),
                          minWidth: 50,
                          height: 50,

                          color: ColorManager.myBlack,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(width: 10,),
                        MaterialButton(
                          onPressed: () {
                            /* await launchUrl(Uri.parse('https://wa.me/+201091832829'));*/
                            ////TODO add app store link
                            html.window.open(
                                'https://wa.me/${BasicDataCubit.basicDataModel
                                    ?.callUs?.number}',
                                '_blank');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                AssetsManager.appGalleryIcon,
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                              ),
                              if(MediaQuery
                                  .of(context)
                                  .size
                                  .width > 600)
                                ...
                              [SizedBox(width: 5,),
                              FittedBox(
                                child: Text(
                                  'Huawei App Gallery',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorManager.myWhite,
                                    fontSize: 17.59 *
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width /
                                        1440,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              )],
                            ],
                          ),
                          height: 50,
                          minWidth: 50,
                          color: ColorManager.myBlack,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(width: 10,),

                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.black.withOpacity(0.3199999928474426),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                MediaQuery
                    .of(context)
                    .size
                    .width > 400
                    ? Expanded(
                  child: Container(
                    height: 270 * MediaQuery
                        .of(context)
                        .size
                        .height / 800,
                    decoration: BoxDecoration(
                      color: ColorManager.primary.withOpacity(0.5),
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
                          40 * MediaQuery
                              .of(context)
                              .size
                              .width / 900),
                      child: Container(
                        height:
                        270 * MediaQuery
                            .of(context)
                            .size
                            .height / 830,
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
                          [
                            1,
                          ].map((sliderItem) {
                            return Builder(
                              builder: (BuildContext context) {
                                return CachedNetworkImage(
                                  imageUrl:
                                  AboutUsCubit.aboutUsModel?.image ??
                                      "",
                                  placeholder: (context, url) =>
                                  const Center(
                                      child:
                                      CircularProgressIndicator()),
                                  errorWidget: (context, url, error) {
                                    return const Icon(Icons.error);
                                  },
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                )
                    : SizedBox(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SelectableText("عن منتجاتنا",
                            style: TextStyle(
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .width > 600
                                    ? 35 *
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width /
                                    1440
                                    : 35 *
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width /
                                    700,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 250 * MediaQuery
                              .of(context)
                              .size
                              .height / 900,
                          child: BlocBuilder<AboutUsCubit, AboutUsState>(
                            builder: (context, state) {
                              return state is RetriveAboutUsLoading
                                  ? Center(child: CircularProgressIndicator())
                                  : SelectableText(
                                  AboutUsCubit.aboutUsModel?.aboutProducts ??
                                      "",
                                  style: TextStyle(
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .width >
                                        600
                                        ? 25 *
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width /
                                        1440
                                        : 25 *
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width /
                                        700 /**
                                      MediaQuery.of(context).size.height /
                                      900*/
                                    ,
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
        ],
      ),
    );
  }
}
