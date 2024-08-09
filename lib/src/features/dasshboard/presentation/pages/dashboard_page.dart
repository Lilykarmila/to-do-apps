import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do_apps/src/features/main/my_task/presentation/widgets/header_container.widget.dart';
import 'package:to_do_apps/src/features/main/my_task/presentation/widgets/list_task.widget.dart';

import '../../../../commons/card_task.widget.dart';
import '../../../../commons/section_heading_widget.dart';



class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContainer(
              showSearch: false,
              leftIcon: Iconsax.profile_2user,
              onLeftIconPressed: () {},
              rightIcon: Iconsax.setting_2,
              // onRightIconPressed: (),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CardTaskWidget(),
                      CardTaskWidget(),
                    ],
                  ),
                  const SectionHeadingWidget(
                    title: 'Project',
                  ),
                  const SizedBox(height: 10),

                  ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 5),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return const ListTaskWidget(
                        showCheckbox: false,
                        icon: Iconsax.tag,
                        iconSize: 25,
                        iconColor: Colors.orangeAccent,
                        taskTitle: 'Career Foundry Course',
                        additionalText: '5',
                      );
                    },
                  ),

                  const SizedBox(height: 20),
                  const SectionHeadingWidget(
                    title: 'Label',
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const PageScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 3.5,
                    ),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return const ListTaskWidget(
                        icon: Iconsax.tag,
                        iconSize: 20,
                        taskTitle: 'Label',
                        iconColor: Colors.deepOrange,
                        showCheckbox: false,
                      );
                    },
                  ),

                  ///----
                  const SizedBox(height: 20),
                  const SectionHeadingWidget(title: 'Status'),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const PageScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 2.5,
                    ),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return const ListTaskWidget(
                        icon: Icons.circle,
                        iconSize: 15,
                        taskTitle: 'Study',
                        iconColor: Colors.deepOrange,
                        showCheckbox: false,
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
