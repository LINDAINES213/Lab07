/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA 
* Organización de computadoras y Assembler
* Ciclo 1 - 2022
* Mario Antonio Guerra Morales - Carné: 21008
* Linda Inés Jiménez Vides - Carné: 21169
* Cadenas.s
* Programa para ver la compatibilidad de nombres de un bebé.
---------------------------------------------- */

.text
.align 2
.global main
.type main,%function

main:
	stmfd sp!,{lr}
	
	ldr r0,=ingresopagina
	bl puts
	
	ldr r0,=ingresonombre
	bl puts
	ldr r0,=entrada
	ldr r1,=nombre
	bl scanf
	ldr r2,=nombre
	
	ldr r0,=ingresoapellido
	bl puts
	ldr r0,=entrada
	ldr r1,=apellido
	bl scanf
	ldr r3,=apellido
	
	ldr r4,=caracterApe
	ldr r4,[r4]
	
	ldr r5,=caracterNom
	ldr r5,[r5]
	
	ldr r6,=caracterCoin
	ldr r6,[r6]
	
	mov r7,#0 @@Contador del nombre
	mov r8,#0 @@Contador del apellido
	
conteonombre:
	ldrb r1,[r2],#1
	add r5,#1
	cmp r1,#'a'
	addeq r7,#1
	cmp r1,#'e'
	addeq r7,#1
	cmp r1,#'i'
	addeq r7,#1
	cmp r1,#'o'
	addeq r7,#1
	cmp r1,#'u'
	addeq r7,#1
	cmp r1,#0
	bne conteonombre

conteoapellido:
	ldrb r1,[r3],#1
	add r4,#1
	cmp r1,#'a'
	addeq r8,#1
	cmp r1,#'e'
	addeq r8,#1
	cmp r1,#'i'
	addeq r8,#1
	cmp r1,#'o'
	addeq r8,#1
	cmp r1,#'u'
	addeq r8,#1
	cmp r1,#0
	bne conteoapellido
	
	cmp r4,r5
	beq coincidirnumletra
	b vocal
	
coincidirnumletra:
	add r6,#1
	ldr r0,=caracterCoin
	str r6,[r0]
	ldr r0,=formato

vocal:
	cmp r7,r8
	beq coincidevocal
	mov r5,#0
	mov r4,#0
	b letrafinal

coincidevocal:
	add r6,#1
	ldr r0,=caracterCoin
	str r6,[r0]
	ldr r0,=formato

letrafinal:
	ldrb r5,[r2,#-2]
	ldrb r4,[r3,#-2]
	cmp r4,r5
	beq coincideultletra
	b compatibilidad

coincideultletra:
	ldr r0,=formatoc
	mov r1,r4
	bl printf
	ldr r0,=formatoc
	mov r1,r5
	bl printf
	
	add r6,#1
	ldr r0,=caracterCoin
	str r6,[r0]

compatibilidad:
	ldr r0,=fortuna
	ldr r1,=caracterCoin
	ldr r1,[r1]
	bl printf
	
	mov r0,#0
	mov r3,#0
	ldmfd sp!,{lr}
	bx lr

.data
.align 2

caracterApe:
	.word 0
caracterNom:
	.word 0
caracterCoin:
	.word 0
ingresopagina:
	.asciz "Bienvenido a MiPrimerBebe.com\n"
ingresonombre:
	.asciz "Ingrese el nombre de su bebe: "
ingresoapellido:
	.asciz "Ahora ingrese el apellido de su bebe: "
fortuna:
	.asciz "\nLa compatibilidad que posee este nombre es de: %d\n"
entrada:
	.asciz "%s"
formato:
	.asciz "%d"
formatoc:
	.asciz ".%c"
nombre:		.asciz "                              " 
apellido:	.asciz "                              "
