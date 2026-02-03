       IDENTIFICATION DIVISION.                            
       PROGRAM-ID. MDARROPT.                               
       DATA DIVISION.                                      
       WORKING-STORAGE SECTION.                            
       01  ARRLEN    PIC 9(1) VALUE 5.                     
       01 ARRAY.                                           
          05 NUM     PIC 9(1) OCCURS 5 TIMES.              
       01 I          PIC 9(1).                             
       01 OPTION     PIC 9(1) VALUE 0.                     
       01 VALUE1     PIC 9(3) VALUE 0.                     
       01 VALUE2     PIC 9(3) VALUE 0.                     
       PROCEDURE DIVISION.                                 
           DISPLAY 'MENU DRIVEN ARRAY OPERATIONS'.        
           DISPLAY '1)SUM AND AVERAGE'.                   
           DISPLAY '2)LARGEST AND SMALLEST'.              
           DISPLAY '3)COUNT EVEN AND ODD'.                
           ACCEPT OPTION.                                 
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > ARRLEN 
            ACCEPT NUM(I)                                 
           END-PERFORM.                                   
           MOVE 1 TO I.                                   
           IF OPTION = 1                                  
                PERFORM VARYING I FROM 1 BY 1 UNTIL I > ARRLEN 
                 ADD NUM(I) TO VALUE1                     
                END-PERFORM                               
                       DISPLAY 'SUM: ' VALUE1                   
             MOVE VALUE1 TO VALUE2                    
             COMPUTE VALUE2 = VALUE2 / ARRLEN         
             DISPLAY 'AVERAGE: ' VALUE2               
           ELSE IF OPTION = 2                            
             MOVE NUM(I) TO VALUE1                        
             MOVE NUM(I) TO VALUE2                        
             PERFORM VARYING I FROM 2 BY 1 UNTIL I > ARRLEN    
              IF NUM(I) > VALUE1                          
               MOVE NUM(I) TO VALUE1                      
              END-IF                                      
              IF NUM(I) < VALUE1                          
               MOVE NUM(I) TO VALUE1                      
              END-IF                                      
             END-PERFORM                                 
             DISPLAY 'LARGEST: ' VALUE1                   
             DISPLAY 'SMALLEST: ' VALUE2                  
           ELSE IF OPTION = 3                            
                MOVE 0 TO VALUE1                          
                MOVE 0 TO VALUE2                          
                PERFORM VARYING I FROM 1 BY 1 UNTIL I > ARRLEN 
                 IF FUNCTION MOD(NUM(I), 2) = 0           
                  ADD 1 TO VALUE1                         
                 ELSE                                     
                  ADD 1 TO VALUE2                         
                 END-IF                                   
                      END-PERFORM                            
               DISPLAY 'COUNT OF ODD NUMBERS: ' VALUE1 
               DISPLAY 'COUNT OF EVEN NUMBERS: ' VALUE2
           ELSE                                        
               DISPLAY 'INVALID OPTION!'               
           END-IF.                                     
           STOP RUN.                                   