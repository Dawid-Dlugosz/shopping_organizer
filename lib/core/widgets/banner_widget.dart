import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  BannerAd? _bannerAd;

  final _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/9214589741'
      : 'ca-app-pub-3940256099942544/2435281174';

  void loadAd() async {
    if (_bannerAd != null) {
      return;
    }

    final mediaSize = MediaQuery.sizeOf(context).width - 20;
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        mediaSize.truncate());

    setState(() {
      _bannerAd = BannerAd(
        size: size!,
        adUnitId: _adUnitId,
        listener: BannerAdListener(
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
        request: const AdRequest(),
      )..load();
    });
  }

  @override
  void didChangeDependencies() {
    loadAd();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_bannerAd != null) {
      return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            width: _bannerAd!.size.width.toDouble(),
            height: _bannerAd!.size.height.toDouble(),
            child: AdWidget(
              ad: _bannerAd!,
            ),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
