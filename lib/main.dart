import 'package:flutter/material.dart';

 
void main() {
  runApp(const MaterialApp(home: CalculatorV1()));
}
class CalculatorV1 extends StatefulWidget {//es una clase que representa un widget de Flutter y se extiende StatefulWidget. Extender StatefulWidget significa que este widget tiene un estado mutable que puede cambiar durante la vida útil de la aplicación.

  const CalculatorV1({Key? key}) : super(key: key);

 

  @override

  _CalculatorV1State createState() => _CalculatorV1State();// Es un método obligatorio que debe ser implementado en las clases que se extienden StatefulWidget. Retorna una nueva instancia de la clase que se extiende State, en este caso _CalculatorV1State,.

}
/*
En resumen, este código configura el punto de entrada de la aplicación (la función main)
 para que inicie una aplicación Flutter con una MaterialApppantalla principal es un widget llamado CalculatorV1. 
 La clase CalculatorV1 es un widget que tiene su propio estado representado por la clase
  _CalculatorV1State. Este es un patrón común en Flutter para manejar la lógica y el estado de un widget.
*/
 

class _CalculatorV1State extends State<CalculatorV1> {/*
Este es el inicio de la clase _CalculatorV1State que se extiende State<CalculatorV1> y representa 
el estado para el widget CalculatorV1en Flutter. Vamos a explicar las variables y su significado:
*/ 

  String output = '0';//Es una variable que almacena el resultado que se mostrará en la interfaz de la calculadora. Inicialmente, se establece en '0'.

 

  String _output = '0';//Es una variable que almacena temporalmente el valor que se está mostrando o procesado en la interfaz de la calculadora.

  double num1 = 0.0;//Es una variable que almacena el primer número en una operación matemática. Inicialmente, se establece en 0.0.

  double num2 = 0.0;//Es una variable que almacena el segundo número en una operación matemática. Inicialmente, se establece en 0.0.

  String operand = '';// Es una variable que almacena el operador de la operación matemática (como '+', '-', '*', '/'). Inicialmente, está vacía.

 

