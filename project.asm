[org 0x0100]

; Shapes : square , triangle , airplane.
; Colour : red , green , blue , white.
; press w to expand.
; press s to shrink.
; press e to exit from program.

xor ax,ax       ; move 0 in AX.
xor bx,bx       ; move 0 in BX.
xor cx,cx       ; move 0 in CX.
xor dx,dx       ; move 0 in DX.
xor si,si       ; move 0 in SI.
xor di,di       ; move 0 in DI.

jmp start       ; start label.

Str1 : db 'Enter the Shape : ',0
Str2 : db 'Enter the Color : ',0
color : db 0
shape : db 0
check : db 0
countup : db 0
countdown : db 0

clrScr:
 push bp                        ; push BP on stack.
 mov bp,sp                      ; move BP in SP.
 push ax                        ; push AX on stack.
 push bx                        ; push BX on stack.
 push cx                        ; push CX on stack.
 push dx                        ; push DX on stack.
 push si                        ; push SI on stack.
 push di                        ; push DI on stack.
 mov ax, 0xb800                 ; move video memory starting address in AX.
 mov es, ax                     ; point es to video base
 mov ax, 0x0720                 ; space char in normal attribute
 mov cx, 2000                   ; number of screen locations
 cld                            ; auto increment mode
 rep stosw            ; clear the whole screen.
 pop di               ; pop DI from stack.
 pop si               ; pop SI from stack.
 pop dx               ; pop DX from stack.
 pop cx               ; pop CX from stack.
 pop bx               ; pop BX from stack.
 pop ax               ; pop AX from stack.
 pop bp               ; pop BP from stack.
 ret                  ; return to line number from where the subroutine was called.

clrScr2:
 push bp              ; push BP on stack.
 mov bp,sp            ; move BP in SP.
 push ax              ; push AX on stack.
 push bx              ; push BX on stack.
 push cx              ; push CX on stack.
 push dx              ; push DX on stack.
 push si              ; push SI on stack.
 push di              ; push DI on stack.
 mov di,800           ; move 800 in DI.
 mov ax, 0xb800       ; move video memory starting address in AX.
 mov es, ax           ; point es to video base
 mov ax, 0x0720       ; space char in normal attribute
 mov cx, 1600         ; number of screen locations
 cld                  ; auto increment mode
 rep stosw            ; clear the whole screen.
 pop di               ; pop DI from stack.
 pop si               ; pop SI from stack.
 pop dx               ; pop DX from stack.
 pop cx               ; pop CX from stack.
 pop bx               ; pop BX from stack.
 pop ax               ; pop AX from stack.
 pop bp               ; pop BP from stack.
 ret                  ; return to line number from where the subroutine was called.

printSquare:
 push bp
 mov bp,sp 
 push bp
 push ax 
 push bx 
 push cx
 push dx
 push si
 push di
 mov ax,0xb800
 mov es,ax
 mov ah,0x0F
 cmp word [bp+4],'r'
 jne l8
 mov ah,0x04
 jmp l5
 l8:
	cmp word [bp+4],'R'
	jne l9
	mov ah,0x04
	jmp l5
 l9:
	cmp word [bp+4],'g'
	jne l10
	mov ah,0x02
	jmp l5
 l10:
	cmp word [bp+4],'G'
	jne l11
	mov ah,0x02
	jmp l5
 l11:
	cmp word [bp+4],'b'
	jne l12
	mov ah,0x01
	jmp l5
 l12:
	cmp word [bp+4],'B'
	jne l13
	mov ah,0x01
	jmp l5
 l13:
	cmp word [bp+4],'w'
	jne l14
	mov ah,0x0F
	jmp l5
 l14:
	cmp word [bp+4],'W'
	jne l5
	mov ah,0x0F
	jmp l5
 l5:
	mov al,'*'
	mov di,860
	mov cx,[bp+6]
	mov word [bp-2],1020
 l3:
	push cx
	mov cx,[bp+6]
	rep stosw
	pop cx
	mov di,[bp-2]
	add word [bp-2],160
	loop l3
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	pop bp
	ret 4

