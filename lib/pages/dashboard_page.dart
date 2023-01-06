import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fixSize = size.width;
    return Container(
      width: size.width,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: size.width * 0.002,
              mainAxisSpacing: size.width * 0.002),
          children: [
            InkWell(
              onTap: (() => {}),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 2,
                  ),
                ),
                child: Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wallet,
                          color: Colors.blue,
                          size: fixSize * 0.08,
                        ),
                        Text(
                          'youth_statistic'.tr,
                          style: TextStyle(
                              color: Colors.blue, fontSize: fixSize * 0.012),
                        ),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '100,000,000' + 'lak'.tr,
                            style: TextStyle(
                                fontSize: fixSize * 0.02,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                ),
              ),
            ),
            InkWell(
              onTap: (() => {}),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 2,
                  ),
                ),
                child: Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: Colors.red,
                          size: fixSize * 0.08,
                        ),
                        Text(
                          'fund_statistic'.tr,
                          style: TextStyle(
                              color: Colors.red, fontSize: fixSize * 0.012),
                        ),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '120,000,000' + 'lak'.tr,
                            style: TextStyle(
                                fontSize: fixSize * 0.02,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                ),
              ),
            ),
            InkWell(
              onTap: (() => {}),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 2,
                  ),
                ),
                child: Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.refresh_outlined,
                          color: Colors.blue,
                          size: fixSize * 0.08,
                        ),
                        Text(
                          'operating_result'.tr,
                          style: TextStyle(
                              color: Colors.blue, fontSize: fixSize * 0.012),
                        ),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '5200,000,000' + 'lak'.tr,
                            style: TextStyle(
                                fontSize: fixSize * 0.02,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                ),
              ),
            ),
            InkWell(
              onTap: (() => {}),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 2,
                  ),
                ),
                child: Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.wallet_giftcard,
                          color: Colors.green,
                          size: fixSize * 0.08,
                        ),
                        Text(
                          'income'.tr + '(' + 'arrear'.tr + ')',
                          style: TextStyle(
                              color: Colors.green, fontSize: fixSize * 0.012),
                        ),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '3200,000,000' + 'lak'.tr,
                            style: TextStyle(
                                fontSize: fixSize * 0.02,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
