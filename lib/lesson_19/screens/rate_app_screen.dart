import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/lesson_19/bloc/rate_app_cubit.dart';
import 'package:go_router/go_router.dart';

const _primaryBlue = Color.fromARGB(255, 3, 61, 108);
const _secondaryBlue = Color.fromARGB(255, 29, 143, 236);
const _cardBlue = Color.fromARGB(255, 48, 173, 231);
const _screenBlue = Color.fromARGB(255, 137, 215, 248);
const _filledStarColor = Color(0xFFFFE08A);
const _emptyStarColor = Color(0xFFFFD66B);

class RateAppScreen extends StatelessWidget {
  const RateAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RateAppCubit, RateAppState>(
      listenWhen: (previous, current) {
        return previous.status != RateAppStatus.success &&
            current.status == RateAppStatus.success;
      },
      listener: (context, state) {
        final messenger = ScaffoldMessenger.of(context);

        context.pop();

        messenger.showSnackBar(
          SnackBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            content: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 72, 164, 239),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_outline_rounded, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Rating submitted successfully',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.star_outline_rounded, color: Colors.white),
                ],
              ),
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: _screenBlue,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Flutter Lab',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: _primaryBlue,
        ),
        body: BlocBuilder<RateAppCubit, RateAppState>(
          builder: (context, state) {
            final isLoading = state.status == RateAppStatus.loading;
            final isSuccess = state.status == RateAppStatus.success;

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 48),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: _cardBlue,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 4),
                            color: Colors.black12,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            isSuccess
                                ? 'You rated the app'
                                : 'How would you rate our app?',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: _primaryBlue,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              final isSelected =
                                  isSuccess || index < state.rating;

                              return IconButton(
                                onPressed: isLoading || isSuccess
                                    ? null
                                    : () {
                                        context
                                            .read<RateAppCubit>()
                                            .selectRating(index + 1);
                                      },
                                icon: Icon(
                                  isSelected
                                      ? Icons.star_rounded
                                      : Icons.star_outline_rounded,
                                  color: isSelected
                                      ? _filledStarColor
                                      : _emptyStarColor,
                                  size: 34,
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 16),
                          isSuccess
                              ? Row(
                                  children: [
                                    _buildButton(
                                      title: 'Rate again',
                                      backgroundColor: _primaryBlue,
                                      onPressed: () {
                                        context
                                            .read<RateAppCubit>()
                                            .resetRating();
                                      },
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    _buildButton(
                                      title: 'Submit rating',
                                      backgroundColor: _primaryBlue,
                                      onPressed: isLoading || state.rating == 0
                                          ? null
                                          : () {
                                              context
                                                  .read<RateAppCubit>()
                                                  .submitRating();
                                            },
                                      child: isLoading
                                          ? const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                color: Colors.white,
                                              ),
                                            )
                                          : null,
                                    ),
                                    const SizedBox(width: 10),
                                    _buildButton(
                                      title: 'Reset rating',
                                      backgroundColor: _secondaryBlue,
                                      icon: const Icon(
                                        Icons.refresh,
                                        color: Colors.white,
                                      ),
                                      onPressed: isLoading
                                          ? null
                                          : () {
                                              context
                                                  .read<RateAppCubit>()
                                                  .resetRating();
                                            },
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _buildButton({
  required String title,
  required Color backgroundColor,
  required VoidCallback? onPressed,
  Widget? child,
  Icon? icon,
}) {
  return Expanded(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: backgroundColor.withValues(alpha: 0.6),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child:
          child ??
          (icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon,
                    const SizedBox(width: 5),
                    Text(title, style: _buttonTextStyle),
                  ],
                )
              : Text(title, style: _buttonTextStyle)),
    ),
  );
}

const _buttonTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
