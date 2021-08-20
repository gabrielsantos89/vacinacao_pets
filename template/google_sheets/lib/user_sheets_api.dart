import 'package:google_sheets/user.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetsApi {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "petsnoop",
  "private_key_id": "9442de675c4aca9625481480cfa63e82e6a2c3bb",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQChX47GQlMLjS5c\nR3Gd8izksoZ3EmW50VndACyFrosyWszJoni69cQ5bg/C77lsQni3lVBqPkR16AYm\nM5p1o9iR4qnpAPRwqnRVo3HGDzef3Y0gbGUmBps4mq10ouq+GgxcV9mR3/hujMRb\nt1/8sgVBpNMDlG6iSY7HmgKkXP768Rcr9m8A5dpfEZvcMiwTYrzU+5V4Gapc8Zs3\nxswcrBurnKOGikFUEtmXkYb1zJGdQKdBjFDSOF+HbLkyaMpecpi+DbGqhhKGL2YN\natJOG7oJtaNglkp736vrW+NWlBQq4XW7Kie4Yog0oDvtRW9V65wSdJEwKLdc1U9Q\nN8A553t9AgMBAAECggEAHNUjf+Xqy5YSkfdL5BIYllYVc2Hsngo7OaLl0Y7RnRIf\nI+mtE46E3FP/ae+GHEM2KWr6vrjYZ46oxpuSvfEj6VDr1c9PXW//MCvvUJl4cU5X\nAFONsQEeK7trQXs4YPXrfnZNz+QKEcqB7PczJcWy7bsi3rFfIQzuf1hTn4VkI3a2\ncIsHyPmE3jeAjcRKJRmy+lLF82Rt5NvGJBFUFm31/sYxUZbxqXdNzlZub4urHeUj\nQbWgpIxYtYXK1hj7Wr5TmRJ7Q7B2XzBjbTY5GhgByF7El211v8Wo9zM1PMXmJf7/\nlIRWs0G4xGH+OWOuAmJVDXSclq1XdxPUdwuTq1V6SwKBgQDMvdGB0gamk2e6oaTx\nJJJ3k1s9wzt9XB7GcmnOSBJ2AuydxN022eH/y9wt2fLqFJVGOjRV/bXGHap2nC1g\nr+1HiZfT1cwhM+9UJEGJNKojIGuDOW4aT0X1AynTRsm44xoeDh2N8PDJTYOea0TM\nCXwCJii9ieqYpGMl71tm/UDW3wKBgQDJxjUY/uB5SqT0bdsNUahhajVwgYmBtBqj\nijQo5OXOnQUQ4OEJHOSZWkezgte0ggdRnnBFuj4Th4vsePZIy6NFvX5PHoHzg+Iz\nTb9uUw9oRSexXvXKghMAwD+yB/XuMDfxr8iob5SM6WQG7oqaniPQ4+W6PR4vw59I\n+8Rng+BFIwKBgGrvwduijSK33vfVscbZqT6XUpKhxBKn6NMRsz2w2yOUR23oAvrB\nNo9aNPgl3ABzG7yAbhFz4FtH517oF7Nmb/JrZUeZZXL6I0i5XxmAzlRmfIEfn+hR\n+2ILcu8NDBNrWprUGI+ohrs9pz85G8fONF0S/ThyLnvncHnB2OWj5RfVAoGACSgD\ndNTsHtTyU11A2YPhHjqRnj9inA4uP0mgQFLS0uNxPWjXDXDQNt1P76d6XmigKGYG\nNkPTWVOHV/3NP1RuXlXRC4oY35IWi7l1fG4sftDUkkn64WuxrREMUunlkR+DCmat\ntmcJ2LMmpOHiTE3s1ifhXugzHHvGGKvEJ+ZmIP0CgYEAgVVed6VuAJeZgbiiyvJE\nCTk8YgmeqxVGeWr9CM/5T5/5XNbfifuayhh0IJTLWFwTjAWOVm3dfBab0zgZTti6\njqfx923DuLlA/jDohc2HeH5NvtUlolKPN2d0dSB/86gKKz86G2o/Mps2Yp4vwuv1\nVswFvANkRFOa+J/dufDwR3M=\n-----END PRIVATE KEY-----\n",
  "client_email": "petsnoop@petsnoop.iam.gserviceaccount.com",
  "client_id": "109441148690282743933",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/petsnoop%40petsnoop.iam.gserviceaccount.com"
}
  ''';
  static final _spreadsheetId = '1avA4RhsCkgzt09Jerq1jQa0GYcjI2bwTlg1Orc2e8YY';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Users');

      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet, {
        required String title,
      }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<int> getRowCount() async {
    if (_userSheet == null) return 0;

    final lastRow = await _userSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future<List<User>> getAll() async {
    if (_userSheet == null) return <User>[];

    final users = await _userSheet!.values.map.allRows();
    return users == null ? <User>[] : users.map(User.fromJson).toList();
  }

  static Future<User?> getById(int id) async {
    if (_userSheet == null) return null;

    final json = await _userSheet!.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : User.fromJson(json);
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;

    _userSheet!.values.map.appendRows(rowList);
  }

  static Future<bool> update(
      int id,
      Map<String, dynamic> user,
      ) async {
    if (_userSheet == null) return false;

    return _userSheet!.values.map.insertRowByKey(id, user);
  }

  static Future<bool> updateCell({
    required int id,
    required String key,
    required dynamic value,
  }) async {
    if (_userSheet == null) return false;

    return _userSheet!.values.insertValueByKeys(
      value,
      columnKey: key,
      rowKey: id,
    );
  }

  static Future<bool> deleteById(int id) async {
    if (_userSheet == null) return false;

    final index = await _userSheet!.values.rowIndexOf(id);
    if (index == -1) return false;

    return _userSheet!.deleteRow(index);
  }
}
