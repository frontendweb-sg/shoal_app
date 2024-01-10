import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/core/constants/images.dart';
import 'package:shoal_app/modules/country/presenter/pages/add_country.dart';
import 'package:shoal_app/modules/country/presenter/providers/country.dart';
import 'package:shoal_app/shared/widgets/navbar.dart';

class CountryScreen extends ConsumerStatefulWidget {
  const CountryScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CountryScreenState();
  }
}

const queryDoc = r'''
query countries{
  countries{
    id
    name
    isoCode
  }
}
''';

class _CountryScreenState extends ConsumerState<CountryScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () async {
      await ref.read(countryProvider.notifier).getAllCountry(queryDoc);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onOpenModal() {
    showModalBottomSheet(
      context: context,
      builder: (buildder) => const AddCountry(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(countryProvider);

    return Scaffold(
      appBar: Navbar(
        title: "Country",
        actions: [
          IconButton(
            onPressed: () {
              onOpenModal();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: RefreshIndicator(
          child: Container(
            child: data.whenOrNull(
              data: (data) => data!.isEmpty
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: AppColor.kWhite,
                      child: Center(
                        child: Image.asset(
                          AppImage.imgNoImage,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (builder, index) => ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          color: AppColor.kLighterGreen,
                        ),
                        title: Text(data[index].name!),
                      ),
                    ),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          onRefresh: () async {
            await ref.read(countryProvider.notifier).getAllCountry(queryDoc);
          }),
    );
  }
}
