import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/search_favorite_directory/bloc/search_favorite_directory_cubit.dart';
import 'package:DocuSort/app/features/search_favorite_directory/bloc/search_favorite_directory_state.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchFavoriteDirectoryView extends StatelessWidget {
  const SearchFavoriteDirectoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchFavoriteDirectoryCubit()..initDatabase(),
      child: BlocConsumer<SearchFavoriteDirectoryCubit,
          SearchFavoriteDirectoryState>(
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
              SearchFavoriteDirectoryStatus.start =>
                _getCircularProgressIndicator,
              SearchFavoriteDirectoryStatus.initial => Padding(
                  padding: context.padding.normal,
                  child: Column(
                    children: [
                      TextField(
                        decoration:
                            const InputDecoration(icon: Icon(Icons.search)),
                        controller: context
                            .read<SearchFavoriteDirectoryCubit>()
                            .searchFavoriteController,
                        onChanged: (value) {
                          context
                              .read<SearchFavoriteDirectoryCubit>()
                              .updateFavoriteDirectoryController(value);
                        },
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.searchResultList?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            final item = state.searchResultList![index];
                            final directoryModel = item?.directoryModel;
                            return item == null
                                ? const SizedBox()
                                : ListTile(
                                    onTap: () {
                                      context.router.push(
                                        HomeDirectoryOpenRoute(
                                          directoryModel: directoryModel,
                                        ),
                                      );
                                    },
                                    leading: Text(
                                      directoryModel?.name ?? '',
                                    ),
                                  );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              SearchFavoriteDirectoryStatus.loading =>
                _getCircularProgressIndicator,
              SearchFavoriteDirectoryStatus.error =>
                _getCircularProgressIndicator,
            },
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  Widget get _getCircularProgressIndicator {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