  void buttonPressed(String buttonText) {

    if (buttonText == 'Limpiar') {// Esto verifica si el texto del botón presionado es igual a 'Limpiar'. En caso afirmativo, se ejecuta el código dentro de este bloque.

      _output = '0';//Establece _outputa '0', lo que significa que la salida se reinicia a 0.

      num1 = 0.0;//Establece num1(el primer número en una operación) a 0.0, reiniciándolo.

      num2 = 0.0;//Establece num2(el segundo número en una operación) a 0.0, reiniciándolo.

      operand = '';//Establece operand(el operador para la operación) como una cadena vacía, reiniciándolo.

    } else if (buttonText == '+' ||//Si el texto del botón es uno de los operadores especificados ('+', '-', '/', 'X'), se ejecuta el código dentro de este bloque.

        buttonText == '-' ||

        buttonText == '/' ||

        buttonText == 'X') {

      num1 = double.parse(output);//Convierte la cadena almacenada en output(que representa el número mostrado actualmente) a un valor numérico (double) y lo asigna a la variable num1. Esto prepara la calculadora para almacenar el primer número de la operación.
// ||Es el operador lógico OR, que devuelve true si al menos una de las condiciones es verdadera. Si buttonTextes igual al menos uno de los operadores matemáticos, la condición se considera verdadera y se ejecuta el código dentro del bloque.
 

      operand = buttonText;//Asigna el contenido del botón presionado ( buttonText) a la variable operand. En este caso, el buttonText es uno de los operadores matemáticos: '+', '-', '/', o 'X'. Esto guarda el operador seleccionado para la próxima operación matemática.

 

      _output = '0';// Esto significa que el número que se está mostrando o procesando se reinicia a 0, preparándose para recibir un nuevo número en la operación.

    } else if (buttonText == '.') {// Este bloque de código se ejecuta si el buttonText es un punto ('.'). Un punto se usa para representar los decimales en un número.

      if (_output.contains('.')) {

        return;//Verifica si el _output actual ya contiene un punto. Si _outputya tiene un punto decimal, significa que el usuario ya ha ingresado un número decimal y no se debe agregar otro. En este caso, se retorna, y no se realiza ninguna acción adicional.

      } else {

        _output = _output + buttonText;// Si _output no contiene un punto, entonces se agrega el punto al _output. Esto permite que el usuario agregue decimales al número actualmente en pantalla.

      }

    } else if (buttonText == '=') {// Este bloque de código se ejecuta si el buttonText es igual a '='. Esto indica que el usuario ha presionado el botón de igual, lo que indica que se debe realizar la operación matemática.

      num2 = double.parse(output);//Convierte la cadena almacenada en output(que representa el número mostrado actualmente) a un valor numérico (double) y lo asigna a la variable num2. num2 es el segundo número en la operación matemática.

 

      if (operand == '+') {

        _output = (num1 + num2).toString();//Si el operador es '+', se suma num1 y num2 y el resultado se convierte a cadena para mostrarlo en la interfaz de usuario.

      }

      if (operand == '-') {

        _output = (num1 - num2).toString();//Si el operador es '-', se resta num2  de num1 y el resultado se convierte a cadena para mostrarlo en la interfaz de usuario.

      }

      if (operand == 'X') {

        _output = (num1 * num2).toString();//Si el operador es 'X' (multiplicación), se multiplica num1 y num2 y  el resultado se convierte a cadena para mostrarlo en la interfaz de usuario.

      }

      if (operand == '/') {

        _output = (num1 / num2).toString();//Si el operador es '/', se divide num1 por num2 y el resultado se convierte a cadena para mostrarlo en la interfaz de usuario.

      }

 

      num1 = 0.0;

      num2 = 0.0;

      operand = '';

    } else {//Este bloque se ejecuta si buttonText no coincide con ninguna de las condiciones anteriores, es decir, es un número o algún otro símbolo.

      _output = _output + buttonText;//Concatena el texto del botón presionado ( buttonText) al _output. Esto representa la entrada del usuario y se muestra en la interfaz de usuario para reflejar lo que el usuario está ingresando.

    }

 

    // print(_output);

 

    setState(() {//es una función proporcionada por Flutter que marca la parte del árbol de widgets actual como "necesita ser reconstruida". Esto provoca que Flutter vuelva a llamar al método build para actualizar la interfaz de usuario con los cambios realizados en el estado. Todo lo que se coloca dentro de esta función es lo que se va a actualizar.

      output = double.parse(_output).toStringAsFixed(2);/*
       En este caso, se está actualizando la variable output, que representa lo que se muestra en la interfaz de usuario, con el resultado de la operación matemática o la entrada actual.

double.parse(_output) convierte la cadena _output (que representa el número en formato de cadena) en un valor numérico de tipo double.
toStringAsFixed(2) convierte el valor numérico a una cadena redondeada a dos decimales, para que se muestre correctamente en la interfaz de usuario.
Finalmente, la interfaz de usuario se actualizará para mostrar el resultado de la operación o la entrada actual con un máximo de dos decimales, ya que se utilizó toStringAsFixed(2). 
  Este es un paso crucial para mantener la interfaz de usuario actualizada y reflejar correctamente los cambios realizados por el usuario.*/ 

    });

  }

 

