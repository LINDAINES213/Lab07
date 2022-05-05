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
	
	ldr r0,=bienvenida
	bl puts
	ldr r0,=nombrecliente
	bl puts
	ldr r0,=formatonombre
	ldr r1,=cliente
	bl scanf
	ldr r2,=cliente

Menu:
	ldr r0,=listadoproductos
	bl puts
	ldr r0,=formatoproducto
	ldr r1,=producto
	bl scanf
	
compra:
	ldr r3,=producto
	ldrb r3,[r3]
	cmp r3,#'1'
	beq leche
	cmpne r3,#'2'
	beq galletas
	cmpne r3,#'3'
	beq mantequilla
	cmpne r3,#'4'
	beq queso
	cmpne r3,#'5'
	beq pan
	cmpne r3,#'6'
	beq jalea
	cmpne r3,#'7'
	beq yogurt
	cmpne r3,#'8'
	beq manzana
	cmpne r3,#'i'
	beq recibo
	cmpne r3,#'s'
	beq salir
	bne errorMenu

leche:
	ldr r0,=ingresounidades
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades
	bl scanf
	cmp r0,#0
	beq error
	@calculo de precio
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
	ldr r0,=ingresounidades
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades
	bl scanf
	cmp r0,#0
	beq error
	@calculo de precio
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
	ldr r0,=ingresounidades
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades
	bl scanf
	cmp r0,#0
	beq error
	@calculo de precio
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
	ldr r0,=ingresounidades
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades
	bl scanf
	cmp r0,#0
	beq error
	@calculo de precio
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
	ldr r0,=ingresounidades
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades
	bl scanf
	cmp r0,#0
	beq error
	@calculo de precio
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
	ldr r0,=ingresounidades
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades
	bl scanf
	cmp r0,#0
	beq error
	@calculo de precio
	ldr r6,=preciojalea
	ldr r6,[r6]
	ldr r7,=unidades
	ldr r7,[r7]
	mul r8,r6,r7
	ldr r0,=resultadojalea
	str r8,[r0]
	b Menu

yogurt:
	ldr r0,=ingresounidades
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades
	bl scanf
	cmp r0,#0
	beq error
	@calculo de precio
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
	ldr r0,=ingresounidades
	bl puts
	ldr r0,=formatounidad
	ldr r1,=unidades
	bl scanf
	cmp r0,#0
	beq error
	@calculo de precio
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
	ldr r2,=cliente
	mov r1, r2
	ldr r0,=recibocliente
	bl printf
	ldr r0,=factura
	bl puts
	ldr r1,=resultadoleche
	ldr r1,[r1]
	ldr r0,=facturaleche
	bl printf
	ldr r1,=resultadogalleta
	ldr r1,[r1]
	ldr r0,=facturagalletas
	bl printf
	ldr r1,=resultadomantequilla
	ldr r1,[r1]
	ldr r0,=facturamantequilla
	bl printf
	ldr r1,=resultadoqueso
	ldr r1,[r1]
	ldr r0,=facturaqueso
	bl printf
	ldr r1,=resultadopan
	ldr r1,[r1]
	ldr r0,=facturapan
	bl printf
	ldr r1,=resultadojalea
	ldr r1,[r1]
	ldr r0,=facturajalea
	bl printf
	ldr r1,=resultadoyogurt
	ldr r1,[r1]
	ldr r0,=facturayogurt
	bl printf
	ldr r1,=resultadomanzana
	ldr r1,[r1]
	ldr r0,=facturamanzana
	bl printf
	b salir

error:
	ldr r0,=Error
	bl puts
	bl getchar
	b compra

errorMenu:
	ldr r0,=Error
	bl puts
	bl getchar
	b Menu

salir:
	ldr r0,=despedida
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
