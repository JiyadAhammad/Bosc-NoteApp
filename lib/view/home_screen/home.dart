import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/controller/note_controller.dart';
import 'package:noteapp/model/constant/color/colors.dart';
import 'package:noteapp/view/home_screen/widget/floting_action_widget.dart';

final titleController = TextEditingController();
final contentController = TextEditingController();
List<String> title = [];
List<String> content = [];
// int index = 0;

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
                  'Note App',
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
        body: GetBuilder<NoteAppController>(
            init: NoteAppController(),
            builder: (notecontroller) {
              return title.isEmpty
                  ? const Center(
                      child: Text(
                        'No Data Found',
                        style: TextStyle(
                          color: kblack,
                          fontSize: 30,
                        ),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        crossAxisCount: 2,
                        childAspectRatio: 4 / 3,
                      ),
                      itemCount: title.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onLongPress: () {
                            notecontroller.deleteList(index);
                            // setState(() {
                            //   title.removeAt(index);
                            //   print('hai');
                            //   print(index);
                            // });
                          },
                          child: Container(
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
                                children: [
                                  Text(
                                    title[index].toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: kblack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 2,
                                    color: kblack,
                                  ),
                                  Expanded(
                                    child: Text(
                                      content[index],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: kblue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
            }),
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
