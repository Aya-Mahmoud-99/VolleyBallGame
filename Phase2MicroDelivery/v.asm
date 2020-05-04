																																																																																																																																																																											  .model medium
.stack 100h
.data
        
        LEVEL DB 0 
    WINDOW_WIDTH DW 138H ; WINDOW WIDTH 320 PX 
    WINDOW_HEIGHT DW 160 ; WIDNOW HEIGHT   200 PX 
      
    db 64  dup (' ')
    TIME DB 0 ;USED FOR CHECKING TIME CHANGING
    
    BALL_X DW 0Ah ; X COORDINATE COLOUMN
    BALL_Y DW 0Fh ; Y COORDINATE ROW     
    
    BALL_SIZE DW 04h ; BALL SIZE IN WIDTH AND HEIGHT
    
    SCORE_P1 DB 0
    SCORE_P1_STRING DB 3 DUP ('$')
    
    SCORE_P2 DB 0 
    SCORE_P2_STRING DB 3 DUP ('$')
      
    ROUND_NUMBER DW 1
    MAX_ROUND_NUMBER DW 20 ; MAX NUMBER OF ROUNDS 
    
    IS_FINISHED DW 0 ; IS FINISHED ? IF 0 NOTHING HAPPENS , IF 1 SHOW RESULT  
    
    PN  DB ' HIS NAME IS: ','$'
    
    P2W DB 0AH,0DH,'               ||           ','PLAYER 2 IS THE WINNER','                 ','$',0AH,0DH
    P1W DB 0AH,0DH,'               ||           ','PLAYER 1 IS THE WINNER','                 ','$',0AH,0DH
    
    SMALL_SPACE DB '                            ||          ','$'
    
	BALL_VELOCITY_X  DW 01H ; X VELOCITY OF THE BALL
    BALL_VELOCITY_Y  DW 01H ; Y VELCOCTY OF THE BALL 
    
    BALL_STARTING_POSITION_X_P1 DW 50
    BALL_STARTING_POSITION_Y_P1 DW 50
    
    BALL_STARTING_POSITION_X_P2 DW 270
    BALL_STARTING_POSITION_Y_P2 DW 50
    
    net_x dw 160  ;constant
	net_y dw ?  ;constant
	net_weidth dw 2 ;constant
	net_height dw 55 ;constant
	jumpmode dw 0
	jumpmode2 dw 0
	angle db 30
	half_ball_size db ?
	half_BONUS_size db ?    
	half_BONUS1_size db ?  
	half_DANGER_size db ?    
	half_DANGER1_size db ? 
	
	;initially zero(the user is not jumping) 
	;1 the user is jumping up
	;2 the user reched the limit then it is moving down
	 iscollidingfromxaxis dw 0
     iscollidingfromxaxis2 dw 0
	                
	                player1_x dw 80
	                player1_y dw 137
	                player1_yinit dw 137 ; 155 - 20 = 9 3 1 
	                 
	                
	                player2_x dw 220
	                player2_y dw 137 ; 155 - 19 = 4 3 1
	                
	                CLOUD1_X  DW 200
	                CLOUD1_Y  DW 10 
	                
	                CLOUD2_X  DW 100
	                CLOUD2_Y  DW 10    
	                
	                CLOUD3_X  DW 250
	                CLOUD3_Y  DW 30
	                
	                CLOUD4_X  DW 150
	                CLOUD4_Y  DW 30 
	                
	                BONUS_X            DW 100
	                BONUS_Y            DW 10
	                BONUS_SIZE         DW 04H
	                BONUS_VELOCITY_Y   DW 01H    
	                BONUS_ORIGINAL_X   DW 100
	                BONUS_ORIGINAL_Y   DW 10
	                                          
	                                          
	                BONUS1_X            DW 200
	                BONUS1_Y            DW 10
	                BONUS1_SIZE         DW 04H
	                BONUS1_VELOCITY_Y   DW 01H    
	                BONUS1_ORIGINAL_X   DW 200
	                BONUS1_ORIGINAL_Y   DW 10 
	                
	                
	                DANGER_X            DW 50
	                DANGER_Y            DW 10
	                DANGER_SIZE         DW 04H
	                DANGER_VELOCITY_Y   DW 01H    
	                DANGER_ORIGINAL_X   DW 50
	                DANGER_ORIGINAL_Y   DW 10
	                                          
	                                          
	                DANGER1_X            DW 250
	                DANGER1_Y            DW 10
	                DANGER1_SIZE         DW 04H
	                DANGER1_VELOCITY_Y   DW 01H    
	                DANGER1_ORIGINAL_X   DW 250
	                DANGER1_ORIGINAL_Y   DW 10 
	                
	                
	                 SEND_VAL    DB  ?
					 SEND_X      DB  0
					 SEND_Y      DB  1
					 RECEIVE_VAL DB  ?
					 RECEIVE_X   DB  0
					 RECEIVE_Y   DB  13    
					 
					 SEND_VAL1    DB  ?
					 SEND_X1      DB  0
					 SEND_Y1      DB  141
					 RECEIVE_VAL1 DB  ?
					 RECEIVE_X1   DB  0
					 RECEIVE_Y1   DB  150                               
	                                       
	                
	                jumplimit dw 125
	                
	                player1_velocity_x dw 0h ;x velocity of the ball
                    player1_velocity_y dw 0h ;y velocity of the ball
                    player2_velocity_x dw 0h ;x velocity of the ball
                    player2_velocity_y dw 0h ;y velocity of the ball
                    
                    third_player_weidth db ? 
                    twothird_player_weidth dw ?
                    
                    player_weidth dw 21    ; 50 ; shelna 6 shemal 
	                player_height dw 21    ; 3      
	                VALUE_TO_SEND db ?   
	                value_to_receive db ?   
	                counter_master_slave db 0
	                       
	                
	                
	EXIT_CHECKER DB 0  ; DEFAULT VALUE = 0 , IF CHANGED TO 1 THE GAME IS EXIT 
	
 
HALF_VERTICAL_SPACE DB 10 DUP (0AH,0DH),'$'


RESULT_MENU_1 db '  ',0ah,0dh
                                                                                            
db ' ',0ah,0dh
db ' ',0ah,0dh
db ' ',0ah,0dh
db '                ====================================================',0ah,0dh
db '               ||                                                  ||',0ah,0dh                                        
db '               ||           *    GAME FINISHED   *                 ||',0ah,0dh
db '               ||                                                  ||',0ah,0dh
db '               ||--------------------------------------------------||',0ah,0dh
db '               ||          GAME SCORE :                            ||',0ah,0dh

db '                                        ','$',0ah,0dh 

RESULT_MENU_2 db '  ',0ah,0dh
db '               ||                                                  ||',0ah,0dh
db '               ||                                                  ||',0ah,0dh          
db '               ||               WINNER IS:                         ||',0ah,0dh
db '$',0ah,0dh


RESULT_MENU_3 db '  ',0ah,0dh
db '               ||                                                  ||',0ah,0dh
db '               ||                                                  ||',0ah,0dh          
db '               ||       THANK U FOR PLAYING OUR GAME               ||',0ah,0dh
db '$',0ah,0dh

RESULT_MENU_4 db '                ====================================================','$',0ah,0dh	                          

END_MENU db '  ',0ah,0dh
                                                                                            
db ' ',0ah,0dh
db ' ',0ah,0dh
db ' ',0ah,0dh
db '                ====================================================',0ah,0dh
db '               ||                                                  ||',0ah,0dh                                        
db '               ||           *    VOLLYBALL Game  *                 ||',0ah,0dh
db '               ||                                                  ||',0ah,0dh
db '               ||--------------------------------------------------||',0ah,0dh
db '               ||                                                  ||',0ah,0dh
db '               ||                                                  ||',0ah,0dh
db '               ||                                                  ||',0ah,0dh          
db '               ||                    THANK U                       ||',0ah,0dh
db '               ||                                                  ||',0ah,0dh
db '               ||                                                  ||',0ah,0dh
db '                ====================================================',0ah,0dh
db '$',0ah,0dh	                
	                
MAIN_MENU db '  ',0ah,0dh

db ' ',0ah,0dh
db ' ',0ah,0dh
db ' ',0ah,0dh
db '                ====================================================',0ah,0dh
db '               ||                                                  ||',0ah,0dh                                        
db '               ||           *    VOLLYBALL Game  *                 ||',0ah,0dh
db '               ||                                                  ||',0ah,0dh
db '               ||--------------------------------------------------||',0ah,0dh
db '               ||                                                  ||',0ah,0dh          
db '               ||       Use RIGHT and LEFT keys to move player     ||',0ah,0dh
db '               ||                                                  ||',0ah,0dh
db '               ||              PRESS C TO START CHATTING           ||',0ah,0dh
db '               ||              press space to start level 2        ||',0ah,0dh
db '               ||              Press Enter to start level 1        ||',0ah,0dh 
db '               ||                                                  ||',0ah,0dh
db '               ||                  press end to end                ||',0ah,0dh
db '                ====================================================',0ah,0dh
db '$',0ah,0dh

PLAYER_NAME_MENU1 db '  ',0ah,0dh
db ' ',0ah,0dh
db ' ',0ah,0dh
db '                ====================================================' ,0ah,0dh
db '               ||                                                  ||',0ah,0dh                                        
db '               ||           *    VOLLYBALL Game  *                 ||',0ah,0dh
db '               ||                                                  ||',0ah,0dh
db '               ||--------------------------------------------------||',0ah,0dh
db '               ||                                                  ||',0ah,0dh
db '               ||       Enter player Name :                        ||',0ah,0dh             
db '$',0ah,0dh

PLAYER_NAME_MENU2 db '  ',0ah,0dh

db '               ||       Enter player 2 Name :                      ||',0ah,0dh            
db '$',0ah,0dh




;HEADER DB '             VOLLY BALL GAME ','$',0AH,0DH 

IN_GAME_SCORE_P1 DB 'P1 SCORE: ','$'
IN_GAME_SCORE_P2 DB 'P2 SCORE: ','$'

VERTICAL_SPACE DB 20 DUP (0AH,0DH),'$'
CHATS DB '----------------------------------------','$',0AH,0DH
MESSAGE DB 'CHAt BOX:','$',0AH,0DH

   
PLAYER_NAME_STRING1 DB 15 DUP ('$')	
	
;PLAYER_NAME_STRING1 DB 15 DUP ('$') 

PLAYER_CHAT_STRING1 DB 400 DUP ('$')  ; LENGTH OF CHAT 1 

PLAYER_NAME_STRING2  DB 15 DUP ('$')

PLAYER_CHAT_STRING2 DB 400 DUP ('$')  ; LENGTH OF CHAT 2 

PLAYER_NAME_STRING_temp db 15 DUP ('$')

PLAYER_NAME_SIZE DW 15 
NEW_LINE DB 0AH,0DH,'$'
HALF_SPACE DB 0AH,0DH,'                           ','$' 
                 
mario db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,3,3,0,3,3,0,0,0,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,3,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0
db 0,0,0,0,0,3,3,0,0,3,3,3,0,3,3,3,3,3,3,3,3,3
db 0,0,0,0,0,3,0,0,0,3,3,3,3,3,3,3,3,0,0,0,0,0
db 0,0,0,0,3,3,0,0,3,3,3,3,3,3,0,0,0,0,0,0,0,0
db 0,0,0,0,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0
db 0,0,0,0,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,0,3,3,3,3,3,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0
db 0,0,3,3,0,3,0,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0
db 3,3,3,3,3,3,3,3,3,0,3,3,3,0,0,0,0,0,0,0,0,0
db 3,0,0,0,0,3,3,3,0,0,3,3,3,0,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0                   ; 224 - 20
db 0,0,0,0,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0
db 0,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 

mario2 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,0,0,0,4,4,0,4,4,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,0,0,0,4,4,0,0,4,0,0,0,0,0,0
db 4,4,4,4,4,4,4,4,4,0,4,4,4,0,0,4,4,0,0,0,0,0
db 0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,0,4,0,0,0,0,0
db 0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,0,4,4,0,0,0,0
db 0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,4,4,0,0,0,0
db 0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,4,4,0,0,0,0
db 0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,0,4,0,4,4,0,0
db 0,0,0,0,0,0,0,0,0,4,4,4,0,4,4,4,4,4,4,4,4,4
db 0,0,0,0,0,0,0,0,0,4,4,4,0,0,4,4,4,0,0,0,0,4
db 0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,0,0
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,0,0,0,0


