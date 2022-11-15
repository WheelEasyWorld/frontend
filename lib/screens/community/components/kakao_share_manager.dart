import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_share.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

Future KakaoShareManager(String _address, String _title, String _imageUrl,
    String _description, String _storeUrl) async {
  final LocationTemplate defaultLocation = LocationTemplate(
    address: _address,
    content: Content(
      title: _title,
      description: _description,
      imageUrl: Uri.parse(_imageUrl),
      link: Link(
        webUrl: Uri.parse(_storeUrl),
        mobileWebUrl: Uri.parse(_storeUrl),
      ),
    ),
  );

  bool isKakaoTalkSharingAvailable =
      await ShareClient.instance.isKakaoTalkSharingAvailable();

  if (isKakaoTalkSharingAvailable) {
    try {
      Uri uri =
          await ShareClient.instance.shareDefault(template: defaultLocation);
      await ShareClient.instance.launchKakaoTalk(uri);
      print('카카오톡 공유 완료');
    } catch (error) {
      print('카카오톡 공유 실패 $error');
    }
  } else {
    try {
      Uri shareUrl = await WebSharerClient.instance
          .makeDefaultUrl(template: defaultLocation);
      await launchBrowserTab(
        shareUrl,
      );
    } catch (error) {
      print('카카오톡 공유 실패 $error');
    }
  }
}
