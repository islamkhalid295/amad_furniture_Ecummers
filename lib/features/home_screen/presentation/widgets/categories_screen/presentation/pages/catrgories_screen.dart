import 'package:flutter/material.dart';

import '../../../../../../../core/utils/color_manager.dart';
import '../../../../../../../core/utils/constantes.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getSectionHeight(context),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/home_background.jpeg",
              ),
              fit: BoxFit.cover)),
      child: Padding(
        padding: EdgeInsets.only(
            top: 255, right: 140 * MediaQuery.of(context).size.width / 1440),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'أحصل علي منتجات طبيعه للعنايه بالشعر',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: ColorManager.myBlack,
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
                  width: MediaQuery.of(context).size.width < 400
                      ? 320 * MediaQuery.of(context).size.width / 400
                      : 320,
                  child: Text(
                    'العنايه بالشعر من أكثر ما يشغل الفتيات والسيدات، خاصة نموه وزيادة طوله، لذا تحرص العديد منهن على اللجوء لموضة الاكستينشين وتطويل الشعر بشكل ظاهرى فقط،',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: ColorManager.myBlack.withOpacity(0.8999999761581421),
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
                  side: const BorderSide(
                      color: ColorManager.myBlack, style: BorderStyle.solid)),
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
    );
  }
}
