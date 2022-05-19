import 'package:cpe231_nsfw_flutter/src/presentation/screens/employee/customer/change_membership/update_membership_form.dart';

import '../../../../../business_logic/blocs/update/account_membership/bloc/update_account_membership_bloc.dart';
import '../../../../../data/repositories/simple_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/custom_app_bar.dart';

class UpdateAccountMembershipScreen extends StatelessWidget {
  UpdateAccountMembershipScreen({Key? key}) : super(key: key);

  static Function route() {
    return () => MaterialPageRoute<void>(
        builder: (_) => UpdateAccountMembershipScreen());
  }

  final _simpleRepository = SimpleRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _simpleRepository,
      child: BlocProvider(
        create: ((context) =>
            UpdateAccountMembershipBloc(simpleRepository: _simpleRepository)),
        child: const Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: CustomAppBar(
                back: true,
                title: "Update Customer's Membership",
              ),
            ),
            body: UpdateAccountMembershipForm()),
      ),
    );
  }
}
