import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/core/constants/constants.dart';
import 'package:shoal_app/core/utils/dio_client.dart';
import 'package:shoal_app/modules/loan/presenter/providers/state/country_state.dart';

class CountryNotifier extends StateNotifier<CountryState> {
  CountryNotifier() : super(CountryState.initial());

  getAllCountry() async {
    try {
      DioClient dioClient = DioClient(AppConstants.APP_BASE_GRAPHQL_URL);
      var response = await dioClient.client.post(
        '/graphql',
        data: {
          'variables': {},
          'query': r'''
              query {
                countries{
                    id
                    name
                    isoCode
                }
              }
        '''
        },
        options: Options(
          headers: {
            "authorization":
                "Bearer eyJraWQiOiJxcjMwakptd0xWVU45TGM1YnpzWDNvaWJVSkRpMEdYcStGMmJ5aGlzZTlNPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiI5ZTdkYjQ5OS03YmNiLTRlMjEtYWIyZi0yODY3OGY1MTA3ODUiLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAudXMtd2VzdC0yLmFtYXpvbmF3cy5jb21cL3VzLXdlc3QtMl9Kb2pnWkxEZFciLCJjbGllbnRfaWQiOiI2OG9obnYzYmhpNjRrMDhyaWlxZnUxYjFwayIsIm9yaWdpbl9qdGkiOiJlYmU2YzcwMC01Nzg2LTRjZjItOTVhYS02NmI0OWY4NDM3NmEiLCJldmVudF9pZCI6ImU4OTcyZjk1LWQyMjgtNDBlNy1iMjgwLWI3NTA0ZTY5NTUyYSIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE3MDQ2MzI1ODEsImV4cCI6MTcwNDYzNjE4MSwiaWF0IjoxNzA0NjMyNTgxLCJqdGkiOiIyYjgzNTNmNS0zODdjLTQ1YjAtOTQ3Zi04MTBhYTc5YTc5NDgiLCJ1c2VybmFtZSI6InBrdW1hciJ9.jL2wbho7HbehKIcEMeA-61IQ_VXsNdxbDyssDoUlVcxCqn0HsfGIqM-oPZiMwmEeTzqUmMh57CY7Xo_RjlCmPQJgde6QgJrulssDWZZ8rb7G720I0FO7A5r_gex6G55-V0x-7C8HFEfvyIj1Ii-alhDElniaLrGYN2VWI6P29LsYcJU8ldag7rgKW5XmoZZXFn6S50bG1LfjboVcFb_O13_7f_WKCLjrTpNhbvEC0b-fEm3NSOBhzw_jn3Pj-wkHcSWxoUPxfL9-7BLl0BfZ9UCRux2O8pRHFkYDXAc2H1FXnV62c_BwfrMsf4CG_9sDnBa9ZSo-_6X57p_wFskCJQ"
          },
        ),
      );

      List<dynamic> data = response.data["countries"];
      print(data);
    } catch (error) {
      print(error);
    }
  }
}

final countryProvider =
    StateNotifierProvider<CountryNotifier, CountryState>((ref) {
  return CountryNotifier();
});
