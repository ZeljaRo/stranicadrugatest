import 'package:file_picker/file_picker.dart';

Future<String?> odaberiTekstMapu() async {
  final result = await FilePicker.platform.getDirectoryPath();
  return result;
}
