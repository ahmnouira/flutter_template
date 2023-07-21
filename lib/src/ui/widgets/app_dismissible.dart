class DismissibleWidget extends StatelessWidget {
  final String id;
  final Widget child;
  final void Function()? onTap;
  final void Function() onDismiss;

  const DismissibleWidget({
    super.key,
    required this.child,
    required this.id,
    required this.onDismiss,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.redAccent,
        padding: const EdgeInsets.only(right: 16),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete_forever,
          color: Colors.white,
          size: 50.0,
        ),
      ),
      onDismissed: (direction) {
        onDismiss();
      },
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}