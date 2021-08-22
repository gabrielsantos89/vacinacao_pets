import 'pet.dart';
import 'package:gsheets/gsheets.dart';

class PetSheetsApi {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "petsnope",
  "private_key_id": "a52b130d4b6002e97f28ab6a69139ecd5cc246bb",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCxv82CGI6rzGJa\nptpM4eP6FMMzCIffcRVbfT2ZqEuTOzGhH3OWwODFz8deRoqKnFAYruJ+frpeXj0A\nFzOVsnulv5jnN7fr2T215EELvxefKJty/7r0+W9qyDX4ghMMCfmd+0dqPfI6opI1\nTKet0+qf16/d5U7Cjj0UiVyyL2CPL3joM3B14kjYl8ELSy13NKDRi/++vPXZumVF\nEDWMckOyAjBmIxx+V2xhhcpkIk5m53OE1X9MxhUKTCA5gNe4C05cW8m/2C5l95Wy\nfqKZv08240ME4FIF2DvFC6uFjxVBcpFBmwnWAGAvwfLKHtfpBCkQltb4F4GimKET\nryvreA/fAgMBAAECggEACo2bsvSoS9TnpgAwB86FjYx8BmSkRITfQr5N0Pin/AbQ\nrINEhpfPAI+Ug6lmglJDgyOm+OGnSQEJWB8IhgPByZZ1iozJU6xjOJBjuEHRMjbj\n+9DpFbBViB547dczMEzLUDDiDZG99vM+AQIbFnv1eyYAIAmEQpLVV4nMQhwD/Jw4\nj+wgocYEBQQ6PoZwwSdmNBRvF0qLPz3Fw1BNfzznmqOfxdszXepsHwXYG3VMfhMm\njuBxBqzaMhgK46tNZE/0LWdqmG8sgzpYmCkxPGMtvsjnt4ctQadeY1g8YO6AhRHR\nZ9Yg7W+dNHkadLscaJoHjcLzdl+/qIdauNlvkZbnCQKBgQDhikqKg1+29BrsVmvF\njK5czOTJI3aCRotbJMrWQyKxzc5G+OD5uyZMxatAvfY8iJDpZoL90HBXQikUukRu\nfNtMNhrdl7SpqeHGXj+MI0Oqr19k+rmE/7Hsq8YMVIAXajvYQ6EJWuaROW3gPvO0\ndxUP7czsrOKfVwrRWtd/D/UnfQKBgQDJwTYrGiP5L2jQDS/72FsEKucWQSm6+Wyv\n6xslSYws7ezUFAuDVradYB20IaN8sQe+bAYPly+4uCIw0g57z2VmZOpF+U81XLHh\n2WzafMWVy04EChe/nQmOA/rVZNhrafmzjdSUzn2S9BI37MSO51hsHUtyVP7ug6ym\n2e0HyBJLiwKBgAMFhUYhyHB9CLdN2RfGcLeRjycasIXCSC+qaIVCVP6o0TCmOO1f\nkn3I0CiH4vqgocBevTaFSlwA6Of8LtqEFbQJrYZ2d9cmDX5I2PUZq9hnjRGfQkkD\n2/BdxMN5hlXJ+I9HKKslap1bdZthfIZYahHSj8JD9q1Hzz9KxkRPhGtJAoGBALGc\n/bH+RlMV0KDwKyD8fEvz9RJbdYBcGrnYMUKnN9dJ8idWKjiKuyNavWuZ/ZJFSzrx\nYHiTMXjd6YOvOP74Ox1kk/XcIEYq/5KDVdgW5d8UZu8Zb4TJm+LBUC5SpFATsLbI\nkrAaBOS9J9jCANyJgAdV1tilSPTzSKhuy8QA91I3AoGBAM9Kyz0Z+ufO3hZlPrvH\n9px1KCu+WNatXqbaWcMgSQmMZeHHhKlMdxpyVJ5gMMCi743RAVG4u/twgVlNBWt8\nSMS9o13CXLWbTajyRGxZ6IYqv+yJ9jWfYfyVA0Feu1K9zGFJipjruiZBTA3PeOT6\n66zQIwwd5QQunEcG6xmbq/2s\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@petsnope.iam.gserviceaccount.com",
  "client_id": "116299565951311570395",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40petsnope.iam.gserviceaccount.com"
}
  ''';
  static final _spreadsheetId = '1p0bTR4bAfdLdslhtFk3UbCLWKyfRBHWB3bvuDCTNcS4';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _petSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _petSheet = await _getWorkSheet(spreadsheet, title: 'pets');

      final firstRow = PetFields.getFields();
      _petSheet!.values.insertRow(1, firstRow);
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
    if (_petSheet == null) return 0;

    final lastRow = await _petSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future<List<Pet>> getAll() async {
    if (_petSheet == null) return <Pet>[];

    final pets = await _petSheet!.values.map.allRows();
    return pets == null ? <Pet>[] : pets.map(Pet.fromJson).toList();
  }

  static Future<Pet?> getById(int id) async {
    if (_petSheet == null) return null;

    final json = await _petSheet!.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : Pet.fromJson(json);
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_petSheet == null) return;

    _petSheet!.values.map.appendRows(rowList);
  }

  static Future<bool> update(
      int id,
      Map<String, dynamic> pet,
      ) async {
    if (_petSheet == null) return false;

    return _petSheet!.values.map.insertRowByKey(id, pet);
  }

  static Future<bool> updateCell({
    required int id,
    required String key,
    required dynamic value,
  }) async {
    if (_petSheet == null) return false;

    return _petSheet!.values.insertValueByKeys(
      value,
      columnKey: key,
      rowKey: id,
    );
  }

  static Future<bool> deleteById(int id) async {
    if (_petSheet == null) return false;

    final index = await _petSheet!.values.rowIndexOf(id);
    if (index == -1) return false;

    return _petSheet!.deleteRow(index);
  }
}
