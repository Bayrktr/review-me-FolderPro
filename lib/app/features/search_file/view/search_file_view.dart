import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/search_file/bloc/search_file_cubit.dart';
import 'package:DocuSort/app/features/search_file/bloc/search_file_state.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/app/product/repository/file/pdf_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_file_mixin.dart';

@RoutePage()
class SearchFileView extends StatelessWidget with _SearchFileMixin {
  const SearchFileView({super.key, this.directoryModel});

  final BaseDirectoryModel? directoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchFileCubit(
        PdfRepository(directoryModel?.fileListKey),
        directoryModel,
      )..initDatabase(),
      child: BlocConsumer<SearchFileCubit, SearchFileState>(
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
                SearchFileStatus.start =>
                  _getCircularProgressIndicator(context: context),
                SearchFileStatus.initial => Padding(
                    padding: context.padding.normal,
                    child: Column(
                      children: [
                        TextField(
                          decoration:
                              const InputDecoration(icon: Icon(Icons.search)),
                          controller: context
                              .read<SearchFileCubit>()
                              .searchFileController,
                          onChanged: (value) {
                            context
                                .read<SearchFileCubit>()
                                .updateSearchFileController(value);
                          },
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.searchResultList?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              final item = state.searchResultList?[index];
                              return item == null
                                  ? const SizedBox()
                                  : ListTile(
                                      onTap: () {
                                        context.router.push(
                                          getNavigatePageRoute(
                                            directoryModel?.fileTypeEnum,
                                            fileBaseModel: item,
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
                SearchFileStatus.loading =>
                  _getCircularProgressIndicator(context: context),
                SearchFileStatus.error =>
                  _getCircularProgressIndicator(context: context),
                SearchFileStatus.finish =>
                  _getCircularProgressIndicator(context: context),
              },);
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
