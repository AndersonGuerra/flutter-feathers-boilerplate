import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFileToken async {
  final path = await _localPath;
  return File('$path/token');
}

Future<File> get _localFileUser async {
  final path = await _localPath;
  return File('$path/user');
}

deleteToken() async {
  final directory = await getApplicationDocumentsDirectory();
  await directory.delete(recursive: true);
}

Future<String> readToken() async {
  try {
    final file = await _localFileToken;

    String contents = await file.readAsString();
    return contents;
  } catch (e) {
    // If encountering an error, return 0
    return '';
  }
}

Future<File> writeToken(String token) async {
  final file = await _localFileToken;

  return file.writeAsString('$token');
}

Future<String> readUser() async {
  try {
    final file = await _localFileUser;

    String contents = await file.readAsString();

    return contents;
  } catch (e) {
    // If encountering an error, return 0
    return '';
  }
}

Future<File> writeUser(Object user) async {
  final file = await _localFileUser;
  user = json.encode(user);
  return file.writeAsString(user);
}