printAirplane:
 push bp
 mov bp,sp
 push bp
 push bp
 push bp
 push ax 
 push bx 
 push cx 
 push dx 
 push si
 push di
 mov ax,0xb800
 mov es,ax
 mov di,640
 mov dx,3
 mov word [bp-4],800
 mov bx,2
 mov word [bp-2],1
 mov ah,0x0F
 cmp word [bp+4],'r'
 jne l58
 mov ah,0x04
 jmp l59
 l58:
	cmp word [bp+4],'R'
	jne l60
	mov ah,0x04
	jmp l59
 l60:
	cmp word [bp+4],'g'
	jne l61
	mov ah,0x02
	jmp l59
 l61:
	cmp word [bp+4],'G'
	jne l62
	mov ah,0x02
	jmp l59
 l62:
	cmp word [bp+4],'b'
	jne l63
	mov ah,0x01
	jmp l59
 l63:
	cmp word [bp+4],'B'
	jne l64
	mov ah,0x01
	jmp l59
 l64:
	cmp word [bp+4],'w'
	jne l65
	mov ah,0x0F
	jmp l59
 l65:
	cmp word [bp+4],'W'
	jne l59
	mov ah,0x0F
	jmp l59
 l59:
	mov cx,39
	mov al,0x20
 l66:
	rep stosw
	push word [bp-2]
	mov al,'*'
	pop cx
	rep stosw
	add word [bp-2],1
	mov di,[bp-4]
	add word [ bp-4],160
	dec dx
	jnz l59
	sub word [bp-4],160
	mov bx,2
	mov dx,4
	mov word [bp-2],1
	mov cx,[bp-2]
	mov word [bp-6],4
 l73:
	mov di,[bp-4]
	add word [bp-4],80
	mov cx,[bp-2]
	rep stosw
	add word [bp-2],1
	mov di,[bp-4]
	sub di,2
	add word[bp-4],80
	mov cx,[bp-6]
	add word [bp-6],1
	rep stosw
	dec dx
	jnz l73
	mov word [bp-2],0
	mov word [bp-6],0
	mov dx,5
	cmp word [bp+6],11
	jne l80
	mov dx,6
	cmp word [bp+6],12
	jne l80
	mov dx,7
	cmp word [bp+6],9
	jne l80
	mov dx,4
	cmp word [bp+6],8
	jne l80
	mov dx,3
 l80:
	mov cx,68
	mov di,[bp-4]
 l74:
	mov di,[bp-4]
	cmp dx,3
	jb l75
	mov cx,68
	add cx,[bp-2]
	add word [bp-2],1
	jmp l76
 l75:
	mov cx,69
	cmp word [bp+6],11
	jne l81
	mov cx,70
	cmp word [bp+6],12
	jne l81
	mov cx,71
	cmp word [bp+6],9
	jne l81
	mov cx,68
	cmp word [bp+6],8
	jne l81
	mov cx,67
 l81: 
	sub cx,[bp-6]
	add word [bp-6],1
 l76:
	rep stosw
	add word [bp-4],160
	dec dx
	jnz l74
	mov dx,4
	mov word[bp-2],4
	mov word[bp-6],7
 l77:
	mov di,[bp-4]
	add word [bp-4],80
	mov cx,[bp-2]
	sub word [bp-2],1
	rep stosw
	mov di,[bp-4]
	sub di,2
	add word [bp-4],80
	mov cx,[bp-6]
	sub word[bp-6],1
	rep stosw
	dec dx
	jnz l77
	mov dx,3
	mov word [bp-2],3
	add word [bp-4],80
 l78:
	mov di,[bp-4]
	sub di,2
	add word[bp-4],160
	mov cx,[bp-2]
	rep stosw
	sub word [bp-2],1
	dec dx
	jnz l78
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	pop bp
	pop bp
	pop bp
	ret 4

printTriangle:
 push bp
 mov bp,sp
 push bp
 push ax
 push bx
 push cx
 push dx
 push si
 push di
 mov ax,0xb800
 mov es,ax
 mov ah,0x0F
 cmp word [bp+4],'r'
 jne l29
 mov ah,0x04
 jmp l36
 l29:
	cmp word [bp+4],'R'
	jne l30
	mov ah,0x04
	jmp l36
 l30:
	cmp word [bp+4],'g'
	jne l31
	mov ah,0x02
	jmp l36
 l31:
	cmp word [bp+4],'G'
	jne l32
	mov ah,0x02
	jmp l36
 l32:
	cmp word [bp+4],'b'
	jne l33
	mov ah,0x01
	jmp l36
 l33:
	cmp word [bp+4],'B'
	jne l34
	mov ah,0x01
	jmp l36
 l34:
	cmp word [bp+4],'w'
	jne l35
	mov ah,0x0F
	jmp l36
 l35:
	cmp word [bp+4],'W'
	jne l36
	mov ah,0x0F
	jmp l36
 l36:
	mov di,860
	mov al,'*'
	mov bx,880
	mov dx,1
	mov si,2
	cld
 l37:
	mov word [bp-2],0
 l38:
	mov al,0x20
	stosw
	cmp di,bx
	jne l38
	cmp word [bp-2],1
	je l40
	mov cx,dx
	jmp l39
 l40:
	cmp word [bp+6],10
	jne l47
	cmp di,2320
	jb l37
 l47:
	cmp word [bp+6],11
	jne l48
	cmp di,2480
	jb l37
 l48:
	cmp word [bp+6],12
	jne l49
	cmp di,2640
	jb l37
 l49:
	cmp word [bp+6],9
	jne l50
	cmp di,2160
	jb l37
 l50:
	cmp word [bp+6],8
	jne l51
	cmp di,2000
 l51:
	jb l37
	jmp returnT
 l39:
	mov al,'*'
	stosw
	LOOP l39
	add bx,160
	sub bx,si
	add dx,2
	mov word [bp-2],1
	jmp l40
 returnT:
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	pop bp
	ret 4

