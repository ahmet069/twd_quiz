import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyAdmobBanner extends StatefulWidget {
  final String bannerId;
  final AdSize adSize;
  const MyAdmobBanner({
    super.key,
    required this.bannerId,
    required this.adSize,
  });

  @override
  State<MyAdmobBanner> createState() => _MyAdmobBannerState();
}

class _MyAdmobBannerState extends State<MyAdmobBanner> {
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: kDebugMode ? 'ca-app-pub-3940256099942544/6300978111' : widget.bannerId,
      size: widget.adSize,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, error) async {
          if (kDebugMode) {
            print(error);
          }
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _bannerAd.size.width.toDouble(),
      height: _bannerAd.size.height.toDouble(),
      child: _isBannerAdReady
          ? AdWidget(ad: _bannerAd)
          : Container(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              alignment: Alignment.center,
              // child: CircularProgressIndicator(),
            ),
    );
  }
}
