import 'package:url_launcher/url_launcher.dart';

launchURLBrowser(String feauterLink) async {
  if (!feauterLink.startsWith('http://') &&
      !feauterLink.startsWith('https://')) {
    // Add 'https://' protocol if missing
    feauterLink = 'https://$feauterLink';
  }

  var url = Uri.parse(feauterLink);
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.inAppWebView);
  } else {
    throw 'Could not launch $url';
  }
}
