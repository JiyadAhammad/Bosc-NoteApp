import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/model/constant/color/colors.dart';
import 'package:noteapp/model/constant/size/size.dart';
import 'package:noteapp/view/home_screen/widget/floting_action_widget.dart';
import 'package:noteapp/view/home_screen/widget/form_feild.dart';

final titleController = TextEditingController();
final contentController = TextEditingController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              snap: true,
              floating: true,
              expandedHeight: 150,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1.8,
                background: Container(
                  // height: MediaQuery.of(context).size.height * 0.7,
                  // width: MediaQuery.of(context).size.width * 0.9,
                  // // Below is the code for Linear Gradient.
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.blue,
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                ),
                title: const Text(
                  'NoteApp',
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 25,
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ];
        },
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: kblack,
                  style: BorderStyle.solid,
                  width: 2.5,
                ),
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'data',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: kblack,
                    ),
                    Expanded(
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const FlotingActionWidget(),
      ),
    );
  }
}
