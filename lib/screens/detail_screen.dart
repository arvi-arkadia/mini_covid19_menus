import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_covid19_menus/constant.dart';

class DetailScreens extends StatelessWidget {
  const DetailScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: buildDetailBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // item top
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              // bg color
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 21),
                    blurRadius: 53,
                    color: Colors.black.withOpacity(.05),
                  ),
                ],
              ),
              // item
              child: Column(
                children: [
                  // top
                  buildTitlenIconMore(),
                  // middle
                  SizedBox(
                    height: 15,
                  ),
                  buildCaseNumber(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: [
        Text(
          "547 ",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: kPrimaryColor, height: 1.2),
        ),
        Text(
          "5.9% ",
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        SvgPicture.asset("assets/icons/increase.svg")
      ],
    );
  }

  Row buildTitlenIconMore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // title
        Text(
          "New Cases",
          style: TextStyle(
            color: kTextMediumColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        // icon
        SvgPicture.asset("assets/icons/more.svg"),
      ],
    );
  }

  AppBar buildDetailBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: kBackgroundColor,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search.svg"),
        ),
      ],
    );
  }
}
