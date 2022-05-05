/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA 
* Organización de computadoras y Assembler
* Ciclo 1 - 2022
* Mario Antonio Guerra Morales - Carné: 21008
* Linda Inés Jiménez Vides - Carné: 21169
* Arreglos.s
* Programa que genera recibos de compras a clientes.
---------------------------------------------- */

.text
.align 2
.global main
.type main,%function

main:
	stmfd sp!,{lr}
	
	ldr r0,=bienvenida @@Mensaje de bienvenida.
	bl puts
	ldr r0,=nombrecliente @@Mensaje para escanear el nombre del cliente para el recibo.
	bl puts
	ldr r0,=formatonombre
	ldr r1,=cliente
	bl scanf
	ldr r2,=cliente

Menu:
	ldr r0,=listadoproductos @@Imprime el listado de productos en el menú.
	bl puts
	ldr r0,=formatoproducto	@@Escanea la opción.
	ldr r1,=producto
	bl scanf
	
compra:
	ldr r3,=producto @@Guarda la opción del usuario.
	ldrb r3,[r3]
	cmp r3,#'1'		@@Comprar leche.
	beq leche
	cmpne r3,#'2'	@@Comprar galletas.
	beq galletas
	cmpne r3,#'3'	@@Comprar mantequilla.
	beq mantequilla
	cmpne r3,#'4'	@@Comprar queso.
	beq queso
	cmpne r3,#'5'	@@Comprar pan.
	beq pan
	cmpne r3,#'6'	@@Comprar jalea.
	beq jalea
	cmpne r3,#'7'	@@Comprar yogurt.
	beq yogurt
	cmpne r3,#'8'	@@Comprar manzana.
	beq manzana
	cmpne r3,#'i'	@@Imprimir recibo.
	beq recibo
	cmpne r3,#'s'	@@Salir del menú.
	beq salir
	bne errorMenu

leche:
	ldr r0,=ingresounidades		@@Mensaje para ingresar las unidades del producto a comprar.
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades			@@Escanea las unidades.
	bl scanf
	@@Compara para detectar un error.
	cmp r0,#0
	beq error
	@@calculo de precio
	ldr r6,=precioleche
	ldr r6,[r6]
	ldr r7,=unidades
	ldr r7,[r7]
	mul r8,r6,r7
	ldr r0,=resultadoleche
	str r8,[r0]
	bl printf
	b Menu

galletas:
	ldr r0,=ingresounidades		@@Mensaje para ingresar las unidades del producto a comprar.
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades			@@Escanea las unidades.
	bl scanf
	@@Compara para detectar un error.
	cmp r0,#0
	beq error
	@@calculo de precio
	ldr r6,=preciogalleta
	ldr r6,[r6]
	ldr r7,=unidades
	ldr r7,[r7]
	mul r8,r6,r7
	ldr r0,=resultadogalleta
	str r8,[r0]
	bl printf
	b Menu

mantequilla:
	ldr r0,=ingresounidades		@@Mensaje para ingresar las unidades del producto a comprar.
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades			@@Escanea las unidades.
	bl scanf
	@@Compara para detectar un error.
	cmp r0,#0
	beq error
	@@calculo de precio
	ldr r6,=preciomantequilla
	ldr r6,[r6]
	ldr r7,=unidades
	ldr r7,[r7]
	mul r8,r6,r7
	ldr r0,=resultadomantequilla
	str r8,[r0]
	bl printf
	b Menu

queso:
	ldr r0,=ingresounidades		@@Mensaje para ingresar las unidades del producto a comprar.
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades			@@Escanea las unidades.
	bl scanf
	@@Compara para detectar un error.
	cmp r0,#0
	beq error
	@@calculo de precio
	ldr r6,=precioqueso
	ldr r6,[r6]
	ldr r7,=unidades
	ldr r7,[r7]
	mul r8,r6,r7
	ldr r0,=resultadoqueso
	str r8,[r0]
	bl printf
	b Menu

pan:
	ldr r0,=ingresounidades		@@Mensaje para ingresar las unidades del producto a comprar.
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades			@@Escanea las unidades.
	bl scanf
	@@Compara para detectar un error.
	cmp r0,#0
	beq error
	@@calculo de precio
	ldr r6,=preciopan
	ldr r6,[r6]
	ldr r7,=unidades
	ldr r7,[r7]
	mul r8,r6,r7
	ldr r0,=resultadopan
	str r8,[r0]
	bl printf
	b Menu

jalea:
	ldr r0,=ingresounidades		@@Mensaje para ingresar las unidades del producto a comprar.
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades			@@Escanea las unidades.
	bl scanf
	@@Compara para detectar un error.
	cmp r0,#0
	beq error
	@@calculo de precio
	ldr r6,=preciojalea
	ldr r6,[r6]
	ldr r7,=unidades
	ldr r7,[r7]
	mul r8,r6,r7
	ldr r0,=resultadojalea
	str r8,[r0]
	b Menu

yogurt:
	ldr r0,=ingresounidades		@@Mensaje para ingresar las unidades del producto a comprar.
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades			@@Escanea las unidades.
	bl scanf
	@@Compara para detectar un error.
	cmp r0,#0
	beq error
	@@calculo de precio
	ldr r6,=precioyogurt
	ldr r6,[r6]
	ldr r7,=unidades
	ldr r7,[r7]
	mul r8,r6,r7
	ldr r0,=resultadoyogurt
	str r8,[r0]
	bl printf
	b Menu