CLOUD  DB  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
       DB  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
       DB  0,0,0,0,0,0,0,0,0,9,9,9,0,0,0,0,0,0,0,0,0,0
       DB  0,0,0,0,0,0,0,9,9,9,9,9,9,9,0,0,0,0,0,0,0,0
       DB  0,0,0,0,0,0,9,9,9,9,9,9,9,9,9,0,0,0,0,0,0,0
       DB  0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,0,0,0
       DB  0,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,0,0,0,0,0,0
       DB  0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0
       DB  9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0
       DB  0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9
       DB  0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9
       DB  0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0
       DB  0,0,0,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,0,0,0
       DB  0,0,0,0,0,0,0,0,9,9,9,9,9,9,9,9,0,0,0,0,0,0
       DB  0,0,0,0,0,0,0,0,0,9,9,9,9,9,9,9,0,0,0,0,0,0
       DB  0,0,0,0,0,0,0,0,0,0,0,9,9,9,9,0,0,0,0,0,0,0
       
      
        
        
        
        

;  1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9

                           
.CODE 
MAIN  PROC   FAR
    
MOV AX,@DATA
MOV DS,AX 


MOV AX, 0B800h
MOV ES,AX  



;   MOV AH, 00h  ; interrupts to get system time        
;   INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

;   mov  ax, dx
;   xor  dx, dx
;   mov  cx, 3    
;   div  cx       ; here dx contains the remainder of the division - from 0 to 2
   
 
;isdl0:
;cmp dl,0
;jne isdl1
;mov angle,45
;isdl1: 
;cmp dl,1 
;jne isdl2
;mov angle,0
;isdl2:
;mov angle, 45
;neg angle
;call setvelocities



mov ax,player_weidth
mov bl,3
div bl
mov third_player_weidth,al
mov bl,2
mul bl
mov twothird_player_weidth,ax
mov ax ,ball_size
mov bl,2
div bl
mov half_ball_size,al


mov ax ,window_height
sub ax,net_height
mov net_y,ax  
call initializecom

      ;CALL ENTER_PLAYER_NAME
      call enter_temp_player_name 
      
      CALL GAME_MENU  
       ;/* EXIT CHECK */
      
      PUSH DX
      MOV DL,1 ; TO CHECK WETHER TO END OR NOT 
      CMP EXIT_CHECKER,DL 
      JNE DONOTDOTHINGGGG1
      JMP  FROM_GAME_MENU_EXIT  
      DONOTDOTHINGGGG1:
      POP DX 
      
      ;/* EXIT CHECK END   */
      
      ;CALL ENTER_PLAYER_NAME 
      
      ;CALL CLEAR_SCREEN_VIDEO_MOOD
      
         MOV AH,00H
          MOV AL,13H
          INT 10H   
          call  check_master_slave 
         ; MOV CX,0FFFH
         ; MOV DX,0FFEH
         ; mov ah,86h    ; Work only on the Dos box 
         ; int 15h
          TIME_CHECK1:
         
          MOV AH,2Ch ;GET SYSTEM TIME
          INT 21H  ; ch = hour , cl = minutes , dh = seconds dl = 1/100 seconds
        ;      
          CMP DL,TIME            ; IS THE CURRENT TIME = TO PREVIOUS 1       
        ;        
         JE TIME_CHECK1
           ; IF IT'S DIFFRENT THEN DRAW AND MOVE  
          TIME_CHECK2:
         
          MOV AH,2Ch ;GET SYSTEM TIME
          INT 21H  ; ch = hour , cl = minutes , dh = seconds dl = 1/100 seconds
        ;      
          CMP DL,TIME            ; IS THE CURRENT TIME = TO PREVIOUS 1       
        ;        
         JE TIME_CHECK2
           ; IF IT'S DIFFRENT THEN DRAW AND MOVE 
         TIME_CHECK3:
         
          MOV AH,2Ch ;GET SYSTEM TIME
          INT 21H  ; ch = hour , cl = minutes , dh = seconds dl = 1/100 seconds
        ;      
          CMP DL,TIME            ; IS THE CURRENT TIME = TO PREVIOUS 1       
        ;        
         JE TIME_CHECK3
           ; IF IT'S DIFFRENT THEN DRAW AND MOVE
                   ; TIME_CHECK4:
         
        ;  MOV AH,2Ch ;GET SYSTEM TIME
        ;  INT 21H  ; ch = hour , cl = minutes , dh = seconds dl = 1/100 seconds
        ;      
        ;  CMP DL,TIME            ; IS THE CURRENT TIME = TO PREVIOUS 1       
        ;        
        ; JE TIME_CHECK4 
                 ; TIME_CHECK5:
         
        ;  MOV AH,2Ch ;GET SYSTEM TIME
        ;  INT 21H  ; ch = hour , cl = minutes , dh = seconds dl = 1/100 seconds
        ;      
        ;  CMP DL,TIME            ; IS THE CURRENT TIME = TO PREVIOUS 1       
        ;        
        ; JE TIME_CHECK5
        ; MOV CX,0AFH
        ; MOV DX,0AEH
        ; mov ah,86h    ; Work only on the Dos box 
        ; int 15h

         mov al,counter_master_slave
         cmp al,1
         je slaveee
         call assignplayernames_master
         jmp masteree 
         slaveee: 
         call assignplayernames_slave
         masteree:
          
    
      TIME_CHECK:
         
          MOV AH,2Ch ;GET SYSTEM TIME
          INT 21H  ; ch = hour , cl = minutes , dh = seconds dl = 1/100 seconds
        ;      
          CMP DL,TIME            ; IS THE CURRENT TIME = TO PREVIOUS 1       
        ;        
         JE TIME_CHECK
           ; IF IT'S DIFFRENT THEN DRAW AND MOVE 
           
         ;  call DRAW_virtual_BALL  
          
         MOV TIME,DL; UPDATE TIME   
          
  
          
          mov iscollidingfromxaxis,0
          mov iscollidingfromxaxis2,0
          
          CALL CLEAR_SCREEN_VIDEO_MOOD 
           
        ;                                
          CALL DRAW_CLOUD1 
          
          CALL DRAW_CLOUD2
          
          CALL DRAW_CLOUD3 
          
          CALL DRAW_CLOUD4  
          
          
          
          CALL DRAW_NET
           
           call DRAW_PLAYER1
          
         call DRAW_PLAYER2 
         CALL DRAW_REAL_BALL
 
          

         
          ;/* EXIT CHECK */   
         PUSH DX
         MOV DL,1 ; TO CHECK WETHER TO END OR NOT 
         CMP EXIT_CHECKER,DL
         jne donotdothingggg
         Jmp  EXIT
         donotdothingggg:  
         POP DX 
         
        
        ;/* EXIT END   */ 
          
         call checkcollwithfplx1
         
         call checkcollwithfply 
         call checkcollwithfplx2
         
         call checkcollwithfply2
         cmp level,1
		 jne not_level_2  
		 CALL DRAW_DANGER
         
         CALL DRAW_DANGER1
		 CALL DRAW_BONUS
         
         CALL DRAW_BONUS1
         CALL COLLISION_BONUS_PLY1  
         CALL COLLISION_BONUS_PLY2
         
         CALL COLLISION_DANGER_PLY1  
         CALL COLLISION_DANGER_PLY2  
         not_level_2:
         
         mov al,counter_master_slave
         cmp al,1
         je slave
         call getinput_master
         call getotherplayerinput_master
         jmp master 
         slave: 
         call getinput_slave
         call getotherplayerinput_slave
         master: 
         
         call checkjumpmode
         call checkjumpmode2 
         call checkjumpmode
         call checkjumpmode2 
         
         ;cmp jumpmode,0    
         
        ; je dontcheckagain
         
         ;call checkcollwithfpl
         
        ;dontcheckagain:
          
          CALL MOV_BALL
         CALL MOV_BONUS 
          CALL MOV_BONUS1
          
          CALL MOV_DANGER 
          CALL MOV_DANGER1
         ; for illusional moving ball draw a black ball behing it
         CALL CHAT_BOX
       ; call ingame_chat   
         CALL FINISHED_GAME
          
         MOV AX,1
         CMP IS_FINISHED,AX
         JE EXIT         
         
       ;  mov cx,00h
       ;  mov dx,06a12h
       ;  mov ah,86h
       ;  int 15h    
      JMP TIME_CHECK ; checking the time again
       
                       
                       
     EXIT: ; IF PRESSED ESC
     
      CALL SHOW_RESULT
      
      MOV CX,0FFFH
      MOV DX,0FFEH
      mov ah,86h    ; Work only on the Dos box 
      int 15h
      
      
      MOV AX,03h ;
      INT 16     ; TEXT MOOD
      
      FROM_GAME_MENU_EXIT: ; NO NEED TO SHOW RESULT AS THE GAME DIDN'T START
      
      CALL END_MENU_PROC
      
      MOV CX,0AFH
      MOV DX,0AEH
      mov ah,86h    ; Work only on the Dos box 
      int 15h
      

      mov ah,4CH
      int 21h
      
RET
main endp
initializecom proc near  
    
;Set Divisor Latch Access Bit
mov dx,3fbh 			; Line Control Register
mov al,10000000b		;Set Divisor Latch Access Bit
out dx,al

;Set LSB byte of the Baud Rate Divisor Latch register.
mov dx,3f8h			
mov al,0ch			
out dx,al
	
;Set MSB byte of the Baud Rate Divisor Latch register.
mov dx,3f9h
mov al,00h
out dx,al
 
;Set port configuration
mov dx,3fbh
mov al,00011011b
;0:Access to Receiver buffer, Transmitter buffer
;0:Set Break disabled
;011:Even Parity
;0:One Stop Bit
;11:8bits
out dx,al


ret    
 initializecom endp

send proc near
    
    ;Check that Transmitter Holding Register is Empty 
    mov al,VALUE_TO_SEND
    cmp al,0
    jne cont
    ret
    cont:
		mov dx , 3FDH		; Line Status Register
AGAINo:  	In al , dx 			;Read Line Status
  		AND al , 00100000b
  		JZ AGAINo

;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,VALUE_TO_SEND
  		out dx , al 
  		ret
 
    
send endp

receive proc near 
    ;Check that Data Ready
		mov dx , 3FDH		; Line Status Register
		in al , dx 
  		AND al , 1
  		JnZ rec 
  		mov value_to_receive,0
  		ret
  		rec:

 ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H
  		in al , dx 
  		mov VALUE_to_receive , al
  		chk: 
  		
  		ret

receive endp
check_master_slave proc near
    mov al,counter_master_slave 
    mov value_to_send,0
      repooooo:
		mov dx , 3FDH		; Line Status Register
AGAIN:  	In al , dx 			;Read Line Status
  		AND al , 00100000b
  		JZ AGAIN

;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
  		mov  al,VALUE_TO_SEND
  		out dx , al   
      inc counter_master_slave
      
        ;Check that Data Ready
	   mov dx , 3FDH		; Line Status Register
		in al , dx 
  		AND al , 1 
  		
  		Jz  repooooo

  		 
  		 
  		ret
    
check_master_slave endp   


assignplayernames_master proc near 
   MOV CX,PLAYER_NAME_SIZE
   lea si,PLAYER_NAME_STRING1
   lea bx,PLAYER_NAME_STRING2
   lea di,PLAYER_NAME_STRING_temp
letters:
MOV al,[di]
mov value_to_send,al 
mov [si],al
call receive
mov al,value_to_receive
mov [bx],al 
call send
INC bx   ; ASSIGN CHAR VALUE TO SI
INC SI        
INC DI
LOOP letters
ret 
assignplayernames_master endp 


assignplayernames_slave proc near 
   MOV CX,PLAYER_NAME_SIZE
   lea si,PLAYER_NAME_STRING2
   lea bx,PLAYER_NAME_STRING1
   lea di,PLAYER_NAME_STRING_temp
letterss:
MOV al,[di]
mov value_to_send,al
call send 
mov [si],al
call receive
mov al,value_to_receive
mov [bx],al 
INC bx   ; ASSIGN CHAR VALUE TO SI
INC SI        
INC DI
LOOP letterss  
ret
assignplayernames_slave endp


