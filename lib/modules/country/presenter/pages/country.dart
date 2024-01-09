import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/modules/country/business/entities/country.dart';
import 'package:shoal_app/modules/country/presenter/providers/country.dart';
import 'package:shoal_app/shared/widgets/button.dart';
import 'package:shoal_app/shared/widgets/navbar.dart';
import 'package:shoal_app/shared/widgets/toaster.dart';
import 'package:shoal_app/shared/widgets/wrapper.dart';

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

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(countryProvider);

    return Scaffold(
      appBar: const Navbar(),
      body: RefreshIndicator(
          child: Container(
            child: data.whenOrNull(
              data: (data) => ListView.builder(
                itemCount: data!.length,
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
