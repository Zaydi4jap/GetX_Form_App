import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_form/models/form.dart';

class FormController extends GetxController {
  var forms = List<Efoem>.empty().obs;

  @override
  void onInit() {
    List? storedForms = GetStorage().read<List>('form');
    if (storedForms != null) {
      forms = storedForms.map((e) => Efoem.fromJson(e)).toList().obs;
    }
    ever(forms, (_) {
      GetStorage().write('form', forms.toList());
    });
    super.onInit();
  }
}