RESET_BALL_POSITION PROC NEAR
    
    MOV AX,ROUND_NUMBER
    MOV DL,2
    DIV DL    ; AL HAS THE QUOTIENT                                                                                                           
    MOV BX,ROUND_NUMBER
    MOV BH,0
    
    MOV AH,0
    CMP BL,AL       ; COMPARE AL WITH BL
    JG PLAYER_2_ROUNDS
    
    MOV AX, BALL_STARTING_POSITION_X_P1
    MOV BALL_X,AX
    
    
    
    MOV AX, BALL_STARTING_POSITION_Y_P1 
    MOV BALL_Y,AX
    
    RET
    
    PLAYER_2_ROUNDS:
    
      
    MOV AX, BALL_STARTING_POSITION_X_P2
    MOV BALL_X,AX
    
    
    
    MOV AX, BALL_STARTING_POSITION_Y_P2 
    MOV BALL_Y,AX
    
    
    RET

RESET_BALL_POSITION ENDP

MOV_BALL PROC NEAR


          MOV AX,BALL_VELOCITY_X    ; MOVE BALL HORIZONTLY 
          ADD BALL_x,AX         
          
          CMP BALL_X,00H
          jg n
          call REVERSE_VELOCITY_X    ; IF X < 00H COLLOIDE WITH LEFT WALL
          n:
       
                                
          MOV AX,WINDOW_WIDTH      ; IF X > 320PX COLLOIDE WITH RIGHT WALL
          SUB AX,BALL_SIZE
          CMP BALL_X,AX  
          jl p
          call REVERSE_VELOCITY_X
          p:
          ;////////////////////////////////////////
          
          MOV AX,BALL_VELOCITY_Y
          ADD BALL_Y,AX              ; MOV BALL VERITCALLY 
          
          
          CMP BALL_Y,0AH
          jg f
          call REVERSE_VELOCITY_Y    ; IF Y < 00H COLLOIDE WITH UPPER WALL
          f:
                                
          MOV AX,WINDOW_HEIGHT      ; IF Y > 140PX COLLOIDE WITH GROUND WALL
          SUB AX,BALL_SIZE
          CMP BALL_Y,AX      ; IF TOUCHES THE GROUND INC ROUND NUMBER 
          jl w 
          
          INC ROUND_NUMBER ; 
          
          PUSH AX     ; TO MAINTAIN EVERY THING AS IT IS PRECAUITION CODE 
          
          ; INCREASING PLAYER 1 OR PLAYER 2 SCORE 
           
          MOV AX,BALL_X
          CMP AX,NET_X          ; IF BALL TOUCH GROUND BEFORE THE NET INC PLAYER 2 SCORE
          JL INC_PLAYER_2_SCORE
          
          INC SCORE_P1                ; INC PLAYER 1 SCORE P1 GREATER 
          call RESET_BALL_POSITION    ; RESET THE BALL POSITION AS IT IS THE START OF A NEW ROUND
           
          POP AX                    ; POP AX SO THE END OF INCREASING SCORE CODE 
          
          JMP SKIP3                 ; SO SKIP THE NEXT LINES   OR THE ABOVE LINE DIDN'T EXECUTE SO EXECUTE THE COMING LINES 
          INC_PLAYER_2_SCORE:
          
          INC SCORE_P2
          call RESET_BALL_POSITION
          POP AX
          
          SKIP3:
           
          w:
                    
          mov ax,ball_y   ;if the bally+ballsize=nety then check the x it may be collinding
          add ax,ball_size
          cmp ax,net_y   
          ;;;
          jne continue2
          
          mov ax,net_x    ;if the leftpart of the ballis geater than the right part then it can't be collisding            
          add ax,net_weidth
          ;add ax,2
          cmp ball_x,ax
         jg continue2
          
         mov ax,ball_x  ;if the right part of the ball is grater than the left part of then ned after those checks then it collides
          add ax,ball_size
         ; add ax,2
           cmp ax,net_x 
          jl d
          call  REVERSE_VELOCITY_Y
          d:
           
          continue2: 
          
          mov ax,ball_x     
          add ax,ball_size
          ;add ax,1
          cmp ax,net_x     ;if ballx(the left side of the ball)=netx-ballsize then check the net height it may be colliding it from the right
          je checky 
                             
          mov ax,net_x       ;if net weidth+netx=ballx then check the height it may be colliding from the right 
          add ax,net_weidth
          ;add ax,1
          cmp ball_x,ax
          jne continue1
          
          checky:
          mov ax,ball_y
          add ax,ball_size  
          cmp ax,net_y
          jl continue1        ; if it is less then the height then it is not colliding
          call REVERSE_VELOCITY_X
          continue1:
           
           
   
      
         
          
         
         
          RET
                                 
          ;/*------------------------------*/
          
          
            
          
MOV_BALL ENDP


            REVERSE_VELOCITY_X proc near
              NEG BALL_VELOCITY_X 
              neg angle
              RET 
              
             REVERSE_VELOCITY_X endp 
              
            
            REVERSE_VELOCITY_Y proc near
              NEG BALL_VELOCITY_Y
              RET  
              REVERSE_VELOCITY_Y endp
              
                        

DRAW_REAL_BALL PROC NEAR 
    
    ; this procedure draws the horizontal axis first then get down line and redraw horizontal line  
        
        MOV CX,BALL_X  ;  THE X COORDINATES TO CX COLOUMN  
        MOV DX,BALL_Y  ; ENTER THE Y COORDINATES TO DY ROW
        
        MOV BX,BALL_SIZE ; the counter for the vertical loop 
        MOV SI,BALL_SIZE ; the counter for horizontal loop 
        
       
        VERTICAL_DRAWING:
            
        
            HORIZONTAL_DRAWING:
            
                ;DRWAING A PIXEL 
                MOV AH,0Ch; CONFIGURATION 
                MOV AL,0Ch; COLOR OF PIXEL
                MOV BH,00h; PAGE NUMBER 
                ;MOV CX,BALL_X;   SET X POSITION 
                ;MOV DX,BALL_Y;   SETTING Y POSITION 
                INT 10H    
                  
                INC CX ; increase the widh 
                DEC SI ; to end the loop
                CMP SI,0  
                
            JNE HORIZONTAL_DRAWING 
             
            MOV SI,BALL_SIZE  ; reset the horizontal counter
            MOV CX,BALL_X     ; reset the cx position again
            INC DX            ; inc the vertical axis position
            DEC BX            ; decrease the vertical loop 
            
            CMP BX,0
            
        JNE VERTICAL_DRAWING
      
    
    RET
DRAW_REAL_BALL    ENDP    

