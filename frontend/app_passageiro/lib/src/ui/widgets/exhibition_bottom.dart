import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:app_passageiro/main.dart';
import 'package:app_passageiro/src/ui/pages/phone_auth.dart';

const double minHeight = 230;

class ExhibitionBottom extends StatefulWidget {
  @override
  _ExhibitionBottomState createState() => _ExhibitionBottomState();
}

TextEditingController phoneTextController;
TextEditingController passwordTextController;
String passText;
String phoneText;
FocusNode focusNode;
FocusNode focusNodePassword;

class _ExhibitionBottomState extends State<ExhibitionBottom>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double get headerTopMargin =>
      lerp(20, 20 + MediaQuery
          .of(context)
          .padding
          .top);

  double get headerFontSize => lerp(24, 34);

  double get maxHeight =>
      MediaQuery
          .of(context)
          .size
          .height;

  double get itemBorderRadius => lerp(8, 24);
  double get iconLeftBorderRadius => itemBorderRadius;
  double get iconRightBorderRadius => lerp(8, 0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3600));
    focusNode = FocusNode();
    //focusNodePassword = FocusNode();
  }

  int _timesTapped = 0;

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);

  @override
  void dispose() {
    _controller.dispose();
    phoneTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Positioned(
            height: lerp(minHeight, maxHeight),
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 60,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: _toogle,
                              child: Container(
                                color: Colors.transparent,
                                child: IgnorePointer(
                                  child: TextField(
                                    onChanged: (text) {
                                      setState(() {
                                        phoneText = text;
                                      });
                                    },
                                    focusNode: focusNode,
                                    controller: phoneTextController,
                                    keyboardType: TextInputType.phone,
                                    onSubmitted: (text) {
                                      PhoneAuthentication();
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Container(
                                          width: 50,
                                          child: Icon(Icons.smartphone),
                                        ),
                                        border: InputBorder.none,
                                        labelText: "Entre com o número do celular",
                                        labelStyle: TextStyle(
                                            fontFamily: "Kanit",
                                            fontSize: 20
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    _builtBotaoFlutuante(),
                    _builtVamosComecar(),
                    _builtCriarConta()
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _builtBotaoFlutuante() {
    return BotaoFlutuante(
      isVisible: _controller.status == AnimationStatus.completed,
    );
  }

  Widget _builtVamosComecar() {
    return CreateVamosComecar(
      isVisible: _controller.status != AnimationStatus.completed,
    );
  }

  Widget _builtCriarConta() {
    return CriarNovaConta(
      isVisible: _controller.status != AnimationStatus.completed,
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;
  }

  void _toogle() {
    print("teste!");
    final bool isOpen = _controller.status == AnimationStatus.completed;
    print(isOpen.toString());
    _controller.fling(velocity: 0.1); //isOpen ? -2 :

    FocusScope.of(context).requestFocus(focusNode);
  }
}

class BotaoFlutuante extends StatelessWidget {
  final double bottomMargin;
  final bool isVisible;

  const BotaoFlutuante({Key key, this.bottomMargin, this.isVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      right: 20,
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: RawMaterialButton(
          onPressed: () => PhoneAuthentication(),
          splashColor: Colors.white,
          fillColor: Colors.lightBlue,
          elevation: 15.0,
          shape: CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.arrow_forward,
              size: 30.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/*void _onLoginClick(BuildContext context) {
  String email = phoneText;
  String pass = passText;
}*/


class CreateVamosComecar extends StatelessWidget {
  final bool isVisible;

  const CreateVamosComecar({Key key, this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 32.0,
        left: 38.0,
        child: AnimatedOpacity(
            opacity: isVisible ? 1 : 0,
            duration: Duration(milliseconds: 200),
            child: Text("Vamos Começar...",
                style: TextStyle(fontSize: 26,
                    fontFamily: "Kanit Light",
                    fontWeight: FontWeight.w500))));
  }
}

/*class CriarCampoSenha extends StatefulWidget {
  final bool isVisible;

  const CriarCampoSenha({Key key, this.isVisible}) : super(key: key);

  @override
  _CriarCampoSenhaState createState() => _CriarCampoSenhaState();
}

class _CriarCampoSenhaState extends State<CriarCampoSenha> {
  @override
  Widget build(BuildContext context) {
    void _reqFocusPassword() {
      FocusScope.of(context).requestFocus(focusNodePassword);
    }

    return Positioned(
        top: 160,
        left: 25,
        child: AnimatedOpacity(
            opacity: widget.isVisible ? 1 : 0,
            duration: Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: _reqFocusPassword,
              child: Container(
                width: 600,
                child: IgnorePointer(
                  child: TextField(
                      focusNode: focusNodePassword,
                      controller: passwordTextController,
                      onChanged: (text) {
                        setState(() {
                          passText = text;
                        });
                      },
                      onTap: _reqFocusPassword,
                      onSubmitted: (text) {
                        _onLoginClick(context);
                      },
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Container(
                            width: 50,
                            child: Icon(Icons.lock),
                          ),
                          border: InputBorder.none,
                          labelText: "Insira sua senha",
                          labelStyle: TextStyle(
                              fontSize: 20, fontFamily: "Pacifico"))),
                ),
              ),
            )));
  }
}*/

class CriarNovaConta extends StatelessWidget {
  final bool isVisible;

  const CriarNovaConta({Key key, this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 40,
        left: 40,
        child: AnimatedOpacity(
          opacity: isVisible ? 1 : 0,
          duration: Duration(milliseconds: 200),
          child: GestureDetector(
              onTap: () {},
              child: Text("Criar uma nova conta",
                  style: TextStyle(
                      fontSize: 20, fontFamily: "Kanit", color: Colors.blue))),
        )
    );
  }
}

