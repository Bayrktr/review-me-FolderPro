import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/search_directory/bloc/search_directory_cubit.dart';
import 'package:DocuSort/app/features/search_directory/bloc/search_directory_state.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchDirectoryView extends StatelessWidget {
  const SearchDirectoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchDirectoryCubit()..initDatabase(),
      child: BlocConsumer<SearchDirectoryCubit, SearchDirectoryState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  context.router.maybePop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            body: switch (state.status) {
              SearchDirectoryStatus.start =>
                _getCircularProgressIndicator(context: context),
              SearchDirectoryStatus.initial => Padding(
                  padding: context.padding.normal,
                  child: Column(
                    children: [
                      TextField(
                        decoration:
                            const InputDecoration(icon: Icon(Icons.search)),
                        controller: context
                            .read<SearchDirectoryCubit>()
                            .searchDirectoryController,
                        onChanged: (value) {
                          context
                              .read<SearchDirectoryCubit>()
                              .updateSearchDirectoryController(value);
                        },
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.searchResultList?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            final item = state.searchResultList![index];
                            return item == null
                                ? const SizedBox()
                                : ListTile(
                                    onTap: () {
                                      context.router.push(
                                        HomeDirectoryOpenRoute(
                                          directoryModel: item,
                                        ),
                                      );
                                    },
                                    leading: Text(
                                      item.name ?? '',
                                    ),
                                  );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              SearchDirectoryStatus.loading =>
                _getCircularProgressIndicator(context: context),
              SearchDirectoryStatus.error =>
                _getCircularProgressIndicator(context: context),
              SearchDirectoryStatus.finish =>
                _getCircularProgressIndicator(context: context),
            },
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  Widget _getCircularProgressIndicator({
    required BuildContext context,
  }) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