DRAW_BONUS PROC NEAR
    
      MOV CX,BONUS_X   ;SET THE INITIAL COLUMN X
      MOV DX, BONUS_Y  ;set the initial ROW
      
      DRAW_BONUS_HORIZONTAL:
      MOV AH,0CH    
      MOV AL,0DH    ; CHOOSE GREY AS A COLOR  
      MOV BH,00H   ; PAGE NO.
      INT 10H
      
      INC CX
      MOV AX,CX        ;CX-BONUS_X > BONUS_SIZE (YES-> WE GO TO THE NEXT LINE, NO->WE CONTINUE TO THE NEXT COLUMN
      SUB AX,BONUS_X
      CMP AX,BONUS_SIZE
      JNG DRAW_BONUS_HORIZONTAL
      
      
      MOV CX,BONUS_X
      INC DX      
      
      MOV AX,DX        ;DX-BONUS_Y > BONUS_SIZE (YES-> WE EXIT THE PROCEDURE, NO->WE CONTINUE TO THE NEXT ROW
      SUB AX,BONUS_Y
      CMP AX,BONUS_SIZE
      JNG DRAW_BONUS_HORIZONTAL
      
      
    
    
    RET 
    DRAW_BONUS ENDP 

DRAW_BONUS1 PROC NEAR
    
      MOV CX,BONUS1_X   ;SET THE INITIAL COLUMN X
      MOV DX, BONUS1_Y  ;set the initial ROW
      
      DRAW_BONUS1_HORIZONTAL:
      MOV AH,0CH    
      MOV AL,0DH    ; CHOOSE GREY AS A COLOR  
      MOV BH,00H   ; PAGE NO.
      INT 10H
      
      INC CX
      MOV AX,CX        ;CX-BONUS_X > BONUS_SIZE (YES-> WE GO TO THE NEXT LINE, NO->WE CONTINUE TO THE NEXT COLUMN
      SUB AX,BONUS1_X
      CMP AX,BONUS1_SIZE
      JNG DRAW_BONUS1_HORIZONTAL
      
      
      MOV CX,BONUS1_X
      INC DX      
      
      MOV AX,DX        ;DX-BONUS_Y > BONUS_SIZE (YES-> WE EXIT THE PROCEDURE, NO->WE CONTINUE TO THE NEXT ROW
      SUB AX,BONUS1_Y
      CMP AX,BONUS1_SIZE
      JNG DRAW_BONUS1_HORIZONTAL
      
      
    
    
    RET 
    DRAW_BONUS1 ENDP 



MOV_BONUS PROC NEAR 
    MOV AX,BONUS_VELOCITY_Y
    ADD BONUS_Y,AX        ; MOVE THE BONUS VERTICALLY 
    
    MOV AX,WINDOW_HEIGHT    
    SUB AX,BONUS_SIZE
    CMP BONUS_Y,AX
    JG  RESET_BONUS_POS          ; BONUS_Y > WINDOW_HEIGHT - BONUS_SIZE  (YES-> COLLIDED)
    
 RET  
 
      RESET_BONUS_POS:
            CALL RES_BONUS_POS
            RET
 MOV_BONUS ENDP
               
  RES_BONUS_POS PROC NEAR 
    
     MOV AX,BONUS_ORIGINAL_X
     MOV BONUS_X ,AX
     
     
     MOV AX,BONUS_ORIGINAL_Y
     MOV BONUS_Y ,AX
     
    
    
    
    RET
 RES_BONUS_POS ENDP 
  
  MOV_BONUS1 PROC NEAR 
    MOV AX,BONUS1_VELOCITY_Y
    ADD BONUS1_Y,AX        ; MOVE THE BONUS VERTICALLY 
    
    MOV AX,WINDOW_HEIGHT    
    SUB AX,BONUS1_SIZE
    CMP BONUS1_Y,AX
    JG  RESET_BONUS1_POS          ; BONUS_Y > WINDOW_HEIGHT - BONUS_SIZE  (YES-> COLLIDED)
    
 RET  
 
      RESET_BONUS1_POS:
            CALL RES_BONUS1_POS
            RET
 MOV_BONUS1 ENDP
               
  RES_BONUS1_POS PROC NEAR
    
     MOV AX,BONUS1_ORIGINAL_X
     MOV BONUS1_X ,AX
     
     
     MOV AX,BONUS1_ORIGINAL_Y
     MOV BONUS1_Y ,AX
     
    
    
    
    RET
 RES_BONUS1_POS ENDP             
       
COLLISION_BONUS_PLY1 PROC NEAR
     
     ;check the collision with the first player   
          
           
           mov ax,BONUS_Y   ;if the bonusy+bonussize=nety then check the x it may be collinding
           add ax,BONUS_SIZE
           cmp ax,player1_y   
         ; ;;;
           jl GO
          
           mov ax,player1_x    ;if the leftpart of the bonus is geater than the right part then it can't be collisding            
           add ax,player_weidth
           cmp BONUS_X,ax
           jg GO
          
           mov ax,BONUS_X  ;if the right part of the bonus is grater than the left part of then ned after those checks then it collides
           add ax,BONUS_SIZE
           cmp ax,player1_x 
           jl ZZ
           cmp jumpmode,1
           jne ZZo
           mov jumpmode,2
           ZZo:
          mov ax,player1_y
          sub ax,BONUS_SIZE
          mov BONUS_Y,ax  
          mov ax,BONUS_X
          add bl,half_BONUS_size
          mov bh,0
          add ax,bx    ;x coordinate of the center of the bonus    
          INC SCORE_P1
          CALL RES_BONUS_POS
           
           ZZ:
           
           GO:
   RET 
COLLISION_BONUS_PLY1 ENDP 

COLLISION_BONUS_PLY2 PROC NEAR
     
     ;check the collision with the first player   
          
           
           mov ax,BONUS1_Y   ;if the bonusy+bonussize=nety then check the x it may be collinding
           add ax,BONUS1_SIZE
           cmp ax,player2_y   
         ; ;;;
           jl GO1
          
           mov ax,player2_x    ;if the leftpart of the bonus is geater than the right part then it can't be collisding            
           add ax,player_weidth
           cmp BONUS1_X,ax
           jg GO1
          
           mov ax,BONUS1_X  ;if the right part of the bonus is grater than the left part of then ned after those checks then it collides
           add ax,BONUS1_SIZE
           cmp ax,player2_x 
           jl ZZ1
           cmp jumpmode,1
           jne ZZo1
           mov jumpmode,2
           ZZo1:
          mov ax,player2_y
          sub ax,BONUS1_SIZE
          mov BONUS1_Y,ax  
          mov ax,BONUS1_X
          add bl,half_BONUS1_size
          mov bh,0
          add ax,bx    ;x coordinate of the center of the bonus    
          INC SCORE_P2
          CALL RES_BONUS1_POS
           
           ZZ1:
           
           GO1:
   RET 
COLLISION_BONUS_PLY2 ENDP 
DRAW_DANGER PROC NEAR
    
      MOV CX,DANGER_X   ;SET THE INITIAL COLUMN X
      MOV DX, DANGER_Y  ;set the initial ROW
      
      DRAW_DANGER_HORIZONTAL:
      MOV AH,0CH    
      MOV AL,0BH    ; CHOOSE LIGHT CYAN AS A COLOR  
      MOV BH,00H   ; PAGE NO.
      INT 10H
      
      INC CX
      MOV AX,CX        ;CX-DANGER_X > DANGER_SIZE (YES-> WE GO TO THE NEXT LINE, NO->WE CONTINUE TO THE NEXT COLUMN
      SUB AX,DANGER_X
      CMP AX,DANGER_SIZE
      JNG DRAW_DANGER_HORIZONTAL
      
      
      MOV CX,DANGER_X
      INC DX      
      
      MOV AX,DX        ;DX-DANGER_Y > DANGER_SIZE (YES-> WE EXIT THE PROCEDURE, NO->WE CONTINUE TO THE NEXT ROW
      SUB AX,DANGER_Y
      CMP AX,DANGER_SIZE
      JNG DRAW_DANGER_HORIZONTAL
      
      
    
    
    RET 
    DRAW_DANGER ENDP 

DRAW_DANGER1 PROC NEAR
    
      MOV CX,DANGER1_X   ;SET THE INITIAL COLUMN X
      MOV DX, DANGER1_Y  ;set the initial ROW
      
      DRAW_DANGER1_HORIZONTAL:
      MOV AH,0CH    
      MOV AL,0BH    ; CHOOSE LIGHT CYAN AS A COLOR  
      MOV BH,00H   ; PAGE NO.
      INT 10H
      
      INC CX
      MOV AX,CX        ;CX-DANGER_X > DANGER_SIZE (YES-> WE GO TO THE NEXT LINE, NO->WE CONTINUE TO THE NEXT COLUMN
      SUB AX,DANGER1_X
      CMP AX,DANGER1_SIZE
      JNG DRAW_DANGER1_HORIZONTAL
      
      
      MOV CX,DANGER1_X
      INC DX      
      
      MOV AX,DX        ;DX-DANGER_Y > DANGER_SIZE (YES-> WE EXIT THE PROCEDURE, NO->WE CONTINUE TO THE NEXT ROW
      SUB AX,DANGER1_Y
      CMP AX,DANGER1_SIZE
      JNG DRAW_DANGER1_HORIZONTAL
      
      
    
    
    RET 
    DRAW_DANGER1 ENDP 



MOV_DANGER PROC NEAR 
    MOV AX,DANGER_VELOCITY_Y
    ADD DANGER_Y,AX        ; MOVE THE DANGER VERTICALLY 
    
    MOV AX,WINDOW_HEIGHT    
    SUB AX,DANGER_SIZE
    CMP DANGER_Y,AX
    JG  RESET_DANGER_POS          ; DANGER_Y > WINDOW_HEIGHT - DANGER_SIZE  (YES-> COLLIDED)
    
     RET  
 
      RESET_DANGER_POS:
            CALL RES_DANGER_POS
            RET
MOV_DANGER ENDP

               
RES_DANGER_POS PROC NEAR
    
     MOV AX,DANGER_ORIGINAL_X
     MOV DANGER_X ,AX
     
     
     MOV AX,DANGER_ORIGINAL_Y
     MOV DANGER_Y ,AX
         
    RET
RES_DANGER_POS ENDP 
  
  MOV_DANGER1 PROC NEAR 
    MOV AX,DANGER1_VELOCITY_Y
    ADD DANGER1_Y,AX        ; MOVE THE DANGER VERTICALLY 
    
    MOV AX,WINDOW_HEIGHT    
    SUB AX,DANGER1_SIZE
    CMP DANGER1_Y,AX
    JG  RESET_DANGER1_POS          ; DANGER_Y > WINDOW_HEIGHT - DANGER_SIZE  (YES-> COLLIDED)
    
 RET  
 
      RESET_DANGER1_POS:
            CALL RES_DANGER1_POS
            RET
 MOV_DANGER1 ENDP
               
  RES_DANGER1_POS PROC NEAR
    
     MOV AX,DANGER1_ORIGINAL_X
     MOV DANGER1_X ,AX
     
     
     MOV AX,DANGER1_ORIGINAL_Y
     MOV DANGER1_Y ,AX
     
    
    
    
    RET
 RES_DANGER1_POS ENDP             
       
COLLISION_DANGER_PLY1 PROC NEAR
     
     ;check the collision with the first player   
          
           
           mov ax,DANGER_Y   ;if the DANGERy+DANGERsize=nety then check the x it may be collinding
           add ax,DANGER_SIZE
           cmp ax,player1_y   
         ; ;;;
           jl GO2
          
           mov ax,player1_x    ;if the leftpart of the DANGER is geater than the right part then it can't be collisding            
           add ax,player_weidth
           cmp DANGER_X,ax
           jg GO2
          
           mov ax,DANGER_X  ;if the right part of the DANGER is grater than the left part of then ned after those checks then it collides
           add ax,DANGER_SIZE
           cmp ax,player1_x 
           jl ZZ2
           cmp jumpmode,1
           jne ZZo2
           mov jumpmode,2
           ZZo2:
          mov ax,player1_y
          sub ax,DANGER_SIZE
          mov DANGER_Y,ax  
          mov ax,DANGER_X
          add bl,half_DANGER_size
          mov bh,0
          add ax,bx    ;x coordinate of the center of the DANGER    
          DEC SCORE_P1
          
          cmp SCORE_P1,255           ; if the score goes to negative there it resets the score to 0
          jne skippspsps 
            mov score_p1,0
          skippspsps: 
          
          CALL RES_DANGER_POS
           
           ZZ2:
           
           GO2:
   RET 
COLLISION_DANGER_PLY1 ENDP 

COLLISION_DANGER_PLY2 PROC NEAR
     
     ;check the collision with the first player   
          
           
           mov ax,DANGER1_Y   ;if the DANGERy+DANGERsize=nety then check the x it may be collinding
           add ax,DANGER1_SIZE
           cmp ax,player2_y   
         ; ;;;
           jl GO3
          
           mov ax,player2_x    ;if the leftpart of the DANGER is geater than the right part then it can't be collisding            
           add ax,player_weidth
           cmp DANGER1_X,ax
           jg GO3
          
           mov ax,DANGER1_X  ;if the right part of the DANGER is grater than the left part of then ned after those checks then it collides
           add ax,DANGER1_SIZE
           cmp ax,player2_x 
           jl ZZ3
           cmp jumpmode,1
           jne ZZo3
           mov jumpmode,2
           ZZo3:
          mov ax,player2_y
          sub ax,DANGER1_SIZE
          mov DANGER1_Y,ax  
          mov ax,DANGER1_X
          add bl,half_DANGER1_size
          mov bh,0
          add ax,bx    ;x coordinate of the center of the bonus    
          DEC SCORE_P2
         
          cmp SCORE_P2,255
          jne skippspspss 
            mov SCORE_P2,0
          skippspspss:  
          
          CALL RES_DANGER1_POS
           
           ZZ3:
           
           GO3:
   RET 
COLLISION_DANGER_PLY2 ENDP 

               
DRAW_virtual_BALL PROC NEAR 
    
    ; this procedure draws the horizontal axis first then get down line and redraw horizontal line  
        
        MOV CX,BALL_X  ; ENTER THE X COORDINATES TO CX COLOUMN  
        MOV DX,BALL_Y  ; ENTER THE Y COORDINATES TO DY ROW
        
        MOV BX,BALL_SIZE ; the counter for the vertical loop 
        MOV SI,BALL_SIZE ; the counter for horizontal loop 
        
       
        VERTICAL_DRAWING2:
            
        
            HORIZONTAL_DRAWING2:
            
                ;DRWAING A PIXEL 
                MOV AH,0Ch; CONFIGURATION 
                MOV AL,00h; COLOR OF PIXEL
                MOV BH,00h; PAGE NUMBER 
                ;MOV CX,BALL_X;   SET X POSITION 
                ;MOV DX,BALL_Y;   SETTING Y POSITION 
                INT 10H    
                  
                INC CX ; increase the widh 
                DEC SI ; to end the loop
                CMP SI,0  
                
            JNE HORIZONTAL_DRAWING2 
             
            MOV SI,BALL_SIZE  ; reset the horizontal counter
            MOV CX,BALL_X     ; reset the cx position again
            INC DX            ; inc the vertical axis position
            DEC BX            ; decrease the vertical loop 
            
            CMP BX,0
            
        JNE VERTICAL_DRAWING2
      
    
    RET
DRAW_virtual_BALL    ENDP

CLEAR_SCREEN_VIDEO_MOOD proc NEAR
   
      ; /* This code for Redrawing a whole blackground after drawing the ball*/       
             
          ; this procedure draws the horizontal axis first then get down line and redraw horizontal line  
        
        MOV CX,0  ; ENTER THE X COORDINATES TO CX COLOUMN  
        MOV DX,0  ; ENTER THE Y COORDINATES TO DY ROW
        
        MOV BX,200 ; the counter for the vertical loop 
        MOV SI,320 ; the counter for horizontal loop 
        
       
        VERTICAL_DRAWINGscc:
            
        
            HORIZONTAL_DRAWINgscc:
            
                ;DRWAING A PIXEL 
                MOV AH,0Ch; CONFIGURATION 
                MOV AL,00h; COLOR OF PIXEL
                MOV BH,00h; PAGE NUMBER 
                ;MOV CX,BALL_X;   SET X POSITION 
                ;MOV DX,BALL_Y;   SETTING Y POSITION 
                INT 10H    
                  
                INC CX ; increase the widh 
                DEC SI ; to end the loop
                CMP SI,0  
                
            JNE HORIZONTAL_DRAWINGscc 
             
            MOV SI,320  ; reset the horizontal counter
            MOV CX,0    ; reset the cx position again
            INC DX            ; inc the vertical axis position
            DEC BX            ; decrease the vertical loop 
            
            CMP BX,0
            
        JNE VERTICAL_DRAWINGscc
     
     RET
CLEAR_SCREEN_VIDEO_MOOD ENDP   
    
DRAW_NET  PROC NEAR
     
    push ax
    push bx
    push cx
    push dx  
    push bp
    push si
    mov cx,net_x
    mov dx,net_y
    
    mov ah,0ch
    mov al,0fh
    mov bh,0h
    mov bp,net_weidth
    add bp,net_x
    inc bp
    ; si,net_height
    ;add si,net_y
    ;inc si
    drawnetony:
    drawnetonx:
    int 10h
    inc cx
    cmp cx,bp
    jne drawnetonx
    mov cx,net_x
    inc dx
    cmp dx,window_height
    jne drawnetony
    pop si
    pop bp 
    pop dx
    pop cx
    pop bx
    pop ax
ret        

DRAW_NET ENDP 

DRAW_PLAYER1 PROC NEAR  
    push ax
    push bx
    push cx
    push dx  
    push bp
    push si
    mov cx,player1_x
    mov dx,player1_y
    LEA DI,MARIO
    
    mov ah,0ch
    ;mov al,0fh
    mov bh,0h
    mov bp,player_weidth
    add bp,player1_x
    inc bp
    mov si,player_height 
    add si,player1_y     
    inc si
    drawplayer1ony:
    drawplayer1onx:
    MOV AL,[DI]
    INC DI
    int 10h
    inc cx
    cmp cx,bp
    jne drawplayer1onx
    mov cx,player1_x
    inc dx
    cmp dx,si
    jne drawplayer1ony
    pop si
    pop bp 
    pop dx
    pop cx
    pop bx
    pop ax

RET
      
DRAW_PLAYER1   ENDP


DRAW_PLAYER2 PROC NEAR 
    push ax
    push bx
    push cx
    push dx  
    push bp
    push si
    mov cx,player2_x
    mov dx,player2_y
    lea di,mario2
    mov ah,0ch
    ;mov al,0fh
    mov bh,0h
    mov bp,player_weidth
    add bp,player2_x
    inc bp
    mov si,player_height
    add si,player2_y
    inc si
    drawplayer2ony:
    drawplayer2onx:
    MOV AL,[DI]
    INC DI
    int 10h
    inc cx
    cmp cx,bp
    jne drawplayer2onx
    mov cx,player2_x
    inc dx
    cmp dx,si
    jne drawplayer2ony
    pop si
    pop bp 
    pop dx
    pop cx
    pop bx
    pop ax
    
    RET
      
DRAW_PLAYER2   ENDP

DRAW_CLOUD1 PROC NEAR 
    push ax
    push bx
    push cx
    push dx  
    push bp
    push si
    mov cx,CLOUD1_X
    mov dx,CLOUD1_Y
    lea di,CLOUD
    mov ah,0ch
    ;mov al,0fh
    mov bh,0h
    mov bp,player_weidth
    add bp,CLOUD1_X
    inc bp
    mov si,player_height
    add si,CLOUD1_Y
    inc si
    drawCLOUD1ony:
    drawCLOUD1onx:
    MOV AL,[DI]
    INC DI
    int 10h
    inc cx
    cmp cx,bp
    jne drawCLOUD1onx
    mov cx,CLOUD1_X
    inc dx
    cmp dx,si
    jne drawCLOUD1ony
    pop si
    pop bp 
    pop dx
    pop cx
    pop bx
    pop ax
    
    RET
      
DRAW_CLOUD1   ENDP  


DRAW_CLOUD2 PROC NEAR 
    push ax
    push bx
    push cx
    push dx  
    push bp
    push si
    mov cx,CLOUD2_X
    mov dx,CLOUD2_Y
    lea di,CLOUD
    mov ah,0ch
    ;mov al,0fh
    mov bh,0h
    mov bp,21
    add bp,CLOUD2_X
    inc bp
    mov si,15
    add si,CLOUD2_Y
    inc si
    drawCLOUD2ony:
    drawCLOUD2onx:
    MOV AL,[DI]
    INC DI
    int 10h
    inc cx
    cmp cx,bp
    jne drawCLOUD2onx
    mov cx,CLOUD2_X
    inc dx
    cmp dx,si
    jne drawCLOUD2ony
    pop si
    pop bp 
    pop dx
    pop cx
    pop bx
    pop ax
    
    RET
      
DRAW_CLOUD2   ENDP
 
DRAW_CLOUD3 PROC NEAR 
    push ax
    push bx
    push cx
    push dx  
    push bp
    push si
    mov cx,CLOUD3_X
    mov dx,CLOUD3_Y
    lea di,CLOUD
    mov ah,0ch
    ;mov al,0fh
    mov bh,0h
    mov bp,21
    add bp,CLOUD3_X
    inc bp
    mov si,15
    add si,CLOUD3_Y
    inc si
    drawCLOUD3ony:
    drawCLOUD3onx:
    MOV AL,[DI]
    INC DI
    int 10h
    inc cx
    cmp cx,bp
    jne drawCLOUD3onx
    mov cx,CLOUD3_X
    inc dx
    cmp dx,si
    jne drawCLOUD3ony
    pop si
    pop bp 
    pop dx
    pop cx
    pop bx
    pop ax
    
    RET
      
DRAW_CLOUD3   ENDP  

DRAW_CLOUD4 PROC NEAR 
    push ax
    push bx
    push cx
    push dx  
    push bp
    push si
    mov cx,CLOUD4_X
    mov dx,CLOUD4_Y
    lea di,CLOUD
    mov ah,0ch
    ;mov al,0fh
    mov bh,0h
    mov bp,21
    add bp,CLOUD4_X
    inc bp
    mov si,15
    add si,CLOUD4_Y
    inc si
    drawCLOUD4ony:
    drawCLOUD4onx:
    MOV AL,[DI]
    INC DI
    int 10h
    inc cx
    cmp cx,bp
    jne drawCLOUD4onx
    mov cx,CLOUD4_X
    inc dx
    cmp dx,si
    jne drawCLOUD4ony
    pop si
    pop bp 
    pop dx
    pop cx
    pop bx
    pop ax
    
    RET
      
DRAW_CLOUD4   ENDP 



GAME_MENU PROC NEAR
    
    
    MOV AX,03h ;
    INT 16     ; TEXT MOOD 

                                       ;game menu screen
    MOV AH,9H
    MOV DH,0
    LEA DX,MAIN_MENU
    INT 21h
                                           ;wait for input
    START_CHECK:
        MOV AH,0 ; 
        INT 16H
        
        CMP AL,13D ; ENTER ASCI 
        JNE NOTENTER
        
        ;CALL CLEAR_SCREEN_VIDEO_MOOD    ; IF CLICKER ENTER ... SO ENTER THE VIDEO MOOD 
        RET
         
        NOTENTER:
         CMP AL,32D ; ENTER ASCI 
        JNE NOTSPACE
        
        MOV LEVEL,1 
        ;CALL CLEAR_SCREEN_VIDEO_MOOD    ; IF CLICKER ENTER ... SO ENTER THE VIDEO MOOD 
        RET
         
        NOTSPACE:
        
        CMP AL,27    ; IF PRESSED ESC EXIT THE PROGRAM
        JE OUTLOOP
        
        CMP AL,67    ; IF PRESSED C GO TO CHAT ROOM 
        JNE SKIP_CHAT
        
        CALL CHAT_ROOM
        RET
        
        SKIP_CHAT:
        JNE START_CHECK
        
        OUTLOOP:  
        
        MOV DL,1
        MOV EXIT_CHECKER,DL
        RET

GAME_MENU ENDP

CHAT_ROOM PROC NEAR 
    
     MOV AX,03h ;
    INT 16     ; TEXT MOOD
    
   
    
                    MOV DX,3FBH      ;LINE CONTROL REGISTER
				    MOV AL,10000000B ;SET DIVISOR LATCH EXCESS BIT
				    OUT DX,AL
				    
				    MOV DX,3F8H
				    MOV AL,0CH
				    OUT DX,AL
				    
				    MOV DX,3F9H
				    MOV AL,00H
				    OUT DX,AL
				    
				    MOV DX,3FBH
				    MOV AL,00011011B
				    OUT DX,AL
				    
				    MOV AH,6
				    MOV AL,0
				    MOV BH,4FH       ;COLOR:BG RED AND TEXT WHITE
				    MOV CH,0         ;UPPER LEFT Y
				    MOV CL,0         ;UPPER LEFT X
				    MOV DH,12        ;LOWER RIGHT Y
				    MOV DL,79        ;LOWER RIGHT X
				    INT 10H  
				    
    MOV AH,09H
    LEA DX,PLAYER_NAME_STRING1
    INT 21H
    
      
    MOV AH,2
    MOV DL,':'
    INT 21H
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    

    
    ; END UPPER HALF OF CHAT BOX 
				    
				
				    MOV AH,6
				    MOV AL,0
				    MOV BH,0F4H       ;COLOR:BG WHITE AND TEXT RED
				    MOV CH,12         ;UPPER LEFT Y
				    MOV CL,0          ;UPPER LEFT X
				    MOV DH,24         ;LOWER RIGHT Y
				    MOV DL,79         ;LOWER RIGHT X
				    INT 10H 
				    
				    
	
    
                    MOV AH,2       
				    MOV DL,0 
				    MOV DH,12
				    MOV BH,0
				    INT 10H

    
    ; START OF LOWER HALF OF CHAT BOX 
    
   
    MOV AH,09H
    LEA DX,PLAYER_NAME_STRING2
    INT 21H
    
      
    MOV AH,2
    MOV DL,':'
    INT 21H
    
    MOV AH,2
    MOV DL,' '
    INT 21H  
    
				    
				    SEND_LOOP:
				    MOV AH,1         ;IF KEY IS PRESSED
				    INT 16H
				    JNZ DISPLAY 
				    JNZ DO
				    JMP  RECEIVE_LOOP
				    DO:
				    DISPLAY:
				    CMP AL,36        ;ASCII OF HOME 
				    JNZ DONTDO
				    JMP EXIT1 
				    DONTDO:
				    
				    CMP AL,13      ;ASCII OF ENTER      
				    jnz donot5
				    Jmp INC_SENDY
				    donot5:
				    CMP AL,8       ;ASCII OF BACKSPACE
				    JZ BACK
				   
				    MOV SEND_VAL,AL 
				     
				    ;MOVE THE CURSOR
				    MOV_CURSOR:
				    MOV AH,2       
				    MOV DL,SEND_X 
				    MOV DH,SEND_Y
				    MOV BH,0
				    INT 10H
				    
				    ;DISPLAY A LETTER A NO. OF TIMES WITH A CERTAIN COLOR
				    MOV AH,9
				    MOV BH,0
				    MOV BL,4FH      ;COLOR
				    MOV AL,SEND_VAL
				    MOV CX,1        ; NO OF TIMES TO DISPLAY THE LETTER
				    INT 10H
				    
				    ;GET KEY PRESSED(WAIT)
				    MOV AH,0
				    INT 16H 
				    
				    INC SEND_X
				    CMP SEND_X,79   ; IF X REACH IT'S MAX. IT GOES A NEW LINE BY INC Y
				    JE  INC_SENDY
				    JNE NO_INC_SENDY 
				    
				    SCROLL:
				    MOV AH,6
				    MOV AL,1
				    MOV BH,4FH       ;COLOR:BG RED AND TEXT WHITE
				    MOV CH,0         ;UPPER LEFT Y
				    MOV CL,0         ;UPPER LEFT X
				    MOV DH,11        ;LOWER RIGHT Y
				    MOV DL,79        ;LOWER RIGHT X
				    INT 10H
				    DEC SEND_Y
				    JMP DISPLAY               
				    
				    BACK:
				     
				    DEC SEND_X 
				    MOV AH,2       
				    MOV DL,SEND_X 
				    MOV DH,SEND_Y
				    MOV BH,0
				    INT 10H     
				    MOV AH,9
				    MOV BH,0
				    MOV BL,4FH      ;COLOR
				    MOV AL,32
				    MOV CX,1        ; NO OF TIMES TO DISPLAY THE LETTER
				    INT 10H 
				    DEC SEND_x 
				    MOV AH,2       
				    MOV DL,SEND_X 
				    MOV DH,SEND_Y
				    MOV BH,0
				    INT 10H 
				    JMP DISPLAY
				    
				    
				    INC_SENDY:
				    INC SEND_Y
				    MOV SEND_X,0      
				    ;MOV AH,1
				    ;INT 16H
				    ;MOV SEND_VAL,32
				    mov dl,0DH
				    mov dl,0AH
				    INT 21H
				    CMP SEND_Y,11
				    JZ  SCROLL
				    JMP DISPLAY
				         
				     
				    
				    NO_INC_SENDY:
				    JMP AGAIN1
				    
				    AGAIN1:
				    MOV DX,3FDH      ;LINE STATUS REGISTER
				    IN AL,DX         ;READ LINE STATUS
				    TEST AL,00100000B
				    JZ RECEIVE_LOOP  ;NOT EMPTY 
				    
				    ;IF EMPTY PUT THE VALUE IN TRANSMIT DATA REGISTER
				    MOV DX,3F8H      ;TRANSMIT DATA REGISTER
				    MOV AL,SEND_VAL
				    OUT DX,AL
				    JMP SEND_LOOP 
				    
				    ; SCROLL:
				    
				    RECEIVE_LOOP:
				    ;CHECK THE DATA IS READY
				    MOV DX,3FDH      ;LINE STATUS REGISTER 
				    
				    CHECK:
				    IN AL,DX
				    TEST AL,1
				    JNZ DO1
				    JMP SEND_LOOP    ;NOT READY
				    DO1:
				    ;IF READY READ THE VALUE IN RECEIVE DATA REGISTER
				    MOV DX ,03F8H
				    IN AL,DX 
				    
				    CMP AL,8         ;ASCII OF BACKSPACE
				    JZ BACK1
				    
				    CMP AL,36        ;ASCII OF HOME 
				    JMP EXIT1
				     
				    
				    CMP AL,13      ;ASCII OF ENTER
				    JZ INC_RECEIVEY
				  
				    MOV RECEIVE_VAL,AL
				    
				    
				    ;MOVE THE CURSOR 
				    MOV_CURSOR2:
				    MOV AH,2       
				    MOV DL,RECEIVE_X 
				    MOV DH,RECEIVE_Y
				    MOV BH,0
				    INT 10H 
				    
				    
				    ;DISPLAY A LETTER A NO. OF TIMES WITH A CERTAIN COLOR
				    MOV AH,9
				    MOV BH,0
				    MOV BL,0F4H      ;COLOR
				    MOV AL,RECEIVE_VAL
				    MOV CX,1         ; NO OF TIMES TO DISPLAY THE LETTER
				    INT 10H          
				    
				    INC RECEIVE_X
				    CMP RECEIVE_X,79
				    JE  INC_RECEIVEY
				    JNE NO_INC_RECEIVEY  
				    
				    SCROLL1:
				    MOV AH,6
				    MOV AL,1
				    MOV BH,0F4H       ;COLOR:BG WHITE AND TEXT RED
				    MOV CH,12         ;UPPER LEFT Y
				    MOV CL,0          ;UPPER LEFT X
				    MOV DH,23         ;LOWER RIGHT Y
				    MOV DL,79         ;LOWER RIGHT X
				    INT 10H
				    DEC RECEIVE_Y
				    JMP DO1
				   
				    
				     BACK1:
				     
				    DEC RECEIVE_X 
				    MOV AH,2       
				    MOV DL,RECEIVE_X 
				    MOV DH,RECEIVE_Y
				    MOV BH,0
				    INT 10H     
				    MOV AH,9
				    MOV BH,0
				    MOV BL,0F4H      ;COLOR
				    MOV AL,32
				    MOV CX,1        ; NO OF TIMES TO DISPLAY THE LETTER
				    INT 10H 
				    DEC RECEIVE_X 
				    MOV AH,2       
				    MOV DL,RECEIVE_X 
				    MOV DH,RECEIVE_Y
				    MOV BH,0
				    INT 10H 
				    JMP DO1
				   
				    INC_RECEIVEY:
				    INC RECEIVE_Y
				    MOV RECEIVE_X,0 
				    ;MOV AH,1
				    ;INT 16H
				    ;MOV RECEIVE_VAL,32
				    mov dl,0DH
				    mov dl,0AH
				    INT 21H
				    CMP RECEIVE_Y,23
				    JZ SCROLL1
				    JMP DO1     
				    
				    
				    
				    NO_INC_RECEIVEY:
				    JMP SEND_LOOP
				    
				    EXIT1:
				    call GAME_MENU
   
    
    RET
CHAT_ROOM ENDP  



getinput_master proc near
  
        mov ah,1
        int 16h
        jnz IsUp 
        mov VALUE_TO_SEND,0
        ret
                   
IsUp: cmp ah,72 
      jnz IsLeft
      mov VALUE_TO_SEND,ah
      call send
      mov ah,0
      int 16h
      cmp jumpmode,0
      je oktojmp
      ret
      oktojmp: 
      mov ax,1
      mov jumpmode,ax
      ret          
IsLeft:cmp ah,75
      jnz IsRight
      mov VALUE_TO_SEND,ah
      call send
      mov ah,0
      int 16h 
      mov ax,player1_x 
      cmp ax,0
      jne hasntreachthelftwall
      ret
      hasntreachthelftwall:
      mov cx,iscollidingfromxaxis
      cmp cx,0
      jne dontmove
      dec ax
      mov player1_x,ax
       call checkcollwithfplx1 
       dontmove:
      ret
IsRight:cmp ah,77
      jnz isesc 
      mov VALUE_TO_SEND,ah
      call send
      mov ah,0
      int 16h
      mov ax,player1_x
      mov bx,player1_x
      add bx,player_weidth
      add bx,1
      cmp bx,net_x
      jne hasntreachthenet
      ret
      hasntreachthenet:
      mov cx,iscollidingfromxaxis
       cmp cx,0
      jne dontmove2
      inc ax
      mov player1_x,ax
     call  checkcollwithfplx1
      dontmove2:
      ret        
     
                 
isesc:
        CMP Ah,01    ; IF PRESSED ESC EXIT THE PROGRAM      
        JNE  strangekey
        mov VALUE_TO_SEND,ah
        call send   
        mov ah,0
        int 16h
        MOV DL,1
        MOV EXIT_CHECKER,DL
        
 strangekey:
 mov VALUE_TO_SEND,0
 mov ah,0
 int 16h       
        RET       

        
getinput_master endp  



 getotherplayerinput_master proc near
               call receive
          mov ah,value_to_receive
          cmp ah,0
          je nothingrecooa 
    
 IsUp2a: cmp ah,72 
      jnz IsLeft2a

      cmp jumpmode2,0
      je oktojmppa
      ret
      oktojmppa: 
      mov ax,1
      mov jumpmode2,ax
      ret          
IsLeft2a:cmp ah,75
      jnz IsRight2a

      mov ax,net_x
      add ax,net_weidth
      add ax,1 
      cmp ax,player2_x
      jne hasntreachthelftwallla
      ret
      hasntreachthelftwallla:
      mov cx,iscollidingfromxaxis2
      cmp cx,0
      jne dontmoveea
      mov ax,player2_x
      dec ax
      mov player2_x,ax
       call checkcollwithfplx2 
       dontmoveea:
      ret
IsRight2a:cmp ah,77
      jnz isesca
      mov ax,player2_x
      mov bx,player2_x
      add bx,player_weidth
      cmp bx,window_width
      jne hasntreachthenetta
      ret
      hasntreachthenetta:
      mov cx,iscollidingfromxaxis2
       cmp cx,0
      jne dontmove22a
      inc ax
      mov player2_x,ax
     call  checkcollwithfplx2
      dontmove22a:
      ret     
                 
isesca:
        CMP AL,27    ; IF PRESSED ESC EXIT THE PROGRAM      
        JNE strangekeya   
        MOV DL,1
        MOV EXIT_CHECKER,DL
        
       
        RET       
strangekeya:
 mov VALUE_TO_SEND,0

 nothingrecooa:       
        RET 
      
getotherplayerinput_master endp 
 
 
 
 getinput_slave proc near
  
           call receive
          mov ah,value_to_receive
          cmp ah,0
          je nothingrecoo
                   
IsUpoo: cmp ah,72 
      jnz IsLeftoo
      cmp jumpmode,0
      je oktojmpoo
      ret
      oktojmpoo: 
      mov ax,1
      mov jumpmode,ax
      ret          
IsLeftoo:cmp ah,75
      jnz IsRightoo

      mov ax,player1_x 
      cmp ax,0
      jne hasntreachthelftwalloo
      ret
      hasntreachthelftwalloo:
      mov cx,iscollidingfromxaxis
      cmp cx,0
      jne dontmoveoo
      dec ax
      mov player1_x,ax
       call checkcollwithfplx1 
       dontmoveoo:
      ret
IsRightoo:cmp ah,77
      jnz isescoo 

      mov ax,player1_x
      mov bx,player1_x
      add bx,player_weidth
      add bx,1
      cmp bx,net_x
      jne hasntreachthenetoo
      ret
      hasntreachthenetoo:
      mov cx,iscollidingfromxaxis
       cmp cx,0
      jne dontmove2oo
      inc ax
      mov player1_x,ax
     call  checkcollwithfplx1
      dontmove2oo:
      ret        
     
                 
isescoo:
        CMP Ah,01    ; IF PRESSED ESC EXIT THE PROGRAM      
        JNE  strangekeyoo
        MOV DL,1
        MOV EXIT_CHECKER,DL
        
 strangekeyoo:
 mov VALUE_TO_SEND,0

 nothingrecoo:       
        RET       

        
getinput_slave endp  



 getotherplayerinput_slave proc near 
          mov ah,1
        int 16h
        jnz IsUp2oo 
        mov VALUE_TO_SEND,0
        ret
 IsUp2oo: cmp ah,72 
      jnz IsLeft2oo  
      mov VALUE_TO_SEND,ah
      call send
      mov ah,0
      int 16h
      cmp jumpmode2,0
      je oktojmppoo
      ret
      oktojmppoo: 
      mov ax,1
      mov jumpmode2,ax
      ret          
IsLeft2oo:cmp ah,75
      jnz IsRight2oo
      mov VALUE_TO_SEND,ah
      call send
      mov ah,0
      int 16h
      mov ax,net_x
      add ax,net_weidth
      add ax,1 
      cmp ax,player2_x
      jne hasntreachthelftwallloo
      ret
      hasntreachthelftwallloo:
      mov cx,iscollidingfromxaxis2
      cmp cx,0
      jne dontmoveeoo
      mov ax,player2_x
      dec ax
      mov player2_x,ax
       call checkcollwithfplx2 
       dontmoveeoo:
      ret
IsRight2oo:cmp ah,77
      jnz isesccoo 
      mov VALUE_TO_SEND,ah
      call send
      mov ah,0
      int 16h
      mov ax,player2_x
      mov bx,player2_x
      add bx,player_weidth
      cmp bx,window_width
      jne hasntreachthenettoo
      ret
      hasntreachthenettoo:
      mov cx,iscollidingfromxaxis2
       cmp cx,0
      jne dontmove22oo
      inc ax
      mov player2_x,ax
     call  checkcollwithfplx2
      dontmove22oo:
      ret 
      isesccoo:
        CMP Ah,01    ; IF PRESSED ESC EXIT THE PROGRAM      
        JNE nothingreccccc  
      mov VALUE_TO_SEND,ah
      call send
      mov ah,0
      int 16h
        MOV DL,1
        MOV EXIT_CHECKER,DL 
        ret
 
     nothingreccccc:
ret
      
getotherplayerinput_slave endp
  
 

checkjumpmode proc near
mov ax,jumpmode
cmp ax,0
jne isupp
ret
isupp:
cmp ax,1
jne isdownn
mov ax,player1_y
cmp ax,jumplimit
jne hasntreachedlimit
mov bx,2
mov jumpmode,bx
ret
hasntreachedlimit:
dec ax
mov player1_y,ax
call checkcollwithfply
ret

isdownn:
cmp ax,2
jne ending
mov ax,player1_y
cmp ax,player1_yinit
jne hasntreachedground
mov bx, 0
mov jumpmode,bx
ret
hasntreachedground:
inc ax
mov player1_y,ax
call checkcollwithfply
ending: ret
   
checkjumpmode endp 

checkjumpmode2 proc near
mov ax,jumpmode2
cmp ax,0
jne isupo
ret
isupo:
cmp ax,1
jne isdowno
mov ax,player2_y
cmp ax,jumplimit
jne hasntreachedlimito
mov bx,2
mov jumpmode2,bx
ret
hasntreachedlimito:
dec ax
mov player2_y,ax
call checkcollwithfply2
ret

isdowno:
cmp ax,2
jne endingo
mov ax,player2_y
cmp ax,player1_yinit
jne hasntreachedgroundo
mov bx, 0
mov jumpmode2,bx
ret
hasntreachedgroundo:
inc ax
mov player2_y,ax
call checkcollwithfply2
endingo: ret
   
checkjumpmode2 endp




checkcollwithfply proc near
    ;check the collision with the first player   
          
           
           mov ax,ball_y   ;if the bally+ballsize=nety then check the x it may be collinding
           add ax,ball_size
           cmp ax,player1_y   
         ; ;;;
           jl continue4
          
           mov ax,player1_x    ;if the leftpart of the ballis geater than the right part then it can't be collisding            
           add ax,player_weidth
           cmp ball_x,ax
           jg continue4
          
           mov ax,ball_x  ;if the right part of the ball is grater than the left part of then ned after those checks then it collides
           add ax,ball_size
           cmp ax,player1_x 
           jl z
           cmp jumpmode,1
           jne zo
           mov jumpmode,2
           zo:
          mov ax,player1_y
          sub ax,ball_size
          mov ball_y,ax  
          mov ax,ball_x
          add bl,half_ball_size
          mov bh,0
          add ax,bx    ;x coordinate of the center of the ball 
          
          isrightpaddle:
          mov bx,player1_x
          add bx,twothird_player_weidth
          cmp ax,bx
          jl ismidpaddle 
         call rightpaddlecollision
         ret
          ismidpaddle:
          mov bx,player1_x
          mov cl,third_player_weidth
          mov ch,0
          add bx,cx
          cmp ax,bx 
          jl isleftpaddle
          call  REVERSE_VELOCITY_Y
          ret
          isleftpaddle:
          call leftpaddlecollision
           
           z:
           
           continue4:
           ret 
 checkcollwithfply endp


  checkcollwithfplx1 proc near
           mov ax,ball_x     
           add ax,ball_size
           cmp ax,player1_x     ;if ballx(the left side of the ball)=netx-ballsize then check the net height it may be colliding it from the right
           je checkyforcol 
                             
           mov ax,player1_x       ;if net weidth+netx=ballx then check the height it may be colliding from the right 
           add ax,player_weidth
           cmp ball_x,ax
           jne continuethree
          
           checkyforcol:
           mov ax,ball_y
           add ax,ball_size  
           cmp ax,player1_y
           jl continuethree
          mov iscollidingfromxaxis,1        ; if it is less then the height then it is not colliding
          call REVERSE_VELOCITY_X
           continuethree:
           ret
checkcollwithfplx1 endp  

 
 
  
  checkcollwithfply2 proc near
    ;check the collision with the first player   
          
           
           mov ax,ball_y   ;if the bally+ballsize=nety then check the x it may be collinding
           add ax,ball_size
           cmp ax,player2_y   
         ; ;;;
           jl continue4o
          
           mov ax,player2_x    ;if the leftpart of the ballis geater than the right part then it can't be collisding            
           add ax,player_weidth
           cmp ball_x,ax
           jg continue4o
          
           mov ax,ball_x  ;if the right part of the ball is grater than the left part of then ned after those checks then it collides
           add ax,ball_size
           cmp ax,player2_x 
           jl zooo
           cmp jumpmode2,1
           jne zoo
           mov jumpmode2,2
           zoo:
           mov ax,player2_y
          sub ax,ball_size
          mov ball_y,ax 
          
          mov ax,ball_x
          add bl,half_ball_size
          mov bh,0
          add ax,bx    ;x coordinate of the center of the ball 
          
          isrightpaddlee:
          mov bx,player2_x
          add bx,twothird_player_weidth
          cmp ax,bx
          jl ismidpaddlee 
         call rightpaddlecollision
         ret
          ismidpaddlee:
          mov bx,player2_x
          mov cl,third_player_weidth
          mov ch,0
          add bx,cx
          cmp ax,bx 
          jl isleftpaddlee
          call  REVERSE_VELOCITY_Y
          ret
          isleftpaddlee:
          call leftpaddlecollision
           zooo:
           
           continue4o:
           ret 
 checkcollwithfply2 endp


  checkcollwithfplx2 proc near
           mov ax,ball_x     
           add ax,ball_size
           cmp ax,player2_x     ;if ballx(the left side of the ball)=netx-ballsize then check the net height it may be colliding it from the right
           je checkyforcolo 
                             
           mov ax,player2_x       ;if net weidth+netx=ballx then check the height it may be colliding from the right 
           add ax,player_weidth
           cmp ball_x,ax
           jne continuethreeo
          
           checkyforcolo:
           mov ax,ball_y
           add ax,ball_size  
           cmp ax,player2_y
           jl continuethreeo
          mov iscollidingfromxaxis2,1        ; if it is less then the height then it is not colliding
          call REVERSE_VELOCITY_X
           continuethreeo:
           ret
checkcollwithfplx2 endp  


enter_temp_player_name proc near

REWRITE22:
   
    MOV AX,03h ;
    INT 16     ; TEXT MOOD
    
    MOV AH,9H
    MOV DH,0
    LEA DX,PLAYER_NAME_MENU1
    INT 21h
    
    LEA DX,HALF_SPACE 
    INT 21H
    


MOV SI,0
LEA SI,PLAYER_NAME_STRING_temp ; IF CLIKED BACKSPACE START AGAIN



 
MOV CX,PLAYER_NAME_SIZE
LOOP12:

MOV AH,1  ; TAKE A CHARACTER 
INT 21H

CMP AL,13 ; ENTER CHECK
JE SKIP22
CMP AL,8  ; BACKSAPCE CHECK
JE REWRITE22 

MOV [SI],AL   ; ASSIGN CHAR VALUE TO SI
INC SI        

LOOP LOOP12                                    

SKIP22:

MOV AL,'$'    ; PUT THE END OF STRING
MOV [SI],AL  
ret
enter_temp_player_name endp 


ENTER_PLAYER_NAME PROC NEAR
    
REWRITE:
   
    MOV AX,03h ;
    INT 16     ; TEXT MOOD
    
    MOV AH,9H
    MOV DH,0
    LEA DX,PLAYER_NAME_MENU1
    INT 21h
    
    LEA DX,HALF_SPACE 
    INT 21H
    


MOV SI,0
LEA SI,PLAYER_NAME_STRING1 ; IF CLIKED BACKSPACE START AGAIN



 
MOV CX,PLAYER_NAME_SIZE
LOOP1:

MOV AH,1  ; TAKE A CHARACTER 
INT 21H

CMP AL,13 ; ENTER CHECK
JE SKIP
CMP AL,8  ; BACKSAPCE CHECK
JE REWRITE 

MOV [SI],AL   ; ASSIGN CHAR VALUE TO SI
INC SI        

LOOP LOOP1                                    

SKIP:

MOV AL,'$'    ; PUT THE END OF STRING
MOV [SI],AL

; PLAYER 2 WRITE NAME
;-------------------------------------------


MOV SI,0
LEA SI,PLAYER_NAME_STRING2 ; IF CLIKED BACKSPACE START AGAIN

    MOV AH,9H
    MOV DH,0
    LEA DX,PLAYER_NAME_MENU2
    INT 21h
    
    LEA DX,HALF_SPACE 
    INT 21H

 
MOV CX,PLAYER_NAME_SIZE
LOOP2:

MOV AH,1  ; TAKE A CHARACTER 
INT 21H

CMP AL,13 ; ENTER CHECK
JE SKIP222
CMP AL,8  ; BACKSAPCE CHECK
JE REWRITE 

MOV [SI],AL   ; ASSIGN CHAR VALUE TO SI
INC SI        

LOOP LOOP2                                    

SKIP222:

MOV AL,'$'    ; PUT THE END OF STRING
MOV [SI],AL

;MOV AH,9

;LEA DX , NEW_LINE 
;INT 21H 

;LEA DX,PLAYER_NAME_STRING
 
;INT 21H

RET
ENTER_PLAYER_NAME ENDP

EXIT_CHECK PROC NEAR
    
        PUSH AX 
        XOR AX,AX
        MOV AH,1  ;  WAIT FOR A KEY
        INT 16H
        
        CMP AL,27D    ; IF PRESSED ESC EXIT THE PROGRAM
        
        ;JNE NOTHING_HAPPENS   
        
        MOV DL,1
        MOV EXIT_CHECKER,DL
        
        RET 
        
        ;NOTHING_HAPPENS:
        
        POP AX 
        
        RET
 
    
EXIT_CHECK ENDP 


CHANGING_SCORE_P1_TO_STRING PROC NEAR 
        

LEA SI,SCORE_P1_STRING

MOV AL,SCORE_P1

xor ah,ah ; clearing ah 
push bx                 ;; reserving bx and cx for later use by pushing stack
push cx

mov bx, 10                       ;; storing 2 digits number as character in string
xor cx, cx
division: xor dx,dx ; without it divison goes wrong     ; clearing value of dx  
div bx   ; AX = AX / BX ..... dx = reminder 
push dx  ; pushing the Rimender 
inc cx
cmp ax, 0
jne division  ; if Ax not equal zero divid again and push the Reminder again
store: pop dx 
add dl, 48    ; converting the number to a char
mov [si], dl  ; storing in the string variable 
inc si
loop store
mov [si], '$ ' 

pop cx
pop bx
RET

CHANGING_SCORE_P1_TO_STRING ENDP
                               
                               
CHANGING_SCORE_P2_TO_STRING PROC NEAR 
    

LEA SI, SCORE_P2_STRING

MOV AL,SCORE_P2

xor ah,ah ; clearing ah 
push bx                 ;; reserving bx and cx for later use by pushing stack
push cx

mov bx, 10                       ;; storing 2 digits number as character in string
xor cx, cx
division2: xor dx,dx ; without it divison goes wrong     ; clearing value of dx  
div bx   ; AX = AX / BX ..... dx = reminder 
push dx  ; pushing the Rimender 
inc cx
cmp ax, 0
jne division2  ; if Ax not equal zero divid again and push the Reminder again
store2: pop dx 
add dl, 48    ; converting the number to a char
mov [si], dl  ; storing in the string variable 
inc si
loop store2
mov [si], '$ '  

pop cx
pop bx



RET

CHANGING_SCORE_P2_TO_STRING ENDP

FINISHED_GAME PROC NEAR  
     
    MOV AX,ROUND_NUMBER
            
    CMP AX,MAX_ROUND_NUMBER ; IF ROUND NUMBER LESS THAN FINAL ROUND -> MAKE NOTHING
    JLE NO_CHANGE           ; IF ROUND NUMBER GREATER THAN 10 -> END THE GAME 
                            ; AND CHANGE TO TEXT MOOD TO DISPLAY THE RESULT 
    
    MOV AX,1
    MOV IS_FINISHED,AX
    
    NO_CHANGE:
    
    RET
    
FINISHED_GAME ENDP  


SHOW_RESULT PROC NEAR 
    
    MOV AX,03h ;
    INT 16     ; TEXT MOOD 
    
    MOV AH,9H
    MOV DH,0
    LEA DX,RESULT_MENU_1
    INT 21h
    
    
    
    
    CALL CHANGING_SCORE_P1_TO_STRING ; CHANGES SCORE P1 NUMBER INTO STRING CAN BE DISPLAYED 
    MOV AH,9
    LEA DX,SCORE_P1_STRING  
    INT 21H
    
    MOV AH,2
    MOV DL,':'
    INT 21H
    
    CALL CHANGING_SCORE_P2_TO_STRING ; CHANGES SCORE P1 NUMBER INTO STRING CAN BE DISPLAYED
    MOV AH,9
    LEA DX,SCORE_P2_STRING ; SCOR
    INT 21H  
    
    LEA DX ,HALF_SPACE 
    INT 21H
    
    LEA DX,RESULT_MENU_2
    INT 21 
    
    ; COMPARIGN RESULTS 
    MOV AL,SCORE_P1
    CMP AL,SCORE_P2 ; COMPARING PLAYER 1 RESULT TO PLAYER 2
    
    JG WINNER_PLAYER1
    
    ; SHOWS THAT PLAYER 2 IS THE WINNER 
    
    MOV AH,9H
    LEA DX,P2W 
    INT 21H
    LEA DX,SMALL_SPACE
    INT 21H
    LEA DX,PN
    INT 21H
    LEA DX,PLAYER_NAME_STRING2
    INT 21H
    
    LEA DX,RESULT_MENU_3
    INT 21H
    
    LEA DX,RESULT_MENU_4
    INT 21H
    RET
    
    WINNER_PLAYER1: ; SHOW THAT PLYAER 1 IS THE WINNER 
    MOV AH,9H
    LEA DX,P1W
    INT 21H
    LEA DX,SMALL_SPACE
    INT 21H
    LEA DX,PN
    INT 21H
    LEA DX,PLAYER_NAME_STRING1
    INT 21H
    LEA DX,RESULT_MENU_3
    INT 21H
    LEA DX,RESULT_MENU_4
    INT 21H
    
    
    
    RET
    SHOW_RESULT ENDP 


setvelocities proc near
    mov al,angle 
is45:
cmp al,45
jne isn45
mov BALL_VELOCITY_X,1
mov BALL_VELOCITY_y,-1
ret
isn45:
mov bl,45
neg bl
cmp al,bl
jne is30 
mov BALL_VELOCITY_X,-1
mov BALL_VELOCITY_y,-1 
ret
is30:
cmp al,30
jne isn30
mov BALL_VELOCITY_X,-1
mov BALL_VELOCITY_y,-2 
ret
isn30:
mov bl,30
neg bl
cmp al,bl
jne is0
mov BALL_VELOCITY_X,1
mov BALL_VELOCITY_y,-2
ret
is0:
cmp al,0
jne noang
mov BALL_VELOCITY_X,0
mov BALL_VELOCITY_y,-1 
ret
noang:
ret
setvelocities endp


 leftpaddlecollision proc near  
  is45a:
cmp angle,45
jne isn45a
mov angle,30
neg angle
call setvelocities
ret
isn45a:
mov bl,45
neg bl
cmp bl,angle
jne is30a 
mov angle,30
call setvelocities
ret
is30a:
cmp angle,30
jne isn30a
mov angle,0 
call setvelocities
ret
isn30a:
mov bl,30
neg bl
cmp bl,angle
jne is0a
mov angle,0 
call setvelocities
ret
is0a:
cmp angle,0
jne noanga
mov angle,45 
call setvelocities
ret
noanga:
ret
 leftpaddlecollision endp
 
 
 
 
 rightpaddlecollision proc near  
   
  is45b:
cmp angle,45
jne isn45b
mov angle,30
neg angle
call setvelocities
ret
isn45b:
mov bl,45
neg bl
cmp bl,angle
jne is30b
mov angle,30
call setvelocities
ret
is30b:
cmp angle,30
jne isn30b
mov angle,0 
call setvelocities
ret
isn30b:
mov bl,30
neg bl
cmp bl,angle
jne is0b
mov angle,0 
call setvelocities
ret
is0b:
cmp angle,0
jne noangb
mov angle,45
neg angle 
call setvelocities
ret
noangb:
ret
 rightpaddlecollision endP

END_MENU_PROC PROC NEAR    
     
     MOV AX,03h ;
     INT 16     ; TEXT MOOD 
     
     MOV AH,9H   
     LEA DX,END_MENU
     INT 21H 
     
     RET
END_MENU_PROC ENDP 

CHAT_BOX PROC NEAR    
    push ax
    push dx
    
    MOV AH,02H
    mov bh,0
    MOV DX,0001H       ; Move Cursor to X,Y Position DL=X, DH=Y , C8 HALF SCREEN
    INT 10h
    
    MOV AH,09H
    LEA DX,PLAYER_NAME_STRING1  ; SHOWS IN VIDEO MOOD P1 SCORE MESSAGE ON UPPER CENTER 
    INT 21H
    
    MOV AH,2
    MOV DL,':'
    INT 21H
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    CALL CHANGING_SCORE_P1_TO_STRING ; CHANGES SCORE P1 NUMBER INTO STRING CAN BE DISPLAYED 
    MOV AH,9
    LEA DX,SCORE_P1_STRING  
    INT 21H
    
    
    ; /* END SCORE P1 */ 
    
    ; /* P2 SCORE */
    
    MOV AH,02H
    mov bh,0
    
    MOV DX,0016H       ; Move Cursor to X,Y Position DL=X, DH=Y , C8 HALF SCREEN
    INT 10h
    
    MOV AH,09H
    LEA DX,PLAYER_NAME_STRING2  ; SHOWS IN VIDEO MOOD P1 SCORE MESSAGE ON UPPER CENTER 
    INT 21H
    
    MOV AH,2
    MOV DL,':'
    INT 21H
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    
    CALL CHANGING_SCORE_P2_TO_STRING ; CHANGES SCORE P1 NUMBER INTO STRING CAN BE DISPLAYED 
    MOV AH,9
    LEA DX,SCORE_P2_STRING  
    INT 21H
    
     
    ; /* END P2 SCORE ON SCREEN */
    ; LEA DX,HEADER 
    ;INT 21H
    
    MOV AH,9H
    MOV DH,0
    
    LEA DX,VERTICAL_SPACE  ; GO DOWN 20 LINE TO WRITE CHAT BOX
    INT 21H
    LEA DX,CHATS
    INT 21h
    LEA DX,MESSAGE 
    INT 21H    
    pop dx
    pop ax
   
        RET

CHAT_BOX ENDP 

INGAME_CHAT PROC NEAR

     
                    MOV DX,3FBH      ;LINE CONTROL REGISTER
				    MOV AL,10000000B ;SET DIVISOR LATCH EXCESS BIT
				    OUT DX,AL
				    
				    MOV DX,3F8H
				    MOV AL,0CH
				    OUT DX,AL
				    
				    MOV DX,3F9H
				    MOV AL,00H
				    OUT DX,AL
				    
				    MOV DX,3FBH
				    MOV AL,00011011B
				    OUT DX,AL
				    
				    MOV AH,6
				    MOV AL,0
				    MOV BH,0FH       ;COLOR:BG RED AND TEXT WHITE
				    MOV CH,141         ;UPPER LEFT Y
				    MOV CL,0         ;UPPER LEFT X
				    MOV DH,150       ;LOWER RIGHT Y
				    MOV DL,200        ;LOWER RIGHT X
				    INT 10H 
				    
				    MOV AH,6
				    MOV AL,0
				    MOV BH,0FH       ;COLOR:BG WHITE AND TEXT RED
				    MOV CH,150         ;UPPER LEFT Y
				    MOV CL,0          ;UPPER LEFT X
				    MOV DH,199         ;LOWER RIGHT Y
				    MOV DL,200         ;LOWER RIGHT X
				    INT 10H 
				    
				    
				     SEND_LOOP1:
				    MOV AH,1         ;IF KEY IS PRESSED
				    INT 16H
				    JNZ DISPLAY1 
				    JNE DO11
				    JMP  RECEIVE_LOOP1
				    DO11:
				    DISPLAY1:
				    CMP AL,36        ;ASCII OF HOME 
				    JNE DONTDO11
				    JMP EXIT11
				    DONTDO11:
				    
				    CMP AL,13      ;ASCII OF ENTER      
				    jnz donot51
				    Jmp INC_SENDY1
				    donot51:
				    CMP AL,8       ;ASCII OF BACKSPACE
				    JZ BACK11
				   
				    MOV SEND_VAL1,AL 
				     
				    ;MOVE THE CURSOR
				    MOV_CURSOR11:
				    MOV AH,2       
				    MOV DL,SEND_X1 
				    MOV DH,SEND_Y1
				    MOV BH,0
				    INT 10H
				    
				    ;DISPLAY A LETTER A NO. OF TIMES WITH A CERTAIN COLOR
				    MOV AH,9
				    MOV BH,0
				    MOV BL,0FH      ;COLOR
				    MOV AL,SEND_VAL1
				    MOV CX,1        ; NO OF TIMES TO DISPLAY THE LETTER
				    INT 10H
				    
				    ;GET KEY PRESSED(WAIT)
				    MOV AH,0
				    INT 16H 
				    
				    INC SEND_X1
				    CMP SEND_X1,200   ; IF X REACH IT'S MAX. IT GOES A NEW LINE BY INC Y
				    JE  INC_SENDY1
				    JNE NO_INC_SENDY1 
				    
				    SCROLL11:
				    MOV AH,6
				    MOV AL,1
				    MOV BH,0FH       ;COLOR:BG RED AND TEXT WHITE
				    MOV CH,141         ;UPPER LEFT Y
				    MOV CL,0         ;UPPER LEFT X
				    MOV DH,149        ;LOWER RIGHT Y
				    MOV DL,199        ;LOWER RIGHT X
				    INT 10H
				    DEC SEND_Y1
				    JMP DISPLAY1               
				    
				    BACK11:
				    ;mov ah,0
				    ;int 16h  
				    DEC SEND_X1 
				    MOV AH,2       
				    MOV DL,SEND_X1 
				    MOV DH,SEND_Y1
				    MOV BH,0
				    INT 10H     
				    MOV AH,9
				    MOV BH,0
				    MOV BL,0FH      ;COLOR
				    MOV AL,32
				    MOV CX,1        ; NO OF TIMES TO DISPLAY THE LETTER
				    INT 10H 
				    DEC SEND_X1 
				    MOV AH,2       
				    MOV DL,SEND_X1 
				    MOV DH,SEND_Y1
				    MOV BH,0
				    INT 10H 
				    JMP DISPLAY1
				    
				    
				    INC_SENDY1:
				    INC SEND_Y1
				    MOV SEND_X1,0      
				    ;MOV AH,1
				    ;INT 16H
				    ;MOV SEND_VAL,32
				    mov dl,0DH
				    mov dl,0AH
				    INT 21H
				    CMP SEND_Y1,11
				    JZ  SCROLL11
				    JMP DISPLAY1
				         
				     
				    
				    NO_INC_SENDY1:
				    JMP AGAIN11
				    
				    AGAIN11:
				    MOV DX,3FDH      ;LINE STATUS REGISTER
				    IN AL,DX         ;READ LINE STATUS
				    TEST AL,00100000B 
				    JNZ DO_DO
				    JMP RECEIVE_LOOP  ;NOT EMPTY 
				    DO_DO:
				    ;IF EMPTY PUT THE VALUE IN TRANSMIT DATA REGISTER
				    MOV DX,3F8H      ;TRANSMIT DATA REGISTER
				    MOV AL,SEND_VAL1
				    OUT DX,AL
				    JMP SEND_LOOP1 
				    
				    ; SCROLL:
				    
				    RECEIVE_LOOP1:
				    ;CHECK THE DATA IS READY
				    MOV DX,3FDH      ;LINE STATUS REGISTER 
				    
				    CHECK1:
				    IN AL,DX
				    TEST AL,1
				    JNZ DO_11
				    JMP SEND_LOOP1    ;NOT READY
				    DO_11:
				    ;IF READY READ THE VALUE IN RECEIVE DATA REGISTER
				    MOV DX ,03F8H
				    IN AL,DX 
				    
				    CMP AL,36        ;ASCII OF HOME 
				    JMP EXIT11
				     
				    
				    CMP AL,13      ;ASCII OF ENTER
				    JZ INC_RECEIVEY1
				  
				    MOV RECEIVE_VAL1,AL
				    
				    
				    ;MOVE THE CURSOR 
				    MOV_CURSOR21:
				    MOV AH,2       
				    MOV DL,RECEIVE_X1 
				    MOV DH,RECEIVE_Y1
				    MOV BH,0
				    INT 10H 
				    
				    
				    ;DISPLAY A LETTER A NO. OF TIMES WITH A CERTAIN COLOR
				    MOV AH,9
				    MOV BH,0
				    MOV BL,0FH      ;COLOR
				    MOV AL,RECEIVE_VAL1
				    MOV CX,1         ; NO OF TIMES TO DISPLAY THE LETTER
				    INT 10H          
				    
				    INC RECEIVE_X1
				    CMP RECEIVE_X1,200
				    JE  INC_RECEIVEY1
				    JNE NO_INC_RECEIVEY1  
				    
				    SCROLL111:
				    MOV AH,6
				    MOV AL,1
				    MOV BH,0FH       ;COLOR:BG WHITE AND TEXT RED
				    MOV CH,150         ;UPPER LEFT Y
				    MOV CL,0          ;UPPER LEFT X
				    MOV DH,198         ;LOWER RIGHT Y
				    MOV DL,200         ;LOWER RIGHT X
				    INT 10H
				    DEC RECEIVE_Y1
				    JMP DO_11
				   
				    
				    INC_RECEIVEY1:
				    INC RECEIVE_Y1
				    MOV RECEIVE_X1,0 
				    ;MOV AH,1
				    ;INT 16H
				    ;MOV RECEIVE_VAL,32
				    mov dl,0DH
				    mov dl,0AH
				    INT 21H
				    CMP RECEIVE_Y1,198
				    JZ SCROLL111
				    ;JMP CHECK     
				    
				    
				    
				    NO_INC_RECEIVEY1:
				    JMP SEND_LOOP1
				    
				    EXIT11:
				    ; MOV CX,0AFH
                    ; MOV DX,0AEH
                    ; MOV AH,86H    ; Work only on the Dos box 
                    ; INT 15H
                    MOV AH,4CH
                    INT 21H
                     
                   
				    
				    
				    
				 
     
    
    RET
    INGAME_CHAT  ENDP


END MAIN
 

 