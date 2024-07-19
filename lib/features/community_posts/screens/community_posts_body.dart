import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:galaxyxgate/core/helpers/app_localization/app_localization.dart';
import 'package:galaxyxgate/core/themes/text_styles.dart';
import 'package:galaxyxgate/core/widgets/gradient_gray_background.dart';
import 'package:galaxyxgate/features/community_posts/logic/community_posts/community_posts_cubit.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/cards/post_card.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/place_holders/posts_place_holder.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/rows/add_post_with_profile_pic_row.dart';
import 'package:galaxyxgate/features/community_posts/screens/widgets/headers/community_header.dart';

class CommunityPostsBody extends StatelessWidget {
  const CommunityPostsBody({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return GradientGreyBackground(
      child: SafeArea(
        child: Column(
          children: [
            CommunityHeader(
              scrollController: scrollController,
            ),
            AddPostWithProfilePicRow(
              scrollController: scrollController,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await context.read<CommunityPostsCubit>().getAllPosts();
                },
                child: BlocBuilder<CommunityPostsCubit, CommunityPostsState>(
                  builder: (context, state) {
                    if (state is GetPostsLoading) {
                      return const PostsPlaceHolder();
                    }
                    return CommunityPostsCubit.posts.isNotEmpty
                        ? AnimatedList(
                            key: CommunityPostsCubit.listKey,
                            controller: scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            initialItemCount: CommunityPostsCubit.posts.length,
                            itemBuilder: (context, index, animation) {
                              return SlideTransition(
                                position: animation.drive(Tween<Offset>(
                                  begin: const Offset(-1, 0),
                                  end: const Offset(0, 0),
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  child: AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    child: SlideAnimation(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      verticalOffset: 50.0,
                                      child: FadeInAnimation(
                                        child: PostCard(
                                          post:
                                              CommunityPostsCubit.posts[index],
                                          scrollController: scrollController,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : ListView(
                            children: [
                              SizedBox(
                                height: 300.h,
                                child: Center(
                                  child: Text(
                                    'No Posts Yet'.tr(context),
                                    style: TextStyles.font14White700w,
                                  ),
                                ),
                              ),
                            ],
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
