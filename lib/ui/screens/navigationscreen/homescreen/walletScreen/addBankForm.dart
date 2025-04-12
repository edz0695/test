import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/core/components/print_text.dart';
import 'package:payapp/core/utils/helper/helper.dart';
import 'package:payapp/models/bank_model.dart';
import 'package:payapp/provider/loginSignUpProvider.dart';
import 'package:payapp/provider/walletProvider.dart';
import 'package:payapp/ui/widgets/formfieldwidget.dart';
import 'package:provider/provider.dart';
import '../../../../../data/model/body/notification_body.dart';
import '../../../../../themes/colors.dart';
import '../../../../../view/screens/auth/sign_in_screen.dart';
import '../../../../widgets/app_bar_widget.dart';
import '../../../loginscreen/loginscreen.dart';

class AddBankForm extends StatefulWidget {
  const AddBankForm({super.key, required this.languages, required this.body});

  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  @override
  State<AddBankForm> createState() => _AddBankFormState();
}

class _AddBankFormState extends State<AddBankForm> {
  final _accountHolderNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _bankNameController = TextEditingController();
  final _ifscCodeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: const AppBarWidget(title: "Add Bank", size: 55),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormFieldWidget(
                        title: "Account Holder Name",
                        editingController: _accountHolderNameController,
                      ),
                      FormFieldWidget(
                          title: "Account Number",
                          editingController: _accountNumberController),
                      FormFieldWidget(
                          title: "BankName",
                          editingController: _bankNameController),
                      FormFieldWidget(
                          title: "IFSC Code",
                          editingController: _ifscCodeController),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: ThemeColors.primaryBlueColor,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.white24,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  final loginSignUpProvider =
                      Provider.of<LoginSignUpProvider>(context, listen: false);
                  if (loginSignUpProvider.userModel != null) {
                    final walletProvider =
                        Provider.of<WalletProvider>(context, listen: false);
                    printThis(loginSignUpProvider.userModel?.id);
                    walletProvider
                        .addBank(
                            bankModel: BankModel(
                                userId: loginSignUpProvider.userModel!.id,
                                bankName: _bankNameController.text,
                                accountHolderName:
                                    _accountHolderNameController.text,
                                accountNumber: _accountNumberController.text,
                                ifscCode: _ifscCodeController.text))
                        .then((value) {
                      showScaffold(context, value);
                      Navigator.pop(context);
                    }).onError((error, stackTrace) {
                      showScaffold(context, "$error");
                    });
                  } else {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        fullscreenDialog: true,
                        builder: (context) =>
                            SignInScreen(exitFromApp: true, backFromThis: true),
                      ),
                    );
                  }
                }
              },
              child: Container(
                height: 60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(1000)),
                child: Center(
                  child: Text(
                    "Submit".toUpperCase(),
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
