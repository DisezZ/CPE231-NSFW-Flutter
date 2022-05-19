import 'package:cpe231_nsfw_flutter/src/data/models/analysis.dart';
import 'package:cpe231_nsfw_flutter/src/data/repositories/analysis.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/analysis/analysis_one.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/widgets/option_card.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/widgets/title_with_custom_underlined.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/blocs/authentication/bloc/authentication_bloc.dart';
import '../../../../constants/constants.dart';
import '../../analysis/analysis_five.dart';
import '../../analysis/analysis_four.dart';
import '../../analysis/analysis_three.dart';
import '../../analysis/analysis_two.dart';

class ManagerOverview extends StatelessWidget {
  ManagerOverview({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ManagerOverview());
  }

  final analysisRepository = AnalysisRepository();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final username = context.select<AuthenticationBloc, String>(
      (bloc) => bloc.state.user.username,
    );
    final firstName = context.select<AuthenticationBloc, String>(
      (bloc) => bloc.state.user.firstName,
    );
    final lastName = context.select<AuthenticationBloc, String>(
      (bloc) => bloc.state.user.firstName,
    );
    return Column(
      children: [
        HeaderWithSearchBox(
            size: size,
            username: username,
            firstName: firstName,
            lastName: lastName),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            children: const [
              TitleWithCustomUnderlined(text: 'Advance Analysis Report'),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
              child: Column(
                children: [
                  Wrap(
                    runSpacing: kDefaultPadding,
                    spacing: kDefaultPadding,
                    children: [
                      OptionCard(
                        title: 'Analysis 1',
                        icon: Icons.assessment,
                        route: AnalysisOneScreen.route(),
                      ),
                      OptionCard(
                        title: 'Analysis 2',
                        icon: Icons.assessment,
                        route: AnalysisTwoScreen.route(),
                      ),
                      OptionCard(
                        title: 'Analysis 3',
                        icon: Icons.assessment,
                        route: AnalysisThreeScreen.route(),
                      ),
                      OptionCard(
                        title: 'Analysis 4',
                        icon: Icons.assessment,
                        route: AnalysisFourScreen.route(),
                      ),
                      OptionCard(
                        title: 'Analysis 5',
                        icon: Icons.assessment,
                        route: AnalysisFiveScreen.route(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
    required this.username,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  final Size size;
  final String username;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
                color: kPrimary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                )),
            child: Row(
              children: [
                Text(
                  '$username',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Image.network(
                    'https://ui-avatars.com/api/?name=${firstName}+${lastName}&rounded=true&background=FFFFFF&color=0D47A1&size=60'),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimary.withOpacity(0.23)),
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'search',
                    hintStyle: TextStyle(
                      color: kPrimary.withOpacity(0.5),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
