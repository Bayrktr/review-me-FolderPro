part of 'edit_directory_view.dart';

mixin _EditDirectoryMixin on StatelessWidget {
  Widget getAllFileListViewBuilder({
    required EditDirectoryState state,
    required BuildContext context,
  }) {
    return switch (state.allFileStatus) {
      EditDirectoryAllFileStatus.start => const CircularProgressIndicator(),
      EditDirectoryAllFileStatus.initial => Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          height: context.sized.dynamicHeight(0.2),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final item = state.allFilesModel?.allFiles[index];
              if (item == null) {
                return const SizedBox();
              }
              return ListTile(
                leading: Text(item.name.forNull.getGeneralNullMessage),
                trailing: IconButton(
                  onPressed: () {
                    IShowDialog(
                      context: context,
                      widget: EditDirectoryShowModelSheet(
                        onDelete: () {
                          context
                              .read<EditDirectoryCubit>()
                              .deleteFileFromDirectory(item);
                        },
                        onEdit: () {},
                        fileModel: item,
                      ),
                    ).showBottomSheet();
                  },
                  icon: const Icon(
                    Icons.more_vert,
                  ),
                ),
              );
            },
            itemCount: state.allFilesModel?.allFiles.length ?? 0,
          ),
        ),
      EditDirectoryAllFileStatus.loading => const CircularProgressIndicator(),
      EditDirectoryAllFileStatus.error => const LocaleText(
          text: LocaleKeys.errors_nullErrorMessage,
        ),
    };
  }

  Widget getAddPdfButton({
    required BuildContext context,
    required BaseDirectoryModel directoryModel,
  }) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(
          Size(
            context.sized.dynamicWidth(0.3),
            context.sized.heightMediumValue,
          ),
        ),
      ),
      onPressed: () {
        context.router.push(
          AddPdfRoute(
            directoryModel: directoryModel,
          ),
        );
      },
      label: Text(
        directoryModel.fileTypeEnum?.name ?? '',
      ),
    );
  }

  Widget getSaveButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required EditDirectoryStatus status,
  }) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.save),
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(
          Size(
            context.sized.dynamicWidth(0.3),
            context.sized.heightMediumValue,
          ),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      label: _getSaveButtonComponent(
        status,
      ),
    );
  }

  Widget _getSaveButtonComponent(EditDirectoryStatus status) {
    switch (status) {
      case EditDirectoryStatus.start:
        return const CircularProgressIndicator();
      case EditDirectoryStatus.initial:
        return const LocaleText(
          text: LocaleKeys.general_save,
        );
      case EditDirectoryStatus.loading:
        return const CircularProgressIndicator();
      case EditDirectoryStatus.error:
        return const LocaleText(
          text: LocaleKeys.errors_nullErrorMessage,
        );
    }
  }
}
