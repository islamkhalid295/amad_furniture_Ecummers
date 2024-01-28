import 'package:amad_furniture/core/utils/color_manager.dart';
import 'package:amad_furniture/core/utils/routes_manager.dart';
import 'package:amad_furniture/features/cart_screen/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/constantes.dart';
import '../../../core/utils/my_widget.dart';
import '../../home_screen/presentation/widgets/navigation_bar/presentation/navigation_bar_sign_in_button.dart';
import '../../home_screen/presentation/widgets/navigation_bar/presentation/shop_cart_icon.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          toolbarHeight: tabBarHeight,
          backgroundColor: ColorManager.myWhite,
          leading: Padding(
            padding: EdgeInsets.only(
                right: (90 * MediaQuery.of(context).size.width / 1235)),
            child: Image.asset("assets/icons/Link → logo.png.png"),
          ),
          leadingWidth: MediaQuery.of(context).size.width < 800
              ? 200 * MediaQuery.of(context).size.width / 800
              : 200,
          title: DefaultTextButton(onPressed: (){context.go(RoutesManager.homeScreen);}, title: "الرئيسية"),

          titleSpacing: 100,
          // title: TabBar(
          //   controller: _tabController,
          //   onTap: (index) {
          //     _scrollController.scrollToIndex(index,
          //         preferPosition: AutoScrollPosition.begin);
          //     _onSectionChange(index);
          //   },
          //   tabs: HomeScreenCubit.tabBarTabs,
          //   indicatorColor: ColorManager.myYellow,
          //   labelStyle: const TextStyle(
          //     color: Colors.black,
          //     fontSize: 16,
          //     fontFamily: 'Almarai',
          //     fontWeight: FontWeight.w700,
          //   ),
          //   indicatorSize: TabBarIndicatorSize.label,
          //   dividerHeight: 0,
          //   labelPadding: EdgeInsets.symmetric(
          //       horizontal: 40 * MediaQuery.of(context).size.width / 1440),
          //   isScrollable: true,
          //
          // ),
          actions: [
            SizedBox(
              width: 30 * MediaQuery.of(context).size.width / 1440,
            ),
            ShopCart(),
            SizedBox(
              width: 30 * MediaQuery.of(context).size.width / 1440,
            ),
            NavigationBarSignInButton(),
            // Container(
            //   decoration: BoxDecoration(border: Border.all(color: ColorManager.myYellow),borderRadius: BorderRadius.circular(10)),
            //   child: TextButton(onPressed: ()=> context.go('/authentication/create_account'), child: Text("تسجيل الدخول",style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 16,
            //     fontFamily: 'Almarai',
            //     fontWeight: FontWeight.w700,
            //   ),)),
            // ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            CartCubit cubit = BlocProvider.of(context);
            // if(CategoriesCubit.productsListModel == null && !CategoriesCubit.poductsLoaded){
            //   CategoriesCubit.poductsLoaded = true;
            //   cubit.getProducts();
            // }
            // if(CategoriesCubit.categoriesList == null && !CategoriesCubit.categoryLoaded){
            //   CategoriesCubit.categoryLoaded = true;
            //   cubit.retriveCategories();
            // }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'عربة التسوق',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Container(width: cartProductImageSize-20,)),
                          Expanded(
                            child: Text(
                              'السعر',
                              style: TextStyle(
                                color: Color(0xFF242424),
                                fontSize: 16,
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'الاسم',
                              style: TextStyle(
                                color: Color(0xFF242424),
                                fontSize: 16,
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'الكميه',
                              style: TextStyle(
                                color: Color(0xFF242424),
                                fontSize: 16,
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Container(
                              height: 50,
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
                            child: Text(
                              'الاجمالي',
                              style: TextStyle(
                                color: Color(0xFF242424),
                                fontSize: 16,
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(child: Image.asset("assets/images/minimalist-olive-oil-bottle-glass.jpg",height: cartProductImageSize,width: cartProductImageSize,)),
                          Expanded(
                            child: Text(
                              'السعررررررررررررررررررر',
                              style: TextStyle(
                                color: Color(0xFF242424),
                                fontSize: 16,
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'السعرsssssssssssssssssssss',
                              style: TextStyle(
                                color: Color(0xFF242424),
                                fontSize: 16,
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                DefaultSelectableText(
                                  'الكميه',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.38,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                DefaultTextFormField(
                                  width: 60,
                                  textAlign: TextAlign.center,
                                  paddingRight: 0,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Container(
                              height: cartProductImageSize,
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
                            child: Text(
                              'السعر',
                              style: TextStyle(
                                color: Color(0xFF242424),
                                fontSize: 16,
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(child: Image.asset("assets/images/minimalist-olive-oil-bottle-glass.jpg",height: cartProductImageSize,width: cartProductImageSize,)),
                          Expanded(
                            child: Text(
                              'السعررررررررررررررررررر',
                              style: TextStyle(
                                color: Color(0xFF242424),
                                fontSize: 16,
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'السعرsssssssssssssssssssss',
                              style: TextStyle(
                                color: Color(0xFF242424),
                                fontSize: 16,
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                DefaultSelectableText(
                                  'الكميه',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.38,
                                    fontFamily: 'Almarai',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                DefaultTextFormField(
                                  width: 60,
                                  textAlign: TextAlign.center,
                                  paddingRight: 0,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Container(
                              height: cartProductImageSize,
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
                            child: Text(
                              'السعر',
                              style: TextStyle(
                                color: Color(0xFF242424),
                                fontSize: 16,
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
  }
}
