enum LinkTemplatesEnum { directoryShare, fileShare }

extension LinkTemplatesEnumExtention on LinkTemplatesEnum {
  String getLink({String? id, String? directoryId, String? fileId}) {
    switch (this) {
      case LinkTemplatesEnum.directoryShare:
        return 'FolderPro://share?id=$id&directoryId=$directoryId';
      case LinkTemplatesEnum.fileShare:
        return 'FolderPro://share?id=$id&fileId=$fileId';
    }
  }
}
