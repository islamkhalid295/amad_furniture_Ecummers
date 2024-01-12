import 'dart:ui_web';


import 'package:amad_furniture/features/home_screen/presentation/widgets/home_slider/presentation/manager/slider_cubit.dart';

import 'package:amad_furniture/features/home_screen/presentation/widgets/home_slider/presentation/widgets/slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import 'color_manager.dart';
import 'constantes.dart';

Widget mySlider (context, SliderItem sliderItem) => Stack(
  fit: StackFit.expand,
  children: [
    CachedNetworkImage(

      imageUrl: sliderItem.imageUrl ?? "",
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error)  {
        print(error.toString());
        //return Icon(Icons.error);
        return CachedNetworkImage(
          imageUrl: SliderCubit.imageOnErrorLodingImage ?? "",
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error)  {
            print(error.toString());
            return Icon(Icons.error);
          },
          fit: BoxFit.cover,
        );

      },
      fit: BoxFit.cover,
    ),
    Padding(
      padding: EdgeInsets.only( top: 255,
          right: 140 * MediaQuery.of(context).size.width / 1440),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(

            sliderItem.title ?? "",

            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black,
              fontSize: 44,
              fontFamily: 'Almarai',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width < 400 ? 320 * MediaQuery.of(context).size.width / 400 : 320,
                child: Text(

                  sliderItem.description ?? "",

                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8999999761581421),
                    fontSize: 16,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          MaterialButton(
            onPressed: () {},
            color: ColorManager.myBlack,
            minWidth: 210,
            height: 45,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: ColorManager.myBlack,style: BorderStyle.solid)
            ),
            child: const Text(
              'تسوق الان',
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
    ),

  ],
);

Widget aboutUs (context) => Container(
  height: 320,
  decoration: const ShapeDecoration(
    color: ColorManager.myWhite,
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 1, color: ColorManager.myGrayLite),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 25),
    child: MediaQuery.of(context).size.width > 1000 ? Row(
      children: [
        const Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'اتصل بنا',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontFamily: 'Almarai',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'البريد الالكتروني',
              style: TextStyle(
                color: Color(0xFF848484),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Amad furniture1@gmail.com',
              style: TextStyle(
                color: Color(0xFF848484),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 15,),
            Text(
              'رقم الجوال',
              style: TextStyle(
                color: Color(0xFF848484),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '(+966) 8989 7878',
              style: TextStyle(
                color: Color(0xFF848484),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 15,),
            Text(
              'العنوان ',
              style: TextStyle(
                color: Color(0xFF848484),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
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
            const Text(
              'تواصل معانا',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontFamily: 'Almarai',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 60,),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width < 1010 ?  436 * MediaQuery.of(context).size.width / 1010 : 436,
                  height: 48,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Color(0xFF959595),),
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
                          color: Colors.black.withOpacity(0.27000001072883606),
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
                      side: const BorderSide(color: ColorManager.myBlack,style: BorderStyle.solid)
                  ),
                  child: const Text(
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
              child: Image.asset("assets/icons/Link → logo.png (1).png",),
            ),
            const SizedBox(height: 100,),
            Row(
              children: [
                Image.asset("assets/icons/youtube-removebg-preview.jpg",height: 24,width: 24),
                const SizedBox(width: 25,),

                Image.asset("assets/icons/instagram-removebg-preview.jpg",height: 24,width: 24),
                const SizedBox(width: 25,),

                Image.asset("assets/icons/twitter-removebg-preview.jpg",height: 24,width: 24),
                const SizedBox(width: 25,),
                Image.asset("assets/icons/facebook__1_-removebg-preview.jpg",height: 24,width: 24),

              ],
            ),
          ],
        ),
      ],
    ) : SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'اتصل بنا',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20,),
              const Text(
                'البريد الالكتروني',
                style: TextStyle(
                  color: Color(0xFF848484),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Amad furniture1@gmail.com',
                style: TextStyle(
                  color: Color(0xFF848484),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 15,),
              const Text(
                'رقم الجوال',
                style: TextStyle(
                  color: Color(0xFF848484),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                '(+966) 8989 7878',
                style: TextStyle(
                  color: Color(0xFF848484),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 15,),
              const Text(
                'العنوان ',
                style: TextStyle(
                  color: Color(0xFF848484),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'القاهره , مدينه نصر',
                style: TextStyle(
                  color: Color(0xFF848484),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 60,),

              const Text(
                'تواصل معانا',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 60,),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width < 1010 ?  436 * MediaQuery.of(context).size.width / 1010 : 436,
                    height: 48,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0xFF959595),),
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
                            color: Colors.black.withOpacity(0.27000001072883606),
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
                        side: const BorderSide(color: ColorManager.myBlack,style: BorderStyle.solid)
                    ),
                    child: const Text(
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
              const SizedBox(height: 60,),

              Container(
                height: 68,
                width: 164,
                child: Image.asset("assets/icons/Link → logo.png (1).png",),
              ),
              const SizedBox(height: 100,),
              Row(
                children: [
                  Image.asset("assets/icons/youtube-removebg-preview.jpg",height: 24,width: 24),
                  const SizedBox(width: 25,),

                  Image.asset("assets/icons/instagram-removebg-preview.jpg",height: 24,width: 24),
                  const SizedBox(width: 25,),

                  Image.asset("assets/icons/twitter-removebg-preview.jpg",height: 24,width: 24),
                  const SizedBox(width: 25,),
                  Image.asset("assets/icons/facebook__1_-removebg-preview.jpg",height: 24,width: 24),

                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);

Widget topYellowBanner() => Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    const SizedBox(width: 15),
    Image.asset("assets/icons/eg.png"),
    TextButton(
        onPressed: () {

        },
        child: const Text(
          "مصر",
          style: TextStyle(
            color: ColorManager.myBlack,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 0.08,
          ),
        )),
    TextButton(
        onPressed: () {},
        child: const Text(
          "English",
          style: TextStyle(
            color: ColorManager.myBlack,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 0.08,
          ),
        )),
  ],
);

