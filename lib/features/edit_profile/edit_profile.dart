import 'package:bootcamp_starter/core/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/custom_labeled_textfield_widget.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final TextEditingController _textTitleController = TextEditingController();
  final TextEditingController _textLinkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _textTitleController.text = "Facebook";
    _textLinkController.text = "https://www.facebook.com/";

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
          title: const Text(
            "Edit",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          backgroundColor: Colors.black45,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 80),
                child: Column(
                  children: [
                    PrimaryLabeledTextFieldWidget(
                      controller: _textTitleController,
                      hint: 'Title',
                      keyboardType: TextInputType.emailAddress,
                      label: 'Title',
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    PrimaryLabeledTextFieldWidget(
                      controller: _textLinkController,
                      hint: 'Link',
                      keyboardType: TextInputType.emailAddress,
                      label: 'Link',
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    SecondaryButtonWidget(
                      width: 100,
                      onTap: () {},
                      text: 'Save ',
                    ),
                  ],
                ))));
  }
}
