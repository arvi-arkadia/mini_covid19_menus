import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_covid19_menus/constant.dart';
import 'package:mini_covid19_menus/widgets/line_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: builAppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
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
            ),
            InfoCard(
              effectedNum: 75,
              title: 'Total Deaths',
              iconColor: Color(0xffff2d55),
            ),
            InfoCard(
              effectedNum: 689,
              title: 'Total Recovered',
              iconColor: Color(0xff50e3c2),
            ),
            InfoCard(
              effectedNum: 75,
              title: 'New Cases',
              iconColor: Color(0xff5856d6),
            ),
          ],
        ),
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

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;

  const InfoCard({
    super.key,
    required this.title,
    required this.effectedNum,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        // constraints.max provide the available width for widgets
        width: constraints.maxWidth / 2 - 10,
        // bg item
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    // bg item menu
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(.12),
                      shape: BoxShape.circle,
                    ),
                    // icon item menu
                    child: SvgPicture.asset(
                      "assets/icons/running.svg",
                      height: 12,
                      width: 12,
                      color: iconColor,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  // text item menu
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            // text
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: kTextColor),
                        children: [
                          // number case
                          TextSpan(
                            text: "$effectedNum \n",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text: "People",
                              style: TextStyle(
                                fontSize: 12,
                                height: 2,
                              ))
                        ],
                      ),
                    ),
                  ),
                  // chart
                  Expanded(
                    child: LineReportChart(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
