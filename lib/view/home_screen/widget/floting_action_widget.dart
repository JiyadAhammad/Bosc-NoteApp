import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                          maxline: 5,
                        ),
                        kheight20,
                        ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.done),
                            label: const Text('Submit'))
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
}
