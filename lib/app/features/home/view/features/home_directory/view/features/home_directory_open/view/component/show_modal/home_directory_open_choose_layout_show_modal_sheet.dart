

import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/cubit/home_directory_open_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/cubit/home_directory_open_state.dart';
import 'package:DocuSort/app/product/enum/page_layout_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDirectoryOpenChooseLayoutShowModalSheet extends StatelessWidget {
  const HomeDirectoryOpenChooseLayoutShowModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeDirectoryOpenCubit>();

    return BlocBuilder<HomeDirectoryOpenCubit, HomeDirectoryOpenState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: PageLayoutEnum.values.length,
          itemBuilder: (BuildContext context, int index) {
            final item = PageLayoutEnum.values[index];

            return ListTile(
              leading: Icon(item.pageLayoutIcon),
              title: Text(
                item.pageLayoutName,
                style: TextStyle(
                  fontWeight: item == state.pageLayoutModel?.pageLayoutEnum
                      ? FontWeight.bold
                      : null,
                ),
              ),
              onTap: () {
                cubit.updateHomeOpenLayout(item);
              },
            );
          },
        );
      },
    );
  }
}
