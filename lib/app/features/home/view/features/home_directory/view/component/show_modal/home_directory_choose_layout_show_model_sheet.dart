import 'package:DocuSort/app/features/home/view/features/home_directory/bloc/home_directory_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/bloc/home_directory_state.dart';
import 'package:DocuSort/app/product/enum/page_layout_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDirectoryChooseLayoutShowModelSheet extends StatelessWidget {
  const HomeDirectoryChooseLayoutShowModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeDirectoryCubit>();

    return BlocBuilder<HomeDirectoryCubit, HomeDirectoryState>(
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
                cubit.updateHomeLayout(item);
              },
            );
          },
        );
      },
    );
  }
}
