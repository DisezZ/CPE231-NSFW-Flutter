import 'package:cpe231_nsfw_flutter/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/blocs/authentication/bloc/authentication_bloc.dart';
import '../../../widgets/title_with_custom_underlined.dart';

class CustomerOverview extends StatelessWidget {
  const CustomerOverview({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CustomerOverview());
  }

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
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    TitleWithCustomUnderlined(text: 'News And Updates'),
                    Spacer(),
                    Container()
                  ],
                ),
              ),
            ],
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