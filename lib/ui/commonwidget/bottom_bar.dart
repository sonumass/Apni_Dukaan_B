import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mcsofttech/ui/base/base_satateless_widget.dart';
import 'package:mcsofttech/ui/commonwidget/text_style.dart';
import 'package:mcsofttech/utils/palette.dart';

import '../../controllers/addandsell/add_and_sell_controller.dart';
import '../../controllers/home/home_controller.dart';
import '../../controllers/training/training_controller.dart';
import '../../data/preferences/AppPreferences.dart';
import '../../theme/my_theme.dart';
import '../module/addsellrent/rent_sell.dart';
import '../module/home/home.dart';
import '../module/login/login_page.dart';

class BottomBar extends BaseStateLessWidget {
   BottomBar({Key? key}) : super(key: key);
  final appPreferences = Get.find<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: MyColors.transparent,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: MyColors.themeColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            border: Border.all(
              color:
              MyColors.themeColor, //                   <--- border color
            )),
        //add ClipRRect widget for Round Corner
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: screenWidget / 2.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dashboard,
                    const SizedBox(
                      width: 20,
                    ),
                    meriDukaan,
                  ],
                ),
              ),
              rentSell,
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: screenWidget / 2.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    export,
                    const SizedBox(
                      width: 20,
                    ),
                    more,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget get storeDetail {
    return SizedBox(
      child: FloatingActionButton(
        onPressed: () {
          if (appPreferences.isLoggedIn) {
            Get.delete<AddAndSellController>();
            RentSell.start("rent_sell".tr);
          } else {
            LoginPage.start();
          }
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: MyColors.themeColor,
        ),
      ),
    );
  }

  Widget get dashboard {
    return InkWell(
      onTap: () {
        appPreferences.saveStoreId("0");
        Home.start(0);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset('assets/svg/icon_home.svg'),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'home'.tr,
            style: TextStyles.headingTexStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 13,
                fontFamily: "Montserrat"),
          ),
        ],
      ),
    );
  }

  Widget get meriDukaan {
    return InkWell(
      onTap: () {
        appPreferences.saveStoreId("0");
        if (appPreferences.isLoggedIn) {
          Get.delete<HomeController>();
          Home.start(1);
        } else {
          LoginPage.start();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset('assets/svg/icon_meri_dukaan.svg'),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'meri_dukaan'.tr,
            style: TextStyles.headingTexStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 12,
                fontFamily: "Montserrat"),
          ),
        ],
      ),
    );
  }

  Widget get rentSell {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          width: 10,
          height: 30,
        ),
        Text(
          'rent_sell'.tr,
          style: TextStyles.headingTexStyle(
              color: Colors.white,
              fontWeight: FontWeight.w100,
              fontSize: 10,
              fontFamily: "Montserrat"),
        ),
      ],
    );
  }

  Widget get export {
    return InkWell(
      onTap: () {
        Get.delete<HomeController>();
        Home.start(2);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 30,
            height: 25,
            child: SvgPicture.asset('assets/svg/icon_export.svg'),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'export'.tr,
            style: TextStyles.headingTexStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 12,
                fontFamily: "Montserrat"),
          ),
        ],
      ),
    );
  }

  Widget get more {
    return InkWell(
      onTap: () {
        Get.delete<TrainingController>();
        Home.start(3);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset('assets/svg/icon_more.svg'),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'more'.tr,
            style: TextStyles.headingTexStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 12,
                fontFamily: "Montserrat"),
          ),
        ],
      ),
    );
  }
}