printString:
 push bp
 mov bp, sp
 push es
 push ax
 push bx
 push cx
 push dx
 push di
 push ds
 push es
 mov al, 1
 mov bh, 0
 mov bl, 0x0F
 mov cx, [bp+4]
 mov dx,[bp+8]
 push cs
 pop es
 mov bp, [bp+6]
 mov ah, 13h
 int 10h
 pop es
 pop ds
 pop di
 pop dx
 pop cx
 pop bx
 pop ax
 pop es
 pop bp
 ret 6

strLength:
 push bp
 mov bp, sp
 push es
 push cx
 push si
 push di
 push ds
 pop es
 mov di, [bp+4]
 mov cx, 0xffff
 xor al, al
 repne scasb
 mov ax, 0xffff
 sub ax, cx 
 dec ax 
 pop di
 pop si
 pop cx
 pop es
 pop bp
 ret 2

input2:
 push bp
 mov bp,sp
 push bp
 push ax
 push si
 push di
 mov dx,[bp+4]
 xor bx,bx
 xor cx,cx
 again2:
	xor bx,bx
	mov ah,0
	int 16h
	cmp al,0x0D
	je return2
	cmp byte [check],0
	jne l16
	cmp byte [shape],0
	jne l17
	mov byte[shape],al
	jmp l17
 l16:
	cmp byte [color],0
	jne l17
	mov byte [color],al
 l17:
	push cx
	mov bh, 0
	mov ah, 2
	int 10h
	mov cx,1
	mov bh,0
	mov bl,0x0F
	mov ah, 09h
	int 10h
	add dl,1
	pop cx
	inc cx
	jmp again2
 return2:
	pop di
	pop si
	pop ax
	pop bp
	pop bp 
	ret 2

