class Board2048:
    
    '''This class is meant to create a 2048 game
        board were it can be played with.
    '''
    
    def __init__(self,height,width):
        
        '''This method instantiate 2048 board
            with the given width and height.
        '''
        
        self.height = height
        self.width = width
        self.Game_Over = ''
        self.row = [0]* self.width
        self.listOFlists = []

        #we used a for loop because when using list multiplication aliasing was created
        for i in range(self.height):
            self.listOFlists.append(self.row[:])

        self.init_board()

    def setList(self,rowNumber,index,value):
        
        '''
            This method helps in setting up the lists in the listOFlist.
        '''
        row = self.listOFlists[rowNumber]
        row[index] = value

    def getListElement(self,rowNumber,index):
        
        '''
            This method helps in gettting elements from the listOFlists.
        '''

        row = self.listOFlists[rowNumber]
        return row[index]
    
    def randomGenerator(self):
        
        '''
            This method generates 2 and 4 randomly, were 2 have 80% of chance
            being generated and 4 the rest 20%.
        '''
        import random
        self.store = [2,2,2,2,4]
        random_number = self.store[random.randint(0,4)]
        return random_number     

    def merge(self):
        
        '''
            This method merges the listOFlists to the left
            by iterating through each individual
            list in the listOFlists.
        '''
        #rowL refers to a row in the listOFlists
        for rowL in self.listOFlists:
            count1 = 0
            count2 = 1
            while count2 < len(rowL):

                if rowL[count2] == 0:
                    count2 += 1
                    
                elif rowL[count1] == rowL[count2]:
                    sum1 = rowL[count1] + rowL[count2]
                    rowL[count1],rowL[count2] = sum1,0
                    count1 += 1
                    count2 += 1

                elif rowL[count1] == 0:
                    rowL[count1],rowL[count2] = rowL[count2],rowL[count1]


                else:
                    rowL[count1 + 1],rowL[count2] = rowL[count2],rowL[count1 + 1]
                    count1 += 1
                    count2 += 1


    def merge2right(self):
        
        '''
            This method merges the listOFlists to the right
            by iterating through each individual
            list in the listOFlists.
        '''
        
        for rowL in self.listOFlists:
            [[2,4,2,4,0]]
            count1 = len(rowL) - 1
            count2 = len(rowL) - 2
            while count2 >= 0:
                if rowL[count2] == 0:
                    count2 -= 1

                elif rowL[count1] == rowL[count2]:
                    sum1 = rowL[count1] + rowL[count2]
                    rowL[count1],rowL[count2] = sum1,0
                    count1 -= 1
                    count2 -= 1
                    
                elif rowL[count1] == 0:
                    rowL[count1],rowL[count2] = rowL[count2],rowL[count1]
                   
                else:
                    rowL[count1 - 1],rowL[count2] = rowL[count2],rowL[count1 - 1]
                    count1 -= 1
                    count2 -= 1

    def transposer(self,range_of_index):
        
        '''
            This method acts as a transposer ,
            were column is converted to rows and vice versa. 
        '''
        #This attribute collect the list of columns or row created
        self.listOFcells = []
        #This function follow the laws of transpos to convert rows to column or vice versa.
        for index in range(0,range_of_index):
            cells = []
            for rowL in self.listOFlists:
                cells.append(rowL[index])
            self.listOFcells.append(cells)
        self.listOFlists = self.listOFcells

    def init_board(self):
        """
            This method is part of the instantiation,when the board is created two
            randomly selected numbers will be assigined to it.
        """
        
        import random
        #The need of this variable is that, it acts as flag to control index similarity
        incase_of_similarity = (self.height +1 , self.width + 1)
        generationCounter = 0
        while generationCounter < 2:
            generationCounter += 1
            random_number = self.randomGenerator()
            row_selector = random.randrange(0,self.height)
            index_selector = random.randrange(0,self.width)
            
            #This condition is used if a random_number is generated at the same place 
            if incase_of_similarity == (row_selector,index_selector):
                generationCounter = 1
                continue
            incase_of_similarity = (row_selector,index_selector)
            self.setList(row_selector,index_selector,random_number)
        
    def Game_over_chercker(self):
        """
            This method check if there is any merge lift.
            so if it can't merge to the left or right or up or down, it return True.
            In other word it check if there is any left digit that can be added.
        """
        #This condition checks for existence of zero,because if there is zero in the listOFlists then the game is not over.
        for rowL in self.listOFlists:
            if 0 in rowL:
                return False
            
        for rowL in self.listOFlists:
            for index in range(0,self.width - 1):
                if rowL[index] != 0 and rowL[index] == rowL[index + 1]:
                        return False

        #The statements below are used in transposing the board to check if there is any left digit that can be added.
        self.transposer(self.width)
        for rowL in self.listOFlists:
            for index in range(0,self.height - 1):
                if rowL[index] != 0 and rowL[index] == rowL[index + 1]:
                        return False
        return True #This statement is returned if above conditions are satisfied.  
                     

    def copy_maker(self):
        
        '''
            This method help in creating a copy of listOFlists,
            because aliasing is a big problem we tried to avoid it
            by creating a copy of the listOFists.
        '''
        copy = []
        for rowL in self.listOFlists:
            copy.append(rowL[:])
        return copy




T2048 = Board2048(4,3)
H2048 = Board2048(2,3)




