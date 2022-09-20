import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/model/constant/color/colors.dart';
import 'package:noteapp/model/constant/size/size.dart';
import 'package:noteapp/view/home_screen/home.dart';
import 'package:noteapp/view/home_screen/widget/form_feild.dart';

class FlotingActionWidget extends StatelessWidget {
  const FlotingActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.bottomSheet(
          BottomSheet(
            onClosing: () {},
            builder: (ctx) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 50,
                ),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        TextFormWidget(
                          prefixIcon: Icons.title,
                          hintText: 'Title',
                          controller: titleController,
                        ),
                        kheight20,
                        TextFormWidget(
                          prefixIcon: Icons.content_copy,
                          hintText: 'Content',
                          controller: contentController,
                          maxline: 3,
                        ),
                        kheight20,
                        ElevatedButton.icon(
                          onPressed: () {
                            onSubmitClicked();
                          },
                          icon: const Icon(Icons.done),
                          label: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
          ),
        );
      },
      child: const Icon(
        Icons.add,
        size: 40,
      ),
    );
  }

  void onSubmitClicked() {
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      // index++;
      title.add(titleController.text);
      content.add(contentController.text);
      Get.offAll(() => const HomeScreen());
      Get.snackbar(
        'title',
        'message',
        titleText: const Center(
          child: Text(
            'Success',
            style: TextStyle(
              fontSize: 20,
              color: kgreen,
            ),
          ),
        ),
        messageText: const Center(
          child: Text(
            'Successfully Added',
            style: TextStyle(
              fontSize: 18,
              color: kwhite,
            ),
          ),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kblack,
        colorText: kwhite,
        maxWidth: 250,
        margin: const EdgeInsets.only(bottom: 15),
      );
      titleController.clear();
      contentController.clear();
    } else {
      Get.snackbar(
        'Error',
        'All Field are Required',
        titleText: const Center(
          child: Text(
            'Error',
            style: TextStyle(
              fontSize: 20,
              color: kred,
            ),
          ),
        ),
        messageText: const Center(
          child: Text(
            'All Field are Required',
            style: TextStyle(
              fontSize: 18,
              color: kwhite,
            ),
          ),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kblack,
        colorText: kwhite,
        maxWidth: 250,
        margin: const EdgeInsets.only(bottom: 15),
      );
    }
  }
}