start: 
 call clrScr
 push word Str1
 call strLength
 mov dx,0
 push dx
 push word Str1
 push ax
 mov dl,al
 call printString
 xor ax,ax
 mov bh, 0
 mov ah, 2
 int 10h 
 xor ax,ax
 xor cx,cx
 push dx
 call input2
 mov byte [check],1
 xor ax,ax
 push word Str2
 call strLength
 mov bx,0x0100
 push bx
 push word Str2
 push ax
 mov dh,1
 mov dl,al
 call printString
 xor ax,ax
 mov bh, 0
 mov ah, 2
 int 10h 
 xor ax,ax
 xor cx,cx
 push dx
 call input2
 mov ah,2
 mov bh,0
 mov dh,2
 mov dl,0
 int 0x10
 xor ax,ax
 cmp byte [shape],'s'
 jne l4
 mov al,[color]
 mov cx,10
 push cx
 push ax
 call printSquare
 l18:
	MOV AH, 0
	INT 0x16
	cmp al, 'e'
	je exit
	cmp al,'E'
	je exit
	cmp al,'w'
	jne l19
	cmp byte [ countup],2
	je l18
	add byte [countup],1
	sub byte [countdown],1
	inc cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printSquare
 l19:
	cmp al,'W'
	jne l20
	cmp byte [countup],2
	je l18
	add byte [countup],1
	sub byte [countdown],1
	inc cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printSquare
 l20:
	cmp al,'S'
	jne l21
	cmp byte [countdown],2
	je l18
	add byte [countdown],1
	sub byte [countup],1
	call clrScr2
	dec cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printSquare
 l21:
	cmp al,'s'
	jne l22
	cmp byte [countdown],2
	je l18
	add byte [countdown],1
	sub byte [countup],1
	call clrScr2
	dec cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printSquare
 l22:
	jmp l18
 l4:
	cmp byte [shape],'S'
	jne l28
	mov al,[color]
	push ax
	call printSquare
	mov al,[color]
	mov cx,10
	push cx
	push ax
	call printSquare
 l23:
	MOV AH, 0
	INT 0x16
	cmp al, 'e'
	je exit
	cmp al,'E'
	je exit
	cmp al,'w'
	jne l24
	cmp byte [ countup],2
	je l23
	add byte [countup],1
	inc cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printSquare
 l24:
	cmp al,'W'
	jne l25
	cmp byte [countup],2
	je l23
	add byte [countup],1
	inc cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printSquare
 l25:
	cmp al,'S'
	jne l26
	cmp byte [countdown],2
	je l23
	add byte [countdown],1
	call clrScr2
	dec cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printSquare
 l26:
	cmp al,'s'
	jne l27
	cmp byte [countdown],2
	je l23
	add byte [countdown],1
	call clrScr2
	dec cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printSquare
 l27:
	jmp l23
 l28:
	cmp byte [shape],'t'
	jne l41
	mov al,[color]
	mov cx,10
	push cx
	push ax
	call printTriangle
 l42:
	MOV AH, 0
	INT 0x16
	cmp al, 'e'
	je exit
	cmp al,'E'
	je exit
	cmp al,'w'
	jne l43
	cmp byte [countup],2
	je l42
	add byte [countup],1
	sub byte [countdown],1
	inc cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printTriangle
 l43:
	cmp al,'W'
	jne l44
	cmp byte [countup],2
	je l42
	add byte [countup],1
	sub byte [countdown],1
	inc cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printTriangle
 l44:
	cmp al,'S'
	jne l45
	cmp byte [countdown],2
	je l42
	add byte [countdown],1
	sub byte [countup],1
	call clrScr2
	dec cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printTriangle
 l45:
	cmp al,'s'
	jne l46
	cmp byte [countdown],2
	je l42
	add byte [countdown],1
	sub byte [countup],1
	call clrScr2
	dec cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printTriangle
 l46:
	jmp l42
 l41:
	cmp byte [shape],'T'
	jne l52
	mov al,[color]
	mov cx,10
	push cx
	push ax
	call printTriangle
 l53:
	MOV AH, 0
	INT 0x16
	cmp al, 'e'
	je exit
	cmp al,'E'
	je exit
	cmp al,'w'
	jne l54
	cmp byte [ countup],2
	je l53
	add byte [countup],1
	sub byte [countdown],1
	inc cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printTriangle
 l54:
	cmp al,'W'
	jne l55
	cmp byte [countup],2
	je l53
	add byte [countup],1
	sub byte [countdown],1
	inc cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printTriangle
 l55:
	cmp al,'S'
	jne l56
	cmp byte [countdown],2
	je l53
	add byte [countdown],1
	sub byte [countup],1
	call clrScr2
	dec cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printTriangle
 l56:
	cmp al,'s'
	jne l57
	cmp byte [countdown],2
	je l53
	add byte [countdown],1
	sub byte [countup],1
	call clrScr2
	dec cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printTriangle
 l57:
	jmp l53
 l52:
	cmp byte [shape],'a'
	jne l67
	mov al,[color]
	mov cx,10
	push cx
	push ax
	call printAirplane
 l68:
	MOV AH, 0
	INT 0x16
	cmp al, 'e'
	je exit
	cmp al,'E'
	je exit
	cmp al,'w'
	jne l69
	cmp byte [ countup],2
	je l68
	add byte [countup],1
	sub byte [countdown],1
	inc cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printAirplane
 l69:
	cmp al,'W'
	jne l70
	cmp byte [countup],2
	je l68
	add byte [countup],1
	sub byte [countdown],1
	inc cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printAirplane
 l70:
	cmp al,'S'
	jne l71
	cmp byte [countdown],2
	je l68
	add byte [countdown],1
	sub byte [countup],1
	call clrScr2
	dec cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printAirplane
 l71:
	cmp al,'s'
	jne l72
	cmp byte [countdown],2
	je l68
	add byte [countdown],1
	sub byte [countup],1
	call clrScr2
	dec cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printAirplane
 l72:
	jmp l68
 l67:
	cmp byte [shape],'A'
	jne exit
	mov al,[color]
	mov cx,10
	push cx
	push ax
	call printAirplane
 l83:
	MOV AH, 0
	INT 0x16
	cmp al, 'e'
	je exit
	cmp al,'E'
	je exit
	cmp al,'w'
	jne l84
	cmp byte [ countup],2
	je l83
	add byte [countup],1
	sub byte [countdown],1
	inc cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printAirplane
 l84:
	cmp al,'W'
	jne l85
	cmp byte [countup],2
	je l83
	add byte [countup],1
	sub byte [countdown],1
	inc cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printAirplane
 l85:
	cmp al,'S'
	jne l86
	cmp byte [countdown],2
	je l83
	add byte [countdown],1
	sub byte [countup],1
	call clrScr2
	dec cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printAirplane
 l86:
	cmp al,'s'
	jne l87
	cmp byte [countdown],2
	je l83
	add byte [countdown],1
	sub byte [countup],1
	call clrScr2
	dec cx
	push cx
	mov ax,0
	mov al,[color]
	push ax
	call printAirplane
 l87:
	jmp l83
 
exit:
 mov ax,0x4c00
 int 0x21
