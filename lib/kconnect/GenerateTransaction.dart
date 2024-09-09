import 'dart:io';
import 'dart:math';

/*
import 'package:excel/excel.dart';
import 'package:k_conect/flutter_flow/uploaded_file.dart';

import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/upload_data.dart';
*/

/*
generateTransaction(String filePath) async {
  print("generateTransaction");
  print(filePath);

  var bytes = File(filePath).readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  int startNumber = 1;

  DateTime tmpDateIn = getCurrentTimestamp.subtract(const Duration(days: 4));

  for (int tableIndex = 0; tableIndex < excel.tables.keys.length; tableIndex++) {
    String tableName = excel.tables.keys.elementAt(tableIndex);
    var sheet = excel.tables[tableName];

    if (sheet != null) {
      int maxCols = sheet.maxColumns;
      int maxRows = sheet.rows.length;

      print("maxRows : $maxRows");

      for (int rowIndex = 0; rowIndex < maxRows; rowIndex++) {
        var row = sheet.rows[rowIndex];
        List<dynamic> rowData = [];

        for (int colIndex = 0; colIndex < maxCols; colIndex++) {
          if (colIndex == 2 || colIndex == 3 || colIndex == 4 || colIndex == 5 || colIndex == 7 || colIndex == 8 || colIndex == 9 || colIndex == 10) {
            var cellValue = colIndex < row.length ? row[colIndex]?.value : '';
            if (colIndex == 5) {
              var tmp = cellValue.toString().replaceAll('"', '');
              tmp = tmp.replaceAll("/", " ");
              rowData.add(tmp ?? '');
            } else {
              var tmp = cellValue ?? '';
              tmp = tmp.toString().replaceAll('"', '');
              rowData.add(tmp);
            }
          }
        }
        if (rowIndex >= 2) {
          tmpDateIn = tmpDateIn.add(const Duration(minutes: 1));
          Random random = Random();
          int randomSeconds = random.nextInt(30);
          tmpDateIn = tmpDateIn.add(Duration(seconds: randomSeconds));

          DateTime tmpDateOut = tmpDateIn;
          tmpDateOut = tmpDateOut.add(const Duration(seconds: 30));
          Random random2 = Random();
          int randomSeconds2 = random2.nextInt(30);
          tmpDateOut = tmpDateOut.add(Duration(seconds: randomSeconds2));

          Duration difference = tmpDateOut.difference(tmpDateIn);

          String formattedNumber = startNumber.toString().padLeft(8, '0');
          startNumber = startNumber + 1;

          var license_plate_id = '${rowData[4]}${rowData[5]}${rowData[6]}'.trim();

          var contact_department = rowData[3].trim();
          var contact_name_personnel = '${rowData[1]} ${rowData[2]}'.trim();
          var member_no = rowData[0].trim();
          var province = rowData[7].trim();

          var addition_fields_value = additionFieldsValue(license_plate_id, province, member_no, contact_name_personnel, contact_department);

          var tmpDateOut2 = tmpDateOut.add(const Duration(days: 365 * 2));

          var firebaseData = {
            "addition_fields_value": addition_fields_value,
            "addition_remark": '',
            "bill_no": formattedNumber,
            "car_type": 'รถยนต์',
            "card_missing": false,
            "close_home_reason": '',
            "contact_address_name": '',
            "contact_department": contact_department,
            "contact_name_personnel": contact_name_personnel,
            "customer_name": 'บริษัท ไดซิน จำกัด (นครราชสีมา)',
            "date_in": tmpDateIn,
            "date_out": tmpDateOut,
            "device_id": '',
            "is_already_out": true,
            "is_close_home": false,
            "is_from_kvisit_plus": true,
            "is_ticket_pass": true,
            "is_vip": false,
            "license_plate_id": license_plate_id,
            "member_no": member_no,
            "prefix_address": '',
            "province": province,
            "row_for_stat": true,
            "search_field": license_plate_id,
            "search_value": '2_$license_plate_id',
            "sum_amount": 0,
            "sum_total_time": difference.inSeconds,
            "ticket_no": formattedNumber,
            "ticket_pass_create_date": tmpDateOut,
            "ticket_pass_expire_date": tmpDateOut2,
            "trans_status": 2,
            "use_coupon": false,
            "use_koder3_cloud_photo": false,
            "use_koder3_cloud_photo_encrypt": true,
          };

          var collectionPath = "backup/บริษัท ไดซิน จำกัด (นครราชสีมา)/transactions";

          FirebaseFirestore.instance.collection(collectionPath).doc().set(firebaseData);
          tmpDateIn = tmpDateOut;
        }
      }
    }
  }
}

additionFieldsValue(license_plate_id, province, member_no, contact_name_personnel, contact_department) {
  return '{"car_type":{"field":"car_type","report_field":"ประเภท","value":"รถยนต์","type":"list"},"license_plate_id":{"field":"license_plate_id","report_field":"ทะเบียนรถ","value":"$license_plate_id","type":"text"},"province":{"field":"province","report_field":"จังหวัด","value":"$province","type":"search_choices"},"member_no":{"field":"member_no","report_field":"รหัสพนักงาน","value":"$member_no","type":"number"},"contact_name_personnel":{"field":"contact_name_personnel","report_field":"ชื่อพนักงาน","value":"$contact_name_personnel","type":"text"},"contact_department":{"field":"contact_department","report_field":"แผนก","value":"$contact_department","type":"list"},"contact_address_name":{"field":"contact_address_name","report_field":"เลขที่บ้าน","value":"","type":"text"}}';
}
*/