  Widget buildNumberPad(String buttonText) {//Esta función toma un argumento buttonText que representa el texto que se mostrará en el botón.

    return Expanded(// Aquí se está devolviendo un widget Expanded que asegura que este widget ocupe todo el espacio disponible en la fila o columna donde se coloque.

      child: Container(

        color: Color.fromARGB(255, 200, 243, 241),// Establece el color del fondo del contenedor.

        child: OutlinedButton(//Aquí se crea un botón del tipo OutlinedButton, que es un botón con un borde.

          style: OutlinedButton.styleFrom(// Define el estilo del botón, incluyendo el color, el estilo y el ancho del borde.

            side: const BorderSide(

              color: Colors.teal, //Color of the border

              style: BorderStyle.solid, //Style of the border

              width: 0.1, //width of the border

            ),

            padding: const EdgeInsets.all(24.0),//Define el espaciado interno del botón.

          ),

          child: Text(//Contiene el texto del botón, que es el buttonText.

            buttonText,

            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),

          ),

          onPressed: () => buttonPressed(buttonText),//Define la función que se ejecutará cuando el botón sea presionado. En este caso, llama a la función buttonPressed con el texto del botón (buttonText) como argumento.

        ),

      ),

    );

  }

 

  @override

  Widget build(BuildContext context) {

    return SingleChildScrollView(//Este es un widget que permite desplazar su contenido si este es más grande que el espacio disponible. Esto es útil si hay más contenido que el que cabe en la pantalla y permite al usuario desplazarse hacia arriba y hacia abajo para ver todo el contenido.

      child: Padding(

        padding: const EdgeInsets.all(8.0),// Este es un widget que agrega un relleno (espacio) alrededor de su hijo. En este caso, agregue un relleno de 8.0 de píxeles en todos los lados.

        child: Column(//Este es un widget que organiza a sus hijos en una columna vertical. Los hijos se colocan en secuencia desde arriba hacia abajo.

          children: <Widget>[
            const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'Calculadora',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 148, 194, 231),
                decoration: TextDecoration.none,
              ),
            ),
          ),

            Container(// Este es un widget de contenedor que representa la sección superior de la calculadora donde se muestra el resultado.

                decoration: BoxDecoration(//Defina la decoración del contenedor, que incluye un borde ( Border) de color rosa con un ancho de 1,0 píxeles.

                  border: Border.all(

color: Color.fromARGB(255, 117, 221, 235),

                    width: 1.0,//Establezca el ancho del contenedor al ancho de la pantalla ( MediaQuery.of(context).size.width).

                  ),

                ),

                width: MediaQuery.of(context).size.width,

alignment: Alignment.center,//Alinea el texto al centro.

                padding: const EdgeInsets.symmetric(

                    vertical: 24.0, horizontal: 12.0),// Defina el relleno interno del contenedor con 24,0 píxeles de relleno vertical y 12,0 píxeles de relleno horizontal.

                child: Text(output,//Contiene una Textque muestra la variable output, que es el número actual o el resultado de la operación. Se establece un estilo específico para el texto, incluyendo tamaño de fuente, negrita y color.

                    style: const TextStyle(

                        fontSize: 36.0,

                        fontWeight: FontWeight.bold,

color: Color.fromARGB(255, 142, 190, 230)))),

            const Divider(),// Este es un widget que muestra una línea horizontal que separa visualmente los elementos en la interfaz de usuario. En este caso, separe el resultado de la sección de botones.

            Column(children: <Widget>[// Este es un Columnque contiene filas de botones. Organiza sus hijos en una columna vertical.

              Row(children: <Widget>[//Cada Rowrepresenta una fila de botones en la calculadora. Cada fila contiene cuatro botones, que son dígitos y operadores.

                buildNumberPad('1'),

                buildNumberPad('2'),

                buildNumberPad('3'),

                buildNumberPad('/')

              ]),

              Row(children: <Widget>[//Cada Rowrepresenta una fila de botones en la calculadora. Cada fila contiene cuatro botones, que son dígitos y operadores.

                buildNumberPad('4'),

                buildNumberPad('5'),

                buildNumberPad('6'),

                buildNumberPad('X')

              ]),

              Row(children: <Widget>[//Cada Rowrepresenta una fila de botones en la calculadora. Cada fila contiene cuatro botones, que son dígitos y operadores.

                buildNumberPad('7'),

                buildNumberPad('8'),

                buildNumberPad('9'),

                buildNumberPad('-')

              ]),

              Row(children: <Widget>[//Cada Rowrepresenta una fila de botones en la calculadora. Cada fila contiene cuatro botones, que son dígitos y operadores.

                buildNumberPad('.'),

                buildNumberPad('0'),

                buildNumberPad('00'),

                buildNumberPad('+')

              ]),

              Row(children: <Widget>[//Cada Rowrepresenta una fila de botones en la calculadora. Cada fila contiene cuatro botones, que son dígitos y operadores.

                buildNumberPad('Limpiar'),

                buildNumberPad('='),

              ])

            ])

          ],

        ),

      ),

    );

  }

}

 