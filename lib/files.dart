import 'dart:io';

class InnoFile{
  InnoFile({
    required this.srcfileName,
    this.isDirectory = false,
    this.destDir,
    this.destFileName
  });

  final File srcfileName;
  final bool isDirectory;
  String? destDir;
  String? destFileName;

  @override
  String toString() {
    var str = "";
    if(isDirectory){
      str +=  '''Source: "${srcfileName.absolute.path}\\*"; Flags: ignoreversion recursesubdirs createallsubdirs; ''';
    }else{
      str +=  '''Source: "${srcfileName.absolute.path}"; Flags: ignoreversion; ''';
    }

    if(destFileName!=null){
      str += '''DestName:"$destFileName"; ''';
    }

    if(destDir!=null){
      str += '''DestDir:"{app}\\$destDir"; ''';
    }else{
      str += '''DestDir:"{app}"; ''';
    }
    return str;
  }
}
/// Define the app's files [location] and [executable] path.
class InnoSetupFiles {
  /// Define the app's files [location] and [executable] path.
  const InnoSetupFiles({
    required this.files,
  });

  /// App executable path.
  final List<InnoFile> files;

  @override
  String toString() {
    final code = StringBuffer('[Files]\n');

    for (final file in files) {
      code.writeln(file.toString());
    }

    return '$code';
  }
}
