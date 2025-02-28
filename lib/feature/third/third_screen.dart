// ignore_for_file: deprecated_member_use, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/color.dart';
import '../../core/constants/string.dart';
import '../../core/global_widget/appbar.dart';
import '../../core/global_widget/custom_cardview.dart';
import '../../data/auth/responsesmodel/user_responses_model.dart';
import 'bloc/user_bloc.dart';
import 'bloc/user_event.dart';
import 'bloc/user_state.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late final ScrollController _scrollController;
  int _page = 1;
  final int _perPage = 10;
  int _totalPage = 1; 
  String _selectedUserName = "";
  List<Datum> _allUsers = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    // Trigger load data user untuk halaman pertama
    context.read<UserBloc>().add(LoadUserEvent(page: _page, perPage: _perPage));
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0) {
      if (_page < _totalPage) {
        _page++;
        context.read<UserBloc>().add(LoadUserEvent(page: _page, perPage: _perPage));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        AppStrings.thirdScreenTitle,
        context,
        result: _selectedUserName,
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(AppStrings.errorUserData)),
            );
          } else if (state is UserLoaded) {
            if (_page == 1) {
              _allUsers = state.userResponses.data;
            } else {
              _allUsers.addAll(state.userResponses.data);
            }
            _totalPage = state.userResponses.totalPages;
          }
        },
        builder: (context, state) {
          if (state is UserLoading && _allUsers.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded && _allUsers.isEmpty) {
            return const Center(child: Text(AppStrings.noData));
          }
          return RefreshIndicator(
            onRefresh: () async {
              _page = 1;
              _allUsers.clear();
              context.read<UserBloc>().add(LoadUserEvent(page: _page, perPage: _perPage));
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    controller: _scrollController,
                    itemCount: _allUsers.length,
                    separatorBuilder: (context, index) => const Divider(
                      indent: 16,
                      endIndent: 16,
                      color: ColorName.greyColor,
                    ),
                    itemBuilder: (context, index) {
                      return UserCardWidget(
                        userModel: _allUsers[index],
                        onCallback: (String fullname) {
                          context.pop(fullname);
                        },
                      );
                    },
                  ),
                ),
                if (state is UserLoading && _allUsers.isNotEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
