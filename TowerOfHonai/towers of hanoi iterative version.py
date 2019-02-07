#Iterative solution of TOWERS OF HANOI puzzle
from Stack import Stack
import math
def moveDiskBetweenTwoPoles(src, dest, s, d):
    # top element of the source stack
    pole1TopDisk = src.peek()
    
    # top element of the destination stack
    pole2TopDisk = dest.peek()

    # if the source stack is empty
    if ( pole1TopDisk == -1):
        pop2 = dest.pop()
        src.push(pop2)
        moveDisk(d, s, pop2)
    # if the destination stack is empty
    elif (pole2TopDisk == -1):
        pop1 = src.pop()
        dest.push(pop1)
        moveDisk(s,d, pop1)
    # if the source stack top is greater than the the destination's stack top
    elif (pole1TopDisk>pole2TopDisk):
        pop2 = dest.pop()
        src.push(pop2)
        moveDisk(d, s, pop2)
    # if the destination top is greater than the source's stack top
    else:
        pop1 = src.pop()
        dest.push(pop1)
        moveDisk(s, d, pop1)
    # method to print movement of disks from rod to rod
def moveDisk(fromRod, toRod, diskValue):
    print("Move the disk ",diskValue," from ", fromRod," to ",toRod)
    # main method that does the iteration
def tohIterative(num_of_disks, src, aux, dest):
    s = "S"
    d = "D"
    a = "A"
    # if the number of disks is odd interchage auxiliay and destination rods so that the result will be the thirdmost rod
    if num_of_disks % 2 == 0:
        temp = d
        d = a
        a = temp
        # total moves = 2**n
    total_num_of_moves = int(math.pow(2,num_of_disks)-1)

    # put the numbers upto num_of_disks to source stack
    for i in range(num_of_disks,0 , -1):
        src.push(i)
    print("Source Stack: ", src.items)
    # perform steps
    #the condition are from the patterns that are inferred by performing the steps
    for i in range (1, total_num_of_moves+1):
        if (i%3 == 1):
            moveDiskBetweenTwoPoles(src, dest, s, d)
        elif (i %3 == 2):
            moveDiskBetweenTwoPoles(src, aux, s, a)
        elif (i %3 == 0):
            moveDiskBetweenTwoPoles(aux, dest, a, d)
        if(num_of_disks%2==0):
            print("auxiliary: ",dest.items)
        else:
            print("auxiliary: ",aux.items)
        print()
def run():
    try:
        src = Stack()
        dest = Stack()
        aux = Stack()
        num_of_disks = int(input("Enter number of disks: "))
        tohIterative(num_of_disks, src, aux, dest)
        if(num_of_disks%2==0):
            print(aux.items)
        else:
            print(dest.items)
        play = input("press y to test again (y/n): ")
        if play == "y":
            run()
    except:
        run()
run()























        
        
    
