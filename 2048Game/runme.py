def G2048():
    
    '''
        This function acts like the game simulator
        instead of giving row commands, it allows you
        to intreact directly to the game.
    '''
    #The statement below imports the class board2048.
    from class2048 import Board2048
    import random
    '''



       ######          ######              #      #        #######        
      #      #        #      #            #       #       #       #
     #        #      #        #          #        #      #         #
     #        #     #          #        #         #     #           #
              #     #          #       #          #     #           #
             #      #          #      #           #      #         #     
            #       #          #     #            #       #       #
           #        #          #    ###################    #######                  
          #         #          #                  #       #       #
         #          #          #                  #      #         #
        #           #          #                  #     #           #
       #             #        #                   #     #           #
      #               #      #                    #      #         #
     ##########        ######                     #        #######
                                          

    '''
    width,height = eval(input("enter mode: "))
    board = Board2048(height,width)
    for rowL in board.listOFlists:
        print(rowL)
    
    while True:
        
        command = input ("enter key: ")

        if  command == "a":

            #The variable below is assigned to the copy of the board.
            copyOFlist = board.copy_maker()
            board.merge()
            
        elif command == "d":
            
            copyOFlist = board.copy_maker()
            board.merge2right()
        
        elif command == "w":
            
            copyOFlist = board.copy_maker()
            board.transposer(width)
            board.merge()
            board.transposer(height)
            
        elif command == "s":
            
            copyOFlist = board.copy_maker()
            board.transposer(width)
            board.merge2right()
            board.transposer(height)
               
        else:
            #This condition enables the game to ignore wrong inputs
            continue

        #This condition the checkes if the number 2048 is present in the board, so it can return "win" statement.
        for rowL in board.listOFlists:
            if 2048 in rowL:
                for row2 in board.listOFlists:
                    print(row2)
                return "YOU WON!"
        
        #This condition allows the game to ignore identical board or declare "Game Over".
        if  board.listOFlists == copyOFlist :

            #The statements below creates a copy of the original board, so it would be altered.
            copyOFboard = Board2048(board.height,board.width)
            copyOFboard.listOFlists = board.listOFlists

            #The game_over_flage is set according to the Game_over_chercker.
            game_over_flage = copyOFboard.Game_over_chercker()
            #If the game_over_flage is set to True a our game return Game Over and terminates.
            if game_over_flage == True:
                return "GAME OVER!"
            
            continue#The continue statement is executie if the game is not over.

        #The statemts below select available index and row randomly so it can be assigned to random_number.
        random_number = board.randomGenerator()
        row_selector = random.randrange(0,height)
        index_selector = random.randrange(0,width)

        while board.getListElement(row_selector,index_selector) != 0:
            row_selector = random.randrange(0,height)
            index_selector = random.randrange(0,width)

        board.setList(row_selector,index_selector,random_number)

        for rowL in board.listOFlists:
                print(rowL)
        
G2048()
