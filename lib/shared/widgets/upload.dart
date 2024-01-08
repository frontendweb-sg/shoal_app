import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/typography.dart';
import 'package:shoal_app/core/i18n/contents.dart';

class Upload extends StatefulWidget {
  const Upload({
    super.key,
    this.extenstions = const ['jpg', 'jpeg', 'pdf', 'doc'],
    this.onSelectFile,
  });

  final List<String>? extenstions;
  final void Function(PlatformFile file)? onSelectFile;
  @override
  State<StatefulWidget> createState() {
    return _UploadState();
  }
}

class _UploadState extends State<Upload> {
  late PlatformFile _file;
  void openFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowedExtensions: widget.extenstions);
    if (result != null) {
      PlatformFile file = result.files.first;
      _file = file;
      widget.onSelectFile!(file);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openFile();
      },
      child: Container(
        width: double.infinity,
        height: 134,
        decoration: BoxDecoration(
          color: AppColor.kGrayLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.cloud_upload,
              color: AppColor.kPrimaryColor,
              size: 25,
            ),
            const SizedBox(
              height: 15,
            ),
            textHedlineMedium(context, label: AppContent.strBrowseFile),
            textBodySmall(context,
                label: 'Please select ${widget.extenstions!.join(',')}')
          ],
        ),
      ),
    );
  }
}