manzana:
	ldr r0,=ingresounidades		@@Mensaje para ingresar las unidades del producto a comprar.
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades			@@Escanea las unidades.
	bl scanf
	@@Compara para detectar un error.
	cmp r0,#0
	beq error
	@@calculo de precio
	ldr r6,=preciomanzana
	ldr r6,[r6]
	ldr r7,=unidades
	ldr r7,[r7]
	mul r8,r6,r7
	ldr r0,=resultadomanzana
	str r8,[r0]
	bl printf
	b Menu

recibo:
	ldr r2,=cliente			@@Carga al nombre del cliente y lo mueve al registro r1.
	mov r1, r2
	ldr r0,=recibocliente
	bl printf
	ldr r0,=factura			@@Carga la instruccion del recibo.
	bl puts
	ldr r1,=resultadoleche	@@Carga el subtotal para agregarlo a la factura.
	ldr r1,[r1]
	ldr r0,=facturaleche	@@Linea de la factura de la leche.
	bl printf
	ldr r1,=resultadogalleta	@@Carga el subtotal para agregarlo a la factura.
	ldr r1,[r1]
	ldr r0,=facturagalletas	@@Linea de la factura de las galletas.
	bl printf
	ldr r1,=resultadomantequilla	@@Carga el subtotal para agregarlo a la factura.
	ldr r1,[r1]
	ldr r0,=facturamantequilla	@@Linea de la factura de la mantequilla.
	bl printf
	ldr r1,=resultadoqueso		@@Carga el subtotal para agregarlo a la factura.
	ldr r1,[r1]
	ldr r0,=facturaqueso		@@Linea de la factura del queso.
	bl printf
	ldr r1,=resultadopan	@@Carga el subtotal para agregarlo a la factura.
	ldr r1,[r1]
	ldr r0,=facturapan		@@Linea de la factura del pan.
	bl printf
	ldr r1,=resultadojalea	@@Carga el subtotal para agregarlo a la factura.
	ldr r1,[r1]
	ldr r0,=facturajalea	@@Linea de la factura de la jalea.
	bl printf
	ldr r1,=resultadoyogurt		@@Carga el subtotal para agregarlo a la factura.
	ldr r1,[r1]
	ldr r0,=facturayogurt	@@Linea de la factura del yogurt.
	bl printf
	ldr r1,=resultadomanzana	@@Carga el subtotal para agregarlo a la factura.
	ldr r1,[r1]
	ldr r0,=facturamanzana	@@Linea de la factura de la manzana.
	bl printf
	b salir		@@Funcion Salir.

error:
	ldr r0,=Error	@@Detecta un error en los caracteres usados.
	bl puts
	bl getchar
	b compra

errorMenu:
	ldr r0,=Error	@@Detecta un error en los caracteres del menú.
	bl puts
	bl getchar
	b Menu

salir:
	ldr r0,=despedida		@@Mensaje de despedida para salida segura.
	bl puts
	mov r0, #0
	mov r3, #0
	ldmfd sp!, {lr}
	bx lr

.data
.align 2

unidades:
	.word 0
precioleche:
	.word 18
resultadoleche:
	.word 0
preciogalleta:
	.word 25
resultadogalleta:
	.word 0
preciomantequilla:
	.word 10
resultadomantequilla:
	.word 0
precioqueso:
	.word 35
resultadoqueso:
	.word 0
preciopan:
	.word 4
resultadopan:
	.word 0
preciojalea:
	.word 26
resultadojalea:
	.word 0
precioyogurt:
	.word 8
resultadoyogurt:
	.word 0
preciomanzana:
	.word 19
resultadomanzana:
	.word 0
subtotal:
	.word 0
total:
	.word 0
bienvenida:
	.asciz "Bienvenido a nuestra humilde tienda, aqui encontrara\nlos mejores y mas frescos productos para usted!"
nombrecliente:
	.asciz "Ingrese aqui su nombre para su recibo: "
formatonombre:
	.asciz " %s"
cliente:
	.asciz "          "
listadoproductos:
	.asciz "LISTADO DE PRODUCTOS\nPRODUCTO - PRECIO UNIDAD - CANTIDAD\n1.Leche - Q18.00 - 20\n2.Galletas - Q25.00 - 32\n3.Mantequilla - Q10.00 - 15\n4.Queso - Q35.00 - 15\n5.Pan - Q4.00 - 20\n6.Jalea - Q26.00 - 18\n7.Yogurt - Q8.00 - 35\n8.Manzana - Q19.00 - 35\ni.Imprimir recibo.\ns.Salir.\n"
formatoproducto:
	.asciz " %c"
producto:
	.asciz "%c"
ingresounidades:
	.asciz "Cuantas unidades desea llevar? "
formatounidad:
	.asciz " %d"
recibocliente:
	.asciz "Cliente: %s\n"
factura:
	.asciz "Descripcion - Precio Unit. Q - Subtotal Q"
facturaleche:
	.asciz "Leche - 18.00 - %d\n"
facturagalletas:
	.asciz "Galletas - 25.00 - %d\n"
facturamantequilla:
	.asciz "Mantequilla - 10.00 - %d\n"
facturaqueso:
	.asciz "Queso - 35.00 - %d\n"
facturapan:
	.asciz "Pan - 04.00 - %d\n"
facturajalea:
	.asciz "Jalea - 26.00 - %d\n"
facturayogurt:
	.asciz "Yogurt - 08.00 - %d\n"
facturamanzana:
	.asciz "Manzana - 19.00 - %d\n"
totales:
	.asciz "El total es de: %d\n"
Error:
	.asciz "Ingreso de caracter incorrecto."
despedida:
	.asciz "Esperamos haya disfrutado su estadia! "
