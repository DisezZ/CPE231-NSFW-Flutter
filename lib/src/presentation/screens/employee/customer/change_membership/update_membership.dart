import 'package:cpe231_nsfw_flutter/src/presentation/screens/employee/customer/change_membership/update_membership_form.dart';

import '../../../../../business_logic/blocs/update/account_membership/bloc/update_account_membership_bloc.dart';
import '../../../../../data/repositories/simple_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateAccountMembershipScreen extends StatelessWidget {
  UpdateAccountMembershipScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => UpdateAccountMembershipScreen());
  }

  final _simpleRepository = SimpleRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _simpleRepository,
      child: BlocProvider(
        create: ((context) =>
            UpdateAccountMembershipBloc(simpleRepository: _simpleRepository)),
        child: Scaffold(
            appBar: AppBar(
              leading: ElevatedButton(
                onPressed: (() => Navigator.pop(context)),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            body: UpdateAccountMembershipForm()),
      ),
    );
  }
}
