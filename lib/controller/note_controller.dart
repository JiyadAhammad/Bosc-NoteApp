import 'package:get/get.dart';
import 'package:noteapp/view/home_screen/home.dart';

class NoteAppController extends GetxController {
  deleteList(index) {
    title.removeAt(index);
    content.removeAt(index);
    update();
  }
}
