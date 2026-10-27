# TP-PDEP-Entertainment---Mart-n-Bianchimano
Decisiones Importantes:
1) Uso de Composición para las Bandas --> Se uso una estructura con composición, específicamente con el atributo de estilo como instancia de rockera, trapera e indie para delegar cómodamente los cálculos de popularidad, presupuesto y gastos extras
2) Polimorfismo en los Abonos --> Fan y Vip se modelaron como clases que heredan desde abono para evitar el uso de condicionales que complejizarían el código en caso de usarlos

Conceptos de la Materia Utilizados, donde y para qué
1) Polimorfismo: En la sección de las bandas los mensajes como popularidad o presupuesto se podían enviar sin importar si esta era rockera, trapera o Indie
2) Composición: En las bandas se relacionó con los tres estilos mediante la composición para tener una mayor flexibilidad frente a posibles cambios futuros, encapsulando los cambios en cada estilo
3) Herencia: En los abonos se usaron las subclases de Fan y Vip sobrescribiendo métodos de su clase padre ya que estas comparten sus métodos pero cambian en como los emplean
4) Métodos de orden superior: Se uso en los métodos de productora y asistente para poder procesar las colecciones de una manera declarativa, mejorando la legibilidad del código
5) Manejo de Errores: Utilizado en la validación del saldo del asistente para la compra de las entradas. Este impide que un asistente compre entradas sin tener saldo positivo, interrumpiendo la ejecución del método.
