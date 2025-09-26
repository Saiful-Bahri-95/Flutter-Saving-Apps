import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:saving_apps/style/colors.dart';
import 'package:saving_apps/style/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kBgColor.withOpacity(0.5),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(left: 30, top: 35, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: kBody1.copyWith(color: kMatterhornBlack),
                          ),
                          Text(
                            'Saiful Bahri 🚀',
                            style: kHeading6.copyWith(color: kMatterhornBlack),
                          ),
                        ],
                      ),
                      Container(
                        constraints: BoxConstraints.expand(
                          width: 40,
                          height: 40,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/user-img.png'),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: kGrey,
                              blurRadius: 5,
                              offset: Offset.fromDirection(2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 28),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    constraints: BoxConstraints.expand(height: 170),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg-container.png'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kGrey,
                          blurRadius: 5,
                          offset: Offset.fromDirection(2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'My Savings',
                          style: kSubtitle2.copyWith(color: kWhite),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Rp. 11.452.000,-',
                          style: kHeading5.copyWith(color: kWhite),
                        ),
                        SizedBox(height: 10),
                        LinearPercentIndicator(
                          lineHeight: 4,
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          percent: 0.3,
                          backgroundColor: kWhite,
                          progressColor: kEgyptianBlue,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Rp. 11.452.000 / Rp. 40.000.000',
                          style: kCaption.copyWith(color: kWhite),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      _transactionButton('assets/icons/save.png', 'Save Money'),
                      SizedBox(width: 25),
                      _transactionButton('assets/icons/pay.png', 'Pay'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 170),
              child: DraggableScrollableSheet(
                builder: (context, scrollController) => Container(
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  padding: EdgeInsets.only(left: 30, right: 30, top: 21),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 14 + 4),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'Transactions History',
                                  style: kHeading6.copyWith(
                                    color: kLuckyBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 31),
                              transactionList(
                                kTreeGreen.withOpacity(0.2),
                                'assets/icons/triangle-up.png',
                                'Success!',
                                'February 19, 05:45 PM',
                                '+ 100.000',
                              ),
                              transactionList(
                                kTreeGreen.withOpacity(0.2),
                                'assets/icons/triangle-up.png',
                                'Success!',
                                'February 12, 06:13 PM',
                                '+ 150.000',
                              ),
                              transactionList(
                                kOrange.withOpacity(0.2),
                                'assets/icons/triangle-down.png',
                                'Coffee Shop',
                                'February 12, 06:13 PM',
                                '- 110.000',
                              ),
                              transactionList(
                                kOrange.withOpacity(0.2),
                                'assets/icons/triangle-down.png',
                                'Payment Electricity',
                                'February 12, 06:13 PM',
                                '- 150.000',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 4,
                          width: 49,
                          color: kEgyptianBlue.withOpacity(0.1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget transactionList(
    Color bgColor,
    String icon,
    String title,
    String sub,
    String amount,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: CircleAvatar(
              backgroundColor: bgColor,
              child: Image(image: AssetImage(icon), width: 14),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: kBody1.copyWith(color: kLuckyBlue)),
              Text(sub, style: kCaption.copyWith(color: kLightGray)),
            ],
          ),
          Spacer(),
          Text(amount, style: kBody1.copyWith(color: kLuckyBlue)),
        ],
      ),
    );
  }

  Widget _transactionButton(String icon, String text) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints.expand(height: 60),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 50, 169, 188),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 24),
            SizedBox(width: 5),
            Text(text, style: kBody1.copyWith(color: kWhite)),
          ],
        ),
      ),
    );
  }
}
