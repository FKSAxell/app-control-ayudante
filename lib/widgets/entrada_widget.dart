part of 'widgets.dart';

class Entrada extends StatefulWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const Entrada({
    required this.icon,
    required this.placeholder,
    required this.textController,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  });

  @override
  _EntradaState createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {
  bool _isHidden = false;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    _isHidden = this.widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 5),
            blurRadius: 5,
          )
        ],
      ),
      child: TextField(
        autocorrect: false,
        keyboardType: this.widget.keyboardType,
        controller: this.widget.textController,
        obscureText: _isHidden,
        decoration: InputDecoration(
            prefixIcon: Icon(this.widget.icon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: this.widget.placeholder,
            suffix: (this.widget.isPassword)
                ? InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                      _isHidden ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : null),
      ),
    );
  }
}
