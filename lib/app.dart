import 'package:version/version.dart';

/// Define Inno Setup for the Flutter project.
class InnoSetupApp {
  /// Define Inno Setup for the Flutter project.
  ///
  /// Specify the [name], [version], [publisher] details of the app followed up
  /// by the [urls] and [executable] location.
  ///
  /// userdocs = Document directory
  ///
  /// Refer [Version], [InnoSetupAppUrls] for more info.
  const InnoSetupApp({
    required this.name,
    required this.version,
    required this.publisher,
    this.appId,
    // required this.urls,
    this.defaultInstallationDirectory="autopf",
  });

  /// Name of the app.
  final String name;

  /// Version of the app.
  ///
  /// Refer [Version], [Version.parse] for more info.
  final Version version;

  /// Publisher name of the app.
  final String publisher;

  /// Urls for app.
  ///
  /// Refer [InnoSetupAppUrls] for more info.
  // final InnoSetupAppUrls urls;
  final String? defaultInstallationDirectory;
  final String? appId;

  @override
  String toString() => appId!=null?'''
AppId={$appId}
AppName="$name"
AppVersion="$version"
AppPublisher="$publisher"
DefaultDirName="{$defaultInstallationDirectory}\\$name"
''' : '''
AppName="$name"
AppVersion="$version"
AppPublisher="$publisher"
DefaultDirName="{$defaultInstallationDirectory}\\$name"
''';
}

/// Define [homeUrl] for the app with optional [publisherUrl], [supportUrl]
/// and [updatesUrl].
class InnoSetupAppUrls {
  /// Define [homeUrl] for the app with optional [publisherUrl], [supportUrl]
  /// and [updatesUrl].
  ///
  /// Refer [Uri], [Uri.parse] for more info.
  InnoSetupAppUrls({
    required this.homeUrl,
    this.publisherUrl,
    this.supportUrl,
    this.updatesUrl,
  });

  /// Home page.
  final Uri homeUrl;

  /// Publisher page.
  final Uri? publisherUrl;

  /// Updates page.
  final Uri? updatesUrl;

  /// Support page.
  final Uri? supportUrl;

  // Use [homeUrl] as default url for optional urls.
  @override
  String toString() => '''
AppPublisher="${homeUrl.path}"
AppPublisherURL="${publisherUrl ?? homeUrl.path}"
AppSupportURL="${updatesUrl ?? homeUrl.path}"
AppUpdatesURL="${supportUrl ?? homeUrl.path}"
''';
}
