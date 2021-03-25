import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  FocusNode nombreFocus;
  FocusNode emailFocus;
  FocusNode passwordFocus;

  String nombre;
  String email;
  String password;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('eiko paulina'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Pantalla Formulario ',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Ingrese su Nombre',
                      hintText: 'Ejemplo: Luisa',
                      prefixIcon: Icon(Icons.person_add_alt_1)),
                  //controller: nombreTextController,
                  onSaved: (value) {
                    nombre = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo obligatorio';
                    }
                  },
                  focusNode: this.nombreFocus,
                  onEditingComplete: () => requestFocus(context, emailFocus),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 6.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Correo electronico',
                      hintText: 'Ejemplo@example.com',
                      prefixIcon: Icon(Icons.mail_outline_rounded)),
                  //controller: apTextController,
                  onSaved: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo obligatorio';
                    }
                  },
                  focusNode: this.passwordFocus,
                  onEditingComplete: () => requestFocus(context, emailFocus),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 6.0,
                ),
                TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Ejemplo: *',
                        prefixIcon: Icon(Icons.lock)),
                    //controller: apTextController,
                    onSaved: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo obligatorio';
                      }
                    }),
                SizedBox(
                  height: 6.0,
                ),
                RaisedButton(
                    color: Colors.orange,
                    textColor: Colors.white,
                    onPressed: () {},
                    child: Text('Registrarse')),
                RaisedButton(
                  color: Colors.pink,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      if (nombre.compareTo('Eiko Paulina') == 0 &&
                          email.compareTo('paulina@gmail.com') == 0 &&
                          password.compareTo('eikopau') == 0) {
                        Navigator.pushNamed(context, 'formulario_dos',
                            arguments: Argumentos(
                                nombre: this.nombre,
                                email: this.email,
                                password: this.password));
                      } else {
                        print('Datos incorrectos');
                      }
                    }
                  },
                  child: Text(' Iniciar '),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus();
  }

  @override
  void initState() {
    super.initState();
    //nombreTextController = TextEditingController();
    //apTextController = TextEditingController();
    nombreFocus = FocusNode();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    //nombreTextController.dispose();
    //apTextController.dispose();
    nombreFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }
}

class Argumentos {
  String nombre;
  String email;
  String password;

  Argumentos({this.nombre, this.email, this.password});
}
