import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../statemanagement/setting_state.dart';

class SubjectPage extends StatefulWidget {
  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  String? chooseValue;
  List itemList = ['ໃຊ້ງານ', 'ບໍ່ໃຊ້ງານ'];
  final DataTableSource _data = MyData();
  SettingState settingState = Get.put(SettingState());

  @override
  void initState() {
    chooseValue = 'ໃຊ້ງານ';
    settingState.getsubjectData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: h * 0.006,
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.0),
            child: SizedBox(
              width: 90,
              height: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  createDialog(context);
                },
                child: Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: Colors.white,
                        size: 16,
                      ),
                      Text('add'.tr),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.006,
          ),
          SizedBox(
            width: w*0.5,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'search'.tr,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(width: 0.025, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(width: 1, color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              textInputAction: TextInputAction.done,
            ),
          ),
          SizedBox(
            height: h * 0.006,
          ),
          GetBuilder<SettingState>(
            builder: (getData) {
              if (getData.checkData == true) {
                return Expanded(
                  child: ListView(
                    children: [
                      PaginatedDataTable(
                        columns: [
                          DataColumn(
                            label: Text(
                              'no'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'name'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'status'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'action'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        source: _data,
                        header: Text('subject'.tr),
                        columnSpacing: 2,
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future createDialog(context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('add'.tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: 'Noto Sans Lao')),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('name'.tr,
                    style: TextStyle(
                        fontSize: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) *
                            0.01,
                        fontFamily: 'Noto Sans Lao')),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'ຊື່',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                ),
                Text('status'.tr,
                    style: TextStyle(
                        fontSize: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) *
                            0.01,
                        fontFamily: 'Noto Sans Lao')),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.004,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: DropdownButton(
                      hint: Text("ເລືອກ"),
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      isExpanded: true,
                      underline: SizedBox(),
                      value: chooseValue,
                      onChanged: (newValue) {
                        setState(() {
                          chooseValue = newValue.toString();
                        });
                      },
                      items: itemList.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          }),
          actions: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('ຍົກເລີກ',
                          style: TextStyle(
                              fontSize: (MediaQuery.of(context).size.width +
                                      MediaQuery.of(context).size.height) *
                                  0.008,
                              color: Colors.red,
                              fontFamily: 'Noto Sans Lao'))),
                  Padding(
                    padding: EdgeInsets.only(left: 2.0),
                    child: SizedBox(
                      width: 70,
                      height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {

                        },
                        child: Text('save'.tr),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class MyData extends DataTableSource {
  SettingState settingState = Get.put(SettingState());
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text('${index + 1}')),
      DataCell(Text(settingState.subjectdataList[index]['title'])),
      DataCell(Text('ໃຊ້ງານ')),
      DataCell(
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow, // background
                  onPrimary: Colors.black, // foreground
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 10,
                    ),
                    Text(
                      'edit'.tr,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 10,
                    ),
                    Text(
                      'delete'.tr,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => settingState.subjectdataList.length;
  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
