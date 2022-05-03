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
	
	
