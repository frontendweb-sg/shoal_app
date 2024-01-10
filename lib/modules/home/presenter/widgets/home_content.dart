import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/config/theme/typography.dart';
import 'package:shoal_app/core/constants/images.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/modules/country/presenter/pages/country.dart';
import 'package:shoal_app/modules/home/presenter/widgets/horizontal_panel.dart';
import 'package:shoal_app/modules/home/presenter/widgets/panel.dart';
import 'package:shoal_app/modules/loan/presenter/pages/personal_detail.dart';

class HomeScreenContent extends ConsumerWidget {
  const HomeScreenContent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            isAntiAlias: true,
            AppImage.imgHomeScreenBg,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(25.0, 205.0, 25.0, 75.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  children: [
                    panelCard(
                      context,
                      image: AppImage.imgSendIcon,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (builder) => const CountryScreen(),
                          ),
                        );
                      },
                      label: 'Available country',
                    ),
                    panelCard(
                      context,
                      image: AppImage.imgWalletIcon,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (builder) => const PersonalDetails(),
                          ),
                        );
                      },
                      label: AppContent.strApplyNPS,
                    ),
                    panelCard(
                      context,
                      image: AppImage.imgLoginIcon,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (builder) => const PersonalDetails(),
                          ),
                        );
                      },
                      label: AppContent.strRequest,
                    ),
                    panelCard(
                      context,
                      image: AppImage.imgUserIcon,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (builder) => const PersonalDetails(),
                          ),
                        );
                      },
                      label: AppContent.strContact,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              horizontalPanel(context),
            ],
          ),
        ),
        Positioned(
          bottom: 25.0,
          child: textDisplayMedium(
            context,
            color: Colors.red,
            label: 'Last visited: ${DateTime.now()}',
          ),
        )
      ],
    );
  }
}
