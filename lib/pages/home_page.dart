import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masscore_web_admin/pages/dashboard_page.dart';
import 'package:masscore_web_admin/pages/ethnicity_page.dart';
import 'package:masscore_web_admin/pages/goverment_position_page.dart';
import 'package:masscore_web_admin/pages/login_page.dart';
import 'package:masscore_web_admin/pages/organization_position_page.dart';
import 'package:masscore_web_admin/pages/religion_page.dart';
import 'package:masscore_web_admin/pages/subject_page.dart';
import 'package:masscore_web_admin/pages/theory_page.dart';
import 'package:masscore_web_admin/pages/user_page.dart';
import 'package:masscore_web_admin/widgets/custom_text.dart';
import '../statemanagement/app_verification.dart';
import '../statemanagement/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeState homeState = Get.put(HomeState());
  LocaleState localeState = Get.put(LocaleState());
  AppVerification appVerification = Get.put(AppVerification());
  final List locale = [
    {'name': 'Lao', 'locale': Locale('la', 'LA')},
    {'name': 'English', 'locale': Locale('en', 'US')}
  ];
  upateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
    localeState.update();
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('choose_language'.tr),
            content: Container(
              width: double.minPositive,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Text(locale[index]['name']),
                      onTap: () {
                        print(locale[index]['name']);
                        upateLanguage(locale[index]['locale']);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: locale.length,
              ),
            ),
          );
        });
  }

  List<Widget> page = [
    DashboardPage(),
    SubjectPage(),
    TheoryPage(),
    EthnicityPage(),
    ReligionPage(),
    GovermentPositionPage(),
    OrganizationPositionPage(),
    UserPage(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fixSize = size.width + size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'app_name'.tr,
          style: TextStyle(fontFamily: 'Noto Sans Lao'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.language, color: Colors.white),
            onPressed: () {
              buildLanguageDialog(context);
            },
          ),
        ],
      ),
      body: GetBuilder<HomeState>(builder: (get) {
        return page[get.currentPage];
      }),
      drawer: Drawer(
        child: Expanded(
            child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Expanded(
                        child: Column(
                          children: [
                            Center(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 110,
                                    height: 110,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 4,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor),
                                        boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              offset: Offset(0, 10))
                                        ],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHH2zV7UrpLB6vH6MLJytMtbGKxLg3txrcXKy1nmC72C5SaDhTle2UE9P2ePGj00DQzbY&usqp=CAU",
                                            ))),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Admin',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: 'Noto Sans Lao'),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            InkWell(
              onTap: () =>
                  {homeState.setCurrentPage(0), Navigator.pop(context)},
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'home'.tr,
                  style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),
                ),
              ),
            ),
            ExpansionTile(
              title: Text('setting'.tr, style: TextStyle(
                fontFamily: 'Noto Sans Lao',
              ),),
              leading: Icon(Icons.settings), //add icon
              childrenPadding: EdgeInsets.only(left: 60), //children padding
              children: [
                ListTile(
                  title: Text('subject'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {
                    homeState.setCurrentPage(1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('theory'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {
                    homeState.setCurrentPage(2);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('ethnicity'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {
                    homeState.setCurrentPage(3);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('religion'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {
                    homeState.setCurrentPage(4);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('goverment_position'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {
                    homeState.setCurrentPage(5);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('organization_position'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {
                    homeState.setCurrentPage(6);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('user'.tr),
                  onTap: () {
                    homeState.setCurrentPage(7);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text('module'.tr, style: TextStyle(
                fontFamily: 'Noto Sans Lao',
              ),),
              leading: Icon(Icons.view_module), //add icon
              childrenPadding: EdgeInsets.only(left: 60), //children padding
              children: [
                ListTile(
                  title: Text('economic_fund_money'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('movement_statistic'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('investment_project'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('dividend'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {},
                ),

              ],
            ),
            ExpansionTile(
              title: Text('report'.tr, style: TextStyle(
                fontFamily: 'Noto Sans Lao',
              ),),
              leading: Icon(Icons.report), //add icon
              childrenPadding: EdgeInsets.only(left: 60), //children padding
              children: [
                ListTile(
                  title: Text('consolidated_report'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('member_mass_organization'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('investment_project_report'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('dividend_report'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('report_giving_statistic'.tr, style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),),
                  onTap: () {},
                ),

              ],
            ),
            InkWell(
              onTap: () => {
                appVerification.removeToken(),
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()))
              },
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  'logout'.tr,
                  style: TextStyle(
                    fontFamily: 'Noto Sans Lao',
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
