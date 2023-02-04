import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_covid19_menus/constant.dart';
import 'package:mini_covid19_menus/screens/detail_screen.dart';
import 'package:mini_covid19_menus/widgets/info_card.dart';
import 'package:mini_covid19_menus/widgets/line_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: builAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
              // height: 300,
              width: double.infinity,
              // background color
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(.03),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              // item box
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: [
                  InfoCard(
                    effectedNum: 1062,
                    title: 'Confirmed Case',
                    iconColor: Color(0xffff8c00),
                    press: () {},
                  ),
                  InfoCard(
                    effectedNum: 75,
                    title: 'Total Deaths',
                    iconColor: Color(0xffff2d55),
                    press: () {},
                  ),
                  InfoCard(
                    effectedNum: 689,
                    title: 'Total Recovered',
                    iconColor: Color(0xff50e3c2),
                    press: () {},
                  ),
                  InfoCard(
                    effectedNum: 75,
                    title: 'New Cases',
                    iconColor: Color(0xff5856d6),
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailScreens();
                      }));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // menu preventions item
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Preventions",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 20),
                  buildPrevention(),
                  // CTA
                  SizedBox(
                    height: 40,
                  ),
                  buildHelpCard(context)
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Row buildPrevention() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // item menu preventions
        PreventionCards(
          title: 'Wash Hand',
          srcSvg: 'assets/icons/hand_wash.svg',
        ),
        PreventionCards(
          title: 'Use Mask',
          srcSvg: 'assets/icons/use_mask.svg',
        ),
        PreventionCards(
          title: 'Clean Disinfect',
          srcSvg: 'assets/icons/Clean_Disinfect.svg',
        ),
      ],
    );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // bg box
          Container(
            padding: EdgeInsets.only(
              // left padding side is 40% of total width
              left: MediaQuery.of(context).size.width * .4,
              top: 20,
              right: 20,
            ),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff60b393),
                  Color(0xff1b8d59),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            // text
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Dial 999 for \nMedical Help!\n",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: "If any symptoms appear",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  )
                ],
              ),
            ),
          ),
          // bg icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset("assets/icons/nurse.svg"),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: SvgPicture.asset("assets/icons/virus.svg"),
          )
        ],
      ),
    );
  }

  AppBar builAppBar() {
    return AppBar(
      // icon menu
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/icons/menu.svg"),
      ),
      // icon search
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search.svg"),
        )
      ],
    );
  }
}

class PreventionCards extends StatelessWidget {
  final String srcSvg;
  final String title;
  const PreventionCards({
    super.key,
    required this.srcSvg,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(srcSvg),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: kPrimaryColor),
        ),
      ],
    );
  }
}
