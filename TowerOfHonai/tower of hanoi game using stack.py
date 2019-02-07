class TowerOfHanoi:
     def __init__(self, disks, source, auxilary, destination):
         self.disks = disks
         self.towers = {
                        source: Stack(),
                        auxilary: Stack(),
                        destination: Stack()
                       }
         for i in range(n, 0, -1):
             self.towers[source].push(i);

     def moveDisk(self, source, destination):
         self.towers[destination].push(self.towers[source].pop())
         print("{} --> {}".format(source, destination))

     def moveTower(self, n, source, auxilary, destination):
        if n >= 1:
            self.moveTower(n-1, source, destination, auxilary)
            self.moveDisk(source, destination)
            self.moveTower(n-1, auxilary, source, destination)

class Stack:
     def __init__(self):
         self.items = []

     def isEmpty(self):
         return len(self) == 0

     def push(self, item):
         self.items.append(item)

     def pop(self):
         if not self.isEmpty():
             return self.items.pop()
         else:
             raise IndexError("pop from empty Stack")

     def peek(self):
         return self.items[len(self.items)-1]

     def __len__(self):
         return len(self.items)

n = int(input("Enter n: "))
tower = TowerOfHanoi(n, "A", "B", "C")
tower.moveTower(n, "A", "B", "C")

