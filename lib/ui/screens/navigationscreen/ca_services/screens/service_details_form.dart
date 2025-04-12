import 'dart:io';
import 'package:get/get.dart';
import '../../../../../src/src.dart';
import '../../../../widgets/app_bar_widget.dart';
import 'phonepe_payment_screen.dart';

class ServiceDetailsForm extends StatefulWidget {
  final String id, price, title;

  const ServiceDetailsForm(
      {super.key, required this.id, required this.price, required this.title});

  @override
  State<ServiceDetailsForm> createState() => _ServiceDetailsFormState();
}

class _ServiceDetailsFormState extends State<ServiceDetailsForm> {
  @override
  Widget build(BuildContext context) {
    final CAServicesController controller = Get.find<CAServicesController>();
    controller.fetchCAServiceFormData(widget.id);

    return Scaffold(
      appBar: const AppBarWidget(
        title: "Service Details Form",
        size: 55,
      ),
      body: Obx(() {
        final fields = controller.cAServiceFormModel.value?.data ?? [];
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              controller.loading.value
                  ? Padding(
                      padding: EdgeInsets.only(top: Get.size.height * .4),
                      child: loading(),
                    )
                  : fields.isEmpty
                      ? Center(
                          child: Padding(
                          padding: EdgeInsets.only(top: Get.size.height * .4),
                          child: Text(
                            "CA Form not found",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ))
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: fields.first.formData.length,
                          itemBuilder: (context, index) {
                            final field = fields.first.formData[index];
                            final textLength = fields.first.formData
                                .where((i) =>
                                    i.type == "text" || i.type == "number")
                                .toList();

                            return field.type == 'file'
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Card(
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                            overlayColor: Colors.indigo,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        onPressed: () async =>
                                            await controller.pickFile(field.id,
                                                field.label, field.type),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                field.label,
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11),
                                              ),
                                              SizedBox(height: 10),
                                              Card(
                                                shape: StadiumBorder(),
                                                child: Obx(() {
                                                  final file = controller
                                                      .fileData[field.id];
                                                  if (file == null) {
                                                    return const Padding(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Icon(
                                                        Icons
                                                            .upload_file_outlined,
                                                        color: Colors.indigo,
                                                        size: 50,
                                                      ),
                                                    );
                                                  } else {
                                                    return CircleAvatar(
                                                      radius: 60,
                                                      backgroundImage:
                                                          FileImage(
                                                              File(file.path)),
                                                    );
                                                  }
                                                }),
                                              ),
                                              SizedBox(height: 10),
                                              const Text(
                                                "Choose File",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: TextField(
                                          textInputAction:
                                              index == textLength.length
                                                  ? TextInputAction.done
                                                  : TextInputAction.next,
                                          onSubmitted: (value) =>
                                              controller.updateTextField(
                                                  field.label,
                                                  value,
                                                  field.type),
                                          decoration: InputDecoration(
                                            label: Text(field.label),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                          }),
              const SizedBox(height: 16),
              fields.isEmpty
                  ? SizedBox()
                  : ElevatedButton(
                      onPressed: () async => Get.to(() => PhonePePaymentWidget(
                            callback: () async => await controller.cAFormAPI(
                                widget.price, widget.id, widget.title),
                            price: widget.price,
                          )),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.indigo),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20)),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        textStyle: WidgetStateProperty.all<TextStyle>(
                          const TextStyle(fontSize: 16),
                        ),
                      ),
                      child: controller.formLoading.value
                          ? loading(color: Colors.white)
                          : const Text(
                              'Submit',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
            ],
          ),
        );
      }),
    );
  }
}
