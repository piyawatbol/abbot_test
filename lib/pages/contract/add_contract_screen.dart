import 'package:abbon_test/controllers/contact_controller.dart';
import '../../config/app_import.dart';

class AddContractScreen extends StatelessWidget {
  const AddContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AutoText(
            LocaleKeys.addContact,
            fontSize: 22,
            translate: true,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: GetBuilder<ContractController>(
          init: ContractController(),
          builder: (controller) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      buildTextField(controller.thFirstName,
                          LocaleKeys.thaiName, 'Please enter Thai first name'),
                      buildTextField(controller.thLastName, LocaleKeys.thaiLast,
                          'Please enter Thai last name'),
                      buildTextField(controller.enFirstName, LocaleKeys.engName,
                          'Please enter English first name'),
                      buildTextField(controller.enLastName, LocaleKeys.engLast,
                          'Please enter English last name'),
                      buildTextField(controller.age, LocaleKeys.age,
                          'Please enter English last name'),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.formKey.currentState?.validate() ??
                                false) {
                              controller.addContact();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                          child: const AutoText(
                            LocaleKeys.submit,
                            translate: true,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildTextField(
      TextEditingController controller, String label, String errorMsg) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoText(
            label,
            translate: true,
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType:
                label == "Age" ? TextInputType.number : TextInputType.name,
            controller: controller,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 14),
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorMsg;
              }

              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget buildAgeField(
      TextEditingController controller, String label, String errorMsg) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.only(left: 14),
          enabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMsg;
          }
          if (int.tryParse(value) == null) {
            return 'Please enter a valid number';
          }
          return null;
        },
      ),
    );
  }
}

Widget buildTextFeild(
    TextEditingController controller, String head, String errorMsg) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoText(head),
        const SizedBox(height: 10),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return errorMsg;
            }
            if (int.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
            return null;
          },
          cursorColor: Colors.black,
          controller: controller,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 14),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
          ),
        ),
      ],
    ),
  );
}
