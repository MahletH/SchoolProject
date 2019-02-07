import OpenGL
from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *
import sys
global width
global height
global xrot
global yrot
global xscale
global yscale
global zscale
global xscal
global yscal
global zscal
#motion test
global anim, x, y ,z,dx, dy,dz,j,a,b,c,d,e,f,g,h,i,arot,xro,drot,grot,ex,ez,cx,cz,counter,counter1,counter2
x=-13.5
y=-9
z=45

ez=130
ex=-20

cx=-20
cz=0


counter=0
counter1=0
counter2=0


a=-18.5
b=-9
c=45

d=-18.5
e=-9
f=-265

g=-13.5
h=-9
i=-265

arot=0
xro=0
grot=0
drot=0
xrot=0

j=0
anim=0
dx=dy=dz=1
####
xscal=0
yscal=0
zscal=0

xscale=1
yscale=1
zscale=1
xrot=0.0
yrot=0.0
width=1800
height=1200


global ambientLight
global diffuseLight
global specular
global specref
ambientLight = (0.35, 0.35, 0.35, 1.0)
diffuseLight = ( 0.7, 0.75, 0.75, 0.7)
specular = (1.0, 1.0, 1.0, 1.0)
specref = (1.0, 1.0, 1.0, 1.0)
global glutshape
global solid

solid ="s"
glutshape = 30

def renderscene():
    global xrot
    global yrot
    global xscale
    global yscale
    global zscale,x,y,z,j,a,b,c,d,e,f,g,h,i,arot,xro,drot,grot,ex,ez,cx,cz,counter,counter1,counter2
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()

    gluLookAt(ex,0,ez,cx,0,cz,0,1,0)
    if j==1:

    
        #x += 0.1*dx
        #y += 0.1*dy
        
        z-=0.9*dz
        if counter<1:
            ez=ez-0.9
            ex=cx
        if z<=-80:
            counter+=1
            
            
            x+=0.9*dx
            z+=0.9*dz
            xro=-90
            if counter1<1:
                
                ez=-5
                cz=-5
                cx=30
                ex=ex+0.9
            
            
            if x>=32:
                counter1+=1

                
                x-=0.9*dx
                z-=0.9*dx
                xro=0

                if counter2<1:
                    ez=ez-0.9
                    cz=-100
                    ex=cx
                
                if z<=-107:
                    counter2+=1
                    
                    x+=0.9*dx
                    z+=0.9*dx
                    xro=-90
                    ez=-35
                    cz=-35
                    cx=200
                    if counter2==2:
                        ex=ex-3
                    else:
                        ex=ex+0.9

                    if x>=130:
                         x-=0.9*dx
                         ex=ex-0.9
                        
                        
                    
    if j==1:

    
        #x += 0.1*dx
        #y += 0.1*dy
        c-=0.9*dz
        if c<=-80:
            
            a-=0.9*dx
            c+=0.9*dz
            arot=90
            if a<=-65:
                a+=0.9*dx
                c-=0.9*dx
                arot=0
                if c<=-109:
                     a-=0.9*dx
                     c+=0.9*dx
                     arot=90
    if j==1:
        

    
        #x += 0.1*dx
        #y += 0.1*dy
        f+=0.9*dz
        if f>=-142:
            
           
            d-=0.9*dx
            f-=0.9*dz
            drot=-90
            if d<=-64:
                

                
                f+=0.9*dx
                
                
                
                d+=0.9*dx
                drot=0
                
                
                if f>=-115:
                     
                     d-=0.9*dx
                     
                     f-=0.9*dx
                     drot=-90

    if j==1:
        

    
        #x += 0.1*dx
        #y += 0.1*dy
        i+=0.9*dz
        if i>=-142:
            
           
            g+=0.9*dx
            i-=0.9*dz
            grot=90
            if g>=32:
               

                
                i+=0.9*dx
                
                
                
                g-=0.9*dx
                grot=0
                
                
                if i>=-115:
                     
                     g+=0.9*dx
                     
                     i-=0.9*dx
                     grot=90

                     if g>=130:
                         g-=0.9*dx
                     
                         
                         
                     
                        
                     
                     
                     
                                       
                     
                     
                     
                     
                    
    

    

    

  


    glPushMatrix()


   
  
    

    glRotatef(xrot, 1.0, 0.0, 0.0)
    glRotatef(yrot, 0.0, 1.0, 0.0)
    glTranslatef(0,0,70)
    tree()
  
####move 3
    glPushMatrix()
    
    glTranslate(d,e,f)
    glRotate(180,0,1,0)
    glRotate(drot,0,1,0)
    car2()
    glPopMatrix()
###### moving object 1
    glPushMatrix()

    
    
    glTranslate(x,y,z)
    
    glRotate(xro,0,1,0)
    
    car2()
    glPopMatrix()
####move 2
    glPushMatrix()
   
    
    
    glTranslate(a,b,c)
    glRotate(arot,0,1,0)
    car()
    glPopMatrix()

####move 4
    glPushMatrix()
    
    glTranslate(g,h,i)
    glRotate(180,0,1,0)
    glRotate(grot,0,1,0)
    car()
    
    
    glPopMatrix()

    
    glPushMatrix()
    glTranslatef(0,0,-5)
    glScalef(1,1,1.25)
    road()
    glPopMatrix()

    glPushMatrix()
    glTranslatef(0,0,-200)
    glScalef(1,1,1.25)
    road()
    glPopMatrix()


    glPushMatrix()
    
    glTranslatef(-12.3,0,-97)
    glScalef(0.94,1,1)

    glRotate(90,0,1,0)
   
    road()
    glPopMatrix()

    glPushMatrix()
    
    glTranslatef(-12.3,0,-156)
    glScalef(0.94,1,1)

    glRotate(90,0,1,0)
   
    road()
    glPopMatrix()

    glPushMatrix()
    glTranslatef(45,0,-108)
    glScalef(1,1,0.5)
    road()
    glPopMatrix()

    glPushMatrix()
    glTranslatef(-45,0,-108)
    glScalef(1,1,0.5)
    road()
    glPopMatrix()

    


    
    
    
    mainfloor()
    glScalef(2.5,2.5,2.5)

###green area
    glPushMatrix()
    glTranslatef(-6.4,-4.8,-44.5)
    glScalef(32,0.01,20)
    glRotate(90,1,0,0)
    glColor3ub(0,160,0)
    glutSolidCube(1)
    glPopMatrix()


   

    
 


   
   
   
#change postion of the whole buliding
#building one
    
    glPushMatrix()

    glScalef(1.5,1,1.5)
    
   
   

    glTranslatef(-0.9,1,5)

    buildingWF()

    
#floor
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-10,-5.8,3)
    glColor3ub(200,200,180)


    glScalef(8,0.01,10)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()

#end of building one

#start of buliding two

    glPushMatrix()
    glTranslate(9,-1,7)
    finalbuild2()
   
    glPopMatrix()

    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(5,-4.6,12)
    glColor3ub(200,200,180)


    glScalef(14,0.01,16)
    glutSolidCube(1)
    glPopMatrix()


  

   

#building 3
    glPushMatrix()
    glTranslate(0,0,-3)
    finalbuild3()
    glPopMatrix()

#floor
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(5,-4.6,-5)
    glColor3ub(200,200,180)


    glScalef(14,0.01,14)
    glutSolidCube(1)
    glPopMatrix()

#buliding 4

    glPushMatrix()

    glTranslate(-22,-1,0)

    glRotate(180,0,1,0)

    finalbuild2()



    glPopMatrix()
###floor
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-17.3,-4.8,-5)
    glColor3ub(200,200,180)


    glScalef(14,0.01,16)
    glutSolidCube(1)
    glPopMatrix()
   
#buliding 5
    glPushMatrix()
    glTranslate(5,0,1.5)

    glPushMatrix()
    glTranslate(0,-9.2,-20)

    glScalef(0.5,3,0.3)
    

    building5sub()


    glPopMatrix()


    glPushMatrix()
    
    glTranslate(0,-9.2,-28)

    glScalef(0.5,3,0.3)
    

    building5sub()


    glPopMatrix()


    glPushMatrix()
    
    glTranslate(-13,5.3,-20.1)
    glScalef(1.5,1.7,1.2)

    glRotate(180,0,1,0)
    

    building5main()


    glPopMatrix()

    glPopMatrix()
 
#####
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(5,-4.8,-22)
    glColor3ub(200,200,180)


    glScalef(14,0.01,16)
    glutSolidCube(1)
    glPopMatrix()

###building6
    glPushMatrix()
    glTranslate(-12,0,-27)
    glRotate(-180,0,1,0)
   
   
    glPushMatrix()
    glTranslate(0,0,-3)
    finalbuild3()
    glPopMatrix()

#floor
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(5,-4.6,-5)
    glColor3ub(200,200,180)


    glScalef(14,0.01,14)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()


    glPushMatrix()
    

    glPopMatrix()
#building 7
    glPushMatrix()

    glTranslate(-3,0,5)

    
    glPushMatrix()
    glScalef(1.5,1,1.5)

    glTranslatef(0,1.5,-50)

    buildingWF()
    glPopMatrix()

    glPushMatrix()
    glScalef(1.5,1,1.5)

    glTranslatef(0,1.5,-60)

    buildingWF()
    glPopMatrix()


    glPushMatrix()
    glScalef(0.45,1,0.8)

    glTranslatef(-29,-6,-98.5)

    building3()
    glPopMatrix()

    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-15,-4.6,-78)
    glColor3ub(200,200,180)


    glScalef(15,0.01,25)
    glutSolidCube(1)
    glPopMatrix()

    


    glPopMatrix()

    

    
    glPopMatrix()

    glFlush()

#####area 2
    glPushMatrix()
    glRotatef(xrot, 1.0, 0.0, 0.0)
    glRotatef(yrot, 0.0, 1.0, 0.0)
    glTranslatef(-145,0,-27)
    glScalef(2.5,2.5,2.5)
    glRotatef(-90,0,1,0)
    #building one
    glPushMatrix()
    glTranslatef(2,2,-3.4)
    glScalef(0.5,1,0.5)
    road()
    glPopMatrix()
    
    glPushMatrix()

    glScalef(1.5,1,1.5)
    
   
   

    glTranslatef(-0.9,1,5)

    buildingWF()

    
#floor
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-10,-5.8,3)
    glColor3ub(200,200,180)


    glScalef(8,0.01,10)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()

#end of building one

#start of buliding two

    glPushMatrix()
    glTranslate(9,-1,7)
    finalbuild2()
   
    glPopMatrix()

    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(5,-4.6,12)
    glColor3ub(200,200,180)


    glScalef(14,0.01,16)
    glutSolidCube(1)
    glPopMatrix()


  

   

#building 3
    glPushMatrix()
    glTranslate(0,0,-3)
    finalbuild3()
    glPopMatrix()

#floor
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(5,-4.6,-5)
    glColor3ub(200,200,180)


    glScalef(14,0.01,14)
    glutSolidCube(1)
    glPopMatrix()

#buliding 4

    glPushMatrix()

    glTranslate(-22,-1,0)

    glRotate(180,0,1,0)

    finalbuild2()



    glPopMatrix()
###floor
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-17.3,-4.8,-5)
    glColor3ub(200,200,180)


    glScalef(14,0.01,16)
    glutSolidCube(1)
    glPopMatrix()
   
#buliding 5
    glPushMatrix()
    glTranslate(5,0,1.5)

    glPushMatrix()
    glTranslate(0,-9.2,-20)

    glScalef(0.5,3,0.3)
    

    building5sub()


    glPopMatrix()


    glPushMatrix()
    
    glTranslate(0,-9.2,-28)

    glScalef(0.5,3,0.3)
    

    building5sub()


    glPopMatrix()


    glPushMatrix()
    
    glTranslate(-13,5.3,-20.1)
    glScalef(1.5,1.7,1.2)

    glRotate(180,0,1,0)
    

    building5main()


    glPopMatrix()

    glPopMatrix()
 
#####
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(5,-4.8,-22)
    glColor3ub(200,200,180)


    glScalef(14,0.01,16)
    glutSolidCube(1)
    glPopMatrix()

###building6
    glPushMatrix()
    glTranslate(-12,0,-27)
    glRotate(-180,0,1,0)
   
   
    glPushMatrix()
    glTranslate(0,0,-3)
    finalbuild3()
    glPopMatrix()

#floor
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(5,-4.6,-5)
    glColor3ub(200,200,180)


    glScalef(14,0.01,14)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()


    glPopMatrix()
#####area3

    glPushMatrix()
    glRotatef(xrot, 1.0, 0.0, 0.0)
    glRotatef(yrot, 0.0, 1.0, 0.0)
    glTranslatef(115,0,-55)
    glScalef(2.5,2.5,2.5)
    glRotatef(90,0,1,0)
    #building one
    glPushMatrix()
    glTranslatef(2,7.5,-4)
    glScalef(0.5,1,0.5)
    road()
    glPopMatrix()
    
    glPushMatrix()

    glScalef(1.5,1,1.5)
    
   
   

    glTranslatef(-0.9,1,5)

    buildingWF()

    
#floor
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-10,-5.8,3)
    glColor3ub(200,200,180)


    glScalef(8,0.01,10)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()

#end of building one

#start of buliding two

    glPushMatrix()
    glTranslate(9,-1,7)
    finalbuild2()
   
    glPopMatrix()

    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(5,-4.6,12)
    glColor3ub(200,200,180)


    glScalef(14,0.01,16)
    glutSolidCube(1)
    glPopMatrix()


  

   

#building 3
    glPushMatrix()
    glTranslate(0,0,-3)
    finalbuild3()
    glPopMatrix()

#floor
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(5,-4.6,-5)
    glColor3ub(200,200,180)


    glScalef(14,0.01,14)
    glutSolidCube(1)
    glPopMatrix()

#buliding 4

    glPushMatrix()

    glTranslate(-22,-1,0)

    glRotate(180,0,1,0)

    finalbuild2()



    glPopMatrix()
###floor
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-17.3,-4.8,-5)
    glColor3ub(200,200,180)


    glScalef(14,0.01,16)
    glutSolidCube(1)
    glPopMatrix()
   
#buliding 5
    glPushMatrix()
    glTranslate(5,0,1.5)

    glPushMatrix()
    glTranslate(0,-9.2,-20)

    glScalef(0.5,3,0.3)
    

    building5sub()


    glPopMatrix()


    glPushMatrix()
    
    glTranslate(0,-9.2,-28)

    glScalef(0.5,3,0.3)
    

    building5sub()


    glPopMatrix()


    glPushMatrix()
    
    glTranslate(-13,5.3,-20.1)
    glScalef(1.5,1.7,1.2)

    glRotate(180,0,1,0)
    

    building5main()


    glPopMatrix()

    glPopMatrix()
 
#####
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(5,-4.8,-22)
    glColor3ub(200,200,180)


    glScalef(14,0.01,16)
    glutSolidCube(1)
    glPopMatrix()

###building6
    glPushMatrix()
    glTranslate(-12,0,-27)
    glRotate(-180,0,1,0)
   
   
    glPushMatrix()
    glTranslate(0,0,-3)
    finalbuild3()
    glPopMatrix()

#floor
    glPushMatrix()
    

    glScale(xscale,yscale,zscale)
   

    
    glTranslate(5,-4.6,-5)
    glColor3ub(200,200,180)


    glScalef(14,0.01,14)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()


    glPopMatrix()

  
    

    

   
    glutSwapBuffers()
    glFlush()


def finalbuild3():

    glPushMatrix()

    

    glTranslate(10,1,-3)

    building3()

    glPopMatrix()

#####
    glPushMatrix()
   


    

    

    glTranslate(-5,1,3)
    glRotate(180,0,1,0)

    buildingWF()

    glPopMatrix()
###

    glPushMatrix()
   


    

    

    glTranslate(-5,1,-1)
    glRotate(180,0,1,0)

    buildingWF()

    glPopMatrix()

    
def finalbuild2():

    
    glPushMatrix()
   
   
    
    glTranslate(-15,2,-15)

    building2()

    glTranslate(-3,0,0)

    

    building2()

    glTranslate(0,0,4)

    building2()

    glTranslate(0,0,-8)

    building2()

    glTranslate(-3,0,0)

    building2()

    glTranslate(0,0,8)

    building2()
#additonal     
    glPushMatrix()

    glTranslate(-1,-2.3,-1)
    glColor3ub(128,128,100)


    glScalef(4,0.4,4)
    glutSolidCube(1)
    


   

    
    glPopMatrix()

#additional 1
    glPushMatrix()

    glTranslate(0.5,-2.2,0.6)
    glColor3ub(169,169,169)
    
    glScalef(0.2,3.8,0.2)


    glRotate(90,1,0,0)
    glutSolidCylinder(1,1,25,25)
    


    glPopMatrix()

#additional 2
    glPushMatrix()

    glTranslate(0.5,-2.2,-2.3)
    glColor3ub(169,169,169)
    
    glScalef(0.2,3.8,0.2)


    glRotate(90,1,0,0)
    glutSolidCylinder(1,1,25,25)
    


    glPopMatrix()

    
    glPopMatrix()




def buildingWF():
    
    #right Face
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10,0,1)
    glColor3ub(80,100,50)


    glScalef(3,12,0.1)
    glutSolidCube(1)
    glPopMatrix()


#window 1 right
    glPushMatrix()
    

  
  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,4.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 2 right
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,4.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()

#window 3 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,2.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 4 right
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,2.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 5 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,0.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 6 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,0.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 7 right
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,-1.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 8 right
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,-1.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 9 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,-3.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 10 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,-3.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()


#left face

    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10,0,5)
    glColor3ub(80,100,50)


    glScalef(3,12,0.1)
    glutSolidCube(1)
    glPopMatrix()


    #back face

    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-11.5,0,3)
    glColor3ub(80,100,50)


    glScalef(0.1,12,4)
    glutSolidCube(1)
    glPopMatrix()

 #front face
    #strand 1
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.5,5.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()
#strand 1 next
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,4.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,3.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 next
    glPushMatrix()
    

  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,2.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 3
    glPushMatrix()
    
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
#strand 3 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,0.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 4
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-0.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


#strand 4 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,-1.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 5
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-2.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
   #strand 6
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-5.6,3)
    glColor3ub(15,99,76)


    glScalef(0.1,0.75,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 7
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.3,-5.6,3)
    glColor3ub(80,150,255)


    glScalef(0.3,0.75,2)
    glutSolidCube(1)
    glPopMatrix()

    
    #strand 8
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.0,-5.8,3)
    glColor3ub(80,150,255)


    glScalef(0.3,0.4,2)
    glutSolidCube(1)
    glPopMatrix()


    #strand 1 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,4.8)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()



    #strand 2 ver
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.9)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 3 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.02)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 4 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,2.15)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 5 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,1.18)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 6 ver door
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,1.5)
    glColor3ub(15,99,76)


    glScalef(0.1,2.5,1)
    glutSolidCube(1)
    glPopMatrix()


    #strand 7 ver door
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,4.5)
    glColor3ub(15,99,76)


    glScalef(0.1,2.5,1)
    glutSolidCube(1)
    glPopMatrix()

 # door
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.6,-4.2,3)
    glColor3ub(130,255,255)


    glScalef(0.1,2.5,2.2)
    glutSolidCube(1)
    glPopMatrix()


 # door line
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,3)
    glColor3ub(0,0,0)


    glScalef(0.01,2.5,0.1)
    glutSolidCube(1)
    glPopMatrix()


 # door knob 1
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,3.3)
    glColor3ub(0,0,0)


    glScalef(0.1,0.1,0.1)
    glutSolidSphere(1,25,25)
    glPopMatrix()


 # door knob 1
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,2.7)
    glColor3ub(0,0,0)


    glScalef(0.1,0.1,0.1)
    glutSolidSphere(1,25,25)
    glPopMatrix()

   
#roof
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-10,6,3)
    glColor3ub(15,150,180)


    glScalef(3,0.01,4)
    glutSolidCube(1)
    glPopMatrix()
##################################################555555555555555######################
def building5sub():
 

    glPushMatrix()
    glTranslate(0,3,0)

#front face   
    glPushMatrix()
    glTranslate(11,5,-0.7)

    glRotate(90,1,0,0)
    glScale(1.2,1.2,1.3)
    


    #strand 1
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.5,5.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()
#strand 1 next
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,4.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,3.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 next
    glPushMatrix()
    

  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,2.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 3
    glPushMatrix()
    
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
#strand 3 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,0.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 4
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-0.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


#strand 4 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,-1.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 5
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-2.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

  
    


    #strand 1 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,4.8)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()



    #strand 2 ver
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.9)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 3 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.02)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 4 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,2.15)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 5 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,1.18)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()
#front side###############################################
   
    glPushMatrix()
    glTranslate(-20,5,3)

    glRotate(90,1,0,0)
    glRotate(180,0,0,1)
    
    glScale(1.2,1.2,1.3)


    #strand 1
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.5,5.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()
#strand 1 next
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,4.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,3.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 next
    glPushMatrix()
    

  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,2.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 3
    glPushMatrix()
    
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
#strand 3 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,0.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 4
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-0.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


#strand 4 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,-1.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 5
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-2.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

  
    


    #strand 1 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,4.8)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()



    #strand 2 ver
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.9)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 3 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.02)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 4 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,2.15)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 5 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,1.18)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()

#left side###################################
    glPushMatrix()
    glTranslate(-6.3,5,-14.5)

    glRotate(90,1,0,0)
    glRotate(180,0,0,1)
    glRotate(90,0,0,1)
    


    
    glScale(1.2,1.2,1.3)


    #strand 1
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.5,5.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()
#strand 1 next
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,4.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,3.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 next
    glPushMatrix()
    

  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,2.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 3
    glPushMatrix()
    
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
#strand 3 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,0.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 4
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-0.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


#strand 4 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,-1.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 5
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-2.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

  
    


    #strand 1 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,4.8)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()



    #strand 2 ver
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.9)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 3 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.02)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 4 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,2.15)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 5 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,1.18)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()

#rightface#########################################################
    glPushMatrix()
    glTranslate(-2.8,5,16.7)

    glRotate(90,1,0,0)
    glRotate(180,0,0,1)
    glRotate(-90,0,0,1)
    


    
    glScale(1.2,1.2,1.3)


    #strand 1
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.5,5.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()
#strand 1 next
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,4.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,3.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 next
    glPushMatrix()
    

  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,2.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 3
    glPushMatrix()
    
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
#strand 3 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,0.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 4
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-0.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


#strand 4 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,-1.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 5
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-2.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

  
    


    #strand 1 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,4.8)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()



    #strand 2 ver
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.9)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 3 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.02)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 4 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,2.15)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 5 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,1.18)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()


#roof
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-4.6,3.7,1)
    glColor3ub(15,200,220)


    glScalef(10.8,0.01,10.8)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()

def building5main():
 
    #right Face
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10,0,1)
    glColor3ub(50,50,254)

    glScalef(3,12,0.1)
    glutSolidCube(1)
    glPopMatrix()


#window 1 right
    glPushMatrix()
    

  
  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,4.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 2 right
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,4.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()

#window 3 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,2.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 4 right
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,2.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 5 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,0.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 6 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,0.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 7 right
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,-1.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 8 right
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,-1.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 9 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,-3.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 10 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,-3.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()


#left face

    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10,0,5)
    glColor3ub(50,50,254)


    glScalef(3,12,0.1)
    glutSolidCube(1)
    glPopMatrix()


    #back face

    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-11.5,0,3)
    glColor3ub(50,50,254)


    glScalef(0.1,12,4)
    glutSolidCube(1)
    glPopMatrix()

 #front face
    #strand 1
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.5,5.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()
#strand 1 next
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,4.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,3.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 next
    glPushMatrix()
    

  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,2.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 3
    glPushMatrix()
    
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
#strand 3 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,0.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 4
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-0.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


#strand 4 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,-1.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 5
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-2.5,3)
    glColor3ub(50,50,254)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
   #strand 6
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-5.6,3)
    glColor3ub(50,50,254)


    glScalef(0.1,0.75,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 7
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.3,-5.6,3)
    glColor3ub(50,50,254)


    glScalef(0.3,0.75,2)
    glutSolidCube(1)
    glPopMatrix()

    
    #strand 8
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.0,-5.8,3)
    glColor3ub(50,50,254)


    glScalef(0.3,0.4,2)
    glutSolidCube(1)
    glPopMatrix()


    #strand 1 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,4.8)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()



    #strand 2 ver
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.9)
    glColor3ub(50,50,254)

    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 3 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.02)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 4 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,2.15)
    glColor3ub(50,50,254)

    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 5 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,1.18)
    glColor3ub(50,50,254)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 6 ver door
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,1.5)
    glColor3ub(50,50,254)


    glScalef(0.1,2.5,1)
    glutSolidCube(1)
    glPopMatrix()


    #strand 7 ver door
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,4.5)
    glColor3ub(50,50,254)


    glScalef(0.1,2.5,1)
    glutSolidCube(1)
    glPopMatrix()

 # door
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.6,-4.2,3)
    glColor3ub(130,255,255)


    glScalef(0.1,2.5,2.2)
    glutSolidCube(1)
    glPopMatrix()


 # door line
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,3)
    glColor3ub(0,0,0)


    glScalef(0.01,2.5,0.1)
    glutSolidCube(1)
    glPopMatrix()


 # door knob 1
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,3.3)
    glColor3ub(0,0,0)


    glScalef(0.1,0.1,0.1)
    glutSolidSphere(1,25,25)
    glPopMatrix()


 # door knob 1
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,2.7)
    glColor3ub(0,0,0)


    glScalef(0.1,0.1,0.1)
    glutSolidSphere(1,25,25)
    glPopMatrix()

   
#roof
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-10,6,3)
    glColor3ub(15,150,180)


    glScalef(3,0.01,4)
    glutSolidCube(1)
    glPopMatrix()

def building2():
    
    #right Face
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10,0,1)
    glColor3ub(119,136,153)


    glScalef(3,12,0.1)
    glutSolidCube(1)
    glPopMatrix()


#window 1 right
    glPushMatrix()
    

  
  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,4.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 2 right
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,4.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()

#window 3 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,2.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 4 right
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,2.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 5 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,0.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 6 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,0.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 7 right
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,-1.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 8 right
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,-1.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 9 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10.6,-3.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()
#window 10 right
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-9.3,-3.5,5.1)
    glColor3ub(100,255,255)


    glScalef(0.8,0.8,0.1)
    glutSolidCube(1)
    glPopMatrix()


#left face

    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-10,0,5)
    glColor3ub(119,136,153)


    glScalef(3,12,0.1)
    glutSolidCube(1)
    glPopMatrix()


#back face

    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-11.5,0,3)
    glColor3ub(119,136,153)


    glScalef(0.1,12,4)
    glutSolidCube(1)
    glPopMatrix()

 #front face
    #strand 1
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.5,5.5,3)
    glColor3ub(112,128,144)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()
#strand 1 next
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,4.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,3.5,3)
    glColor3ub(112,128,144)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 next
    glPushMatrix()
    

  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,2.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 3
    glPushMatrix()
    
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3)
    glColor3ub(112,128,144)

    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
#strand 3 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,0.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 4
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-0.5,3)
    glColor3ub(112,128,144)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


#strand 4 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,-1.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 5
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-2.5,3)
    glColor3ub(112,128,144)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
   #strand 6
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-5.6,3)
    glColor3ub(112,128,144)


    glScalef(0.1,0.75,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 7
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.3,-5.6,3)
    glColor3ub(112,128,144)


    glScalef(0.3,0.75,2)
    glutSolidCube(1)
    glPopMatrix()

    
    #strand 8
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.0,-5.8,3)
    glColor3ub(112,128,144)


    glScalef(0.3,0.4,2)
    glutSolidCube(1)
    glPopMatrix()


    #strand 1 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,4.8)
    glColor3ub(112,128,144)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()



    #strand 2 ver
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.9)
    glColor3ub(112,128,144)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 3 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.02)
    glColor3ub(112,128,144)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 4 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,2.15)
    glColor3ub(112,128,144)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 5 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,1.18)
    glColor3ub(112,128,144)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 6 ver door
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,1.5)
    glColor3ub(112,128,144)


    glScalef(0.1,2.5,1)
    glutSolidCube(1)
    glPopMatrix()


    #strand 7 ver door
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,4.5)
    glColor3ub(112,128,144)


    glScalef(0.1,2.5,1)
    glutSolidCube(1)
    glPopMatrix()

 # door
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.6,-4.2,3)
    glColor3ub(130,255,255)


    glScalef(0.1,2.5,2.2)
    glutSolidCube(1)
    glPopMatrix()


 # door line
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,3)
    glColor3ub(0,0,0)


    glScalef(0.01,2.5,0.1)
    glutSolidCube(1)
    glPopMatrix()


 # door knob 1
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,3.3)
    glColor3ub(0,0,0)


    glScalef(0.1,0.1,0.1)
    glutSolidSphere(1,25,25)
    glPopMatrix()


 # door knob 1
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-4.2,2.7)
    glColor3ub(0,0,0)


    glScalef(0.1,0.1,0.1)
    glutSolidSphere(1,25,25)
    glPopMatrix()

   
#roof
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-10,6,3)
    glColor3ub(15,150,180)


    glScalef(3,0.01,4)
    glutSolidCube(1)
    glPopMatrix()
def mainfloor():

     glPushMatrix()
    
  
     glTranslate(-6,-6.01,-4)

    
     glTranslate(-10,-6,0)
     glColor3ub(105,105,105)


     glScalef(400,0.01,500)
     glRotate(30,1,0,0)
     glutSolidCube(1)


     glPopMatrix()

##################################buildng3####################################
def building3():

    glPushMatrix()
    glTranslate(0,3,0)

#front face   
    glPushMatrix()
    glTranslate(11,5,-0.7)

    glRotate(90,1,0,0)
    glScale(1.2,1.2,1.3)
    


    #strand 1
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.5,5.5,3)
    glColor3ub(92,80,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()
#strand 1 next
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,4.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,3.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 next
    glPushMatrix()
    

  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,2.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 3
    glPushMatrix()
    
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
#strand 3 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,0.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 4
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-0.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


#strand 4 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,-1.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 5
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-2.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

  
    


    #strand 1 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,4.8)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()



    #strand 2 ver
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.9)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 3 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.02)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 4 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,2.15)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 5 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,1.18)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()
#front side#####################################################################
   
    glPushMatrix()
    glTranslate(-20,5,3)

    glRotate(90,1,0,0)
    glRotate(180,0,0,1)
    
    glScale(1.2,1.2,1.3)


    #strand 1
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.5,5.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()
#strand 1 next
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,4.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,3.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 next
    glPushMatrix()
    

  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,2.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 3
    glPushMatrix()
    
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
#strand 3 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,0.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 4
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-0.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


#strand 4 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,-1.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 5
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-2.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

  
    


    #strand 1 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,4.8)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()



    #strand 2 ver
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.9)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 3 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.02)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 4 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,2.15)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 5 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,1.18)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()

#left side########################################################################
    glPushMatrix()
    glTranslate(-6.3,5,-14.5)

    glRotate(90,1,0,0)
    glRotate(180,0,0,1)
    glRotate(90,0,0,1)
    


    
    glScale(1.2,1.2,1.3)


    #strand 1
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.5,5.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()
#strand 1 next
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,4.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,3.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 next
    glPushMatrix()
    

  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,2.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 3
    glPushMatrix()
    
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
#strand 3 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,0.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 4
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-0.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


#strand 4 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,-1.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 5
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-2.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

  
    


    #strand 1 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,4.8)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()



    #strand 2 ver
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.9)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 3 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.02)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 4 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,2.15)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 5 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,1.18)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()

#rightface#########################################################
    glPushMatrix()
    glTranslate(-2.8,5,16.7)

    glRotate(90,1,0,0)
    glRotate(180,0,0,1)
    glRotate(-90,0,0,1)
    


    
    glScale(1.2,1.2,1.3)


    #strand 1
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.5,5.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()
#strand 1 next
    glPushMatrix()
    

  
   
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,4.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,3.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 2 next
    glPushMatrix()
    

  
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,2.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 3
    glPushMatrix()
    
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

    
#strand 3 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,0.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()

    #strand 4
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-0.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()


#strand 4 next
    glPushMatrix()
    

  
    
    glScale(xscale,yscale,zscale)
   
   

    
    glTranslate(-8.6,-1.5,3)
    glColor3ub(100,255,255)


    glScalef(0.1,1,3.7)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 5
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,-2.5,3)
    glColor3ub(15,99,76)


    glScalef(0.1,1,4)
    glutSolidCube(1)
    glPopMatrix()

  
    


    #strand 1 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,4.8)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()



    #strand 2 ver
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.9)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    
    #strand 3 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,3.02)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 4 ver
    glPushMatrix()
    
  
  
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,2.15)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()


    #strand 5 ver
    glPushMatrix()
    
  
    
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-8.5,1.5,1.18)
    glColor3ub(15,99,76)


    glScalef(0.1,9,0.4)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()


#roof
    glPushMatrix()
    
  
   
    glScale(xscale,yscale,zscale)
   

    
    glTranslate(-4.6,3.7,1)
    glColor3ub(15,200,220)


    glScalef(10.8,0.01,10.8)
    glutSolidCube(1)
    glPopMatrix()

    glPopMatrix()

    
    
def road():
    
     glPushMatrix()
    
  
 

    
     glTranslate(-6,-6,-4)
     glPushMatrix()
    
  
 

    
     glTranslate(-10,-6,0)
     glColor3ub(50,50,50)


     glScalef(10,0.01,106)
     glutSolidCube(1)
     glPopMatrix()
#lines
     
     glPushMatrix()
    
  
   
     glScale(xscale,yscale,zscale)
   

    
     glTranslate(-10,-5.9,3)
     glColor3ub(255,255,255)


     glScalef(1,0.01,6)
     glutSolidCube(1)
     glPopMatrix()
#lines
     glPushMatrix()
    
  
   
     glScale(xscale,yscale,zscale)
   

    
     glTranslate(-10,-5.9,-7)
     glColor3ub(255,255,255)


     glScalef(1,0.01,6)
     glutSolidCube(1)
     glPopMatrix()


#lines
     glPushMatrix()
    
  
   
     glScale(xscale,yscale,zscale)
   

    
     glTranslate(-10,-5.9,-17)
     glColor3ub(255,255,255)


     glScalef(1,0.01,6)
     glutSolidCube(1)
     glPopMatrix()
#lines
     glPushMatrix()
    
  
   
     glScale(xscale,yscale,zscale)
   

    
     glTranslate(-10,-5.9,-27)
     glColor3ub(255,255,255)


     glScalef(1,0.01,6)
     glutSolidCube(1)
     glPopMatrix()    
#lines
     glPushMatrix()
    
  
   
     glScale(xscale,yscale,zscale)
   

    
     glTranslate(-10,-5.9,-37)
     glColor3ub(255,255,255)


     glScalef(1,0.01,6)
     glutSolidCube(1)
     glPopMatrix()
#lines
     glPushMatrix()
    
  
   
     glScale(xscale,yscale,zscale)
   

    
     glTranslate(-10,-5.9,13)
     glColor3ub(255,255,255)


     glScalef(1,0.01,6)
     glutSolidCube(1)
     glPopMatrix()
#lines
     glPushMatrix()
    
  
   
     glScale(xscale,yscale,zscale)
   

    
     glTranslate(-10,-5.9,23)
     glColor3ub(255,255,255)


     glScalef(1,0.01,6)
     glutSolidCube(1)
     glPopMatrix()


#lines
     glPushMatrix()
    
  
   
     glScale(xscale,yscale,zscale)
   

    
     glTranslate(-10,-5.9,33)
     glColor3ub(255,255,255)


     glScalef(1,0.01,6)
     glutSolidCube(1)
     glPopMatrix()

#lines
     glPushMatrix()
    
  
   
     glScale(xscale,yscale,zscale)
   

    
     glTranslate(-10,-5.9,43)
     glColor3ub(255,255,255)


     glScalef(1,0.01,6)
     glutSolidCube(1)
     glPopMatrix()


#lines
     glPushMatrix()
    
  
   
     glScale(xscale,yscale,zscale)
   

    
     glTranslate(-10,-5.9,-47)
     glColor3ub(255,255,255)


     glScalef(1,0.01,6)
     glutSolidCube(1)
     glPopMatrix()
     glPopMatrix()
def car():
    glPushMatrix()
    glTranslate(0,0,-30)
    glScale(0.3,0.3,0.3)
    

    
    glPushMatrix()
    glTranslate(0,0,100)
    glScale(10,10,15)
    glColor3ub(0,23,244)
    
    glutSolidCube(1)
    glPopMatrix()

    glPushMatrix()
    glTranslate(0,-2.5,89)
    glScale(10,5,7)
    glColor3ub(0,2,244)
    
    glutSolidCube(1)
    glPopMatrix()

    glPushMatrix()
    glTranslate(5.5,-4,105)
    glScale(5,5,5)
    glColor3ub(0,0,0)
    glRotate(90,0,1,0)
    
    glutSolidTorus(0.15, 0.5, 5, 10)
    glPopMatrix()

    glPushMatrix()
    glTranslate(5.5,-4,90)
    glScale(5,5,5)
    glColor3ub(0,0,0)
    glRotate(90,0,1,0)
    
    glutSolidTorus(0.15, 0.5, 5, 10)
    glPopMatrix()

    glPushMatrix()
    glTranslate(-5.5,-4,90)
    glScale(5,5,5)
    glColor3ub(0,0,0)
    glRotate(90,0,1,0)
    
    glutSolidTorus(0.15, 0.5, 5, 10)
    glPopMatrix()

    glPushMatrix()
    glTranslate(-5.5,-4,105)
    glScale(5,5,5)
    glColor3ub(0,0,0)
    glRotate(90,0,1,0)
    
    glutSolidTorus(0.15, 0.5, 5, 10)
    glPopMatrix()
    glPopMatrix()
def car2():
    glPushMatrix()
    glTranslate(0,0,-30)
    glScale(0.3,0.3,0.3)
    
    

    
    glPushMatrix()
    glTranslate(0,0,100)
    glScale(10,10,15)
    glColor3ub(244,2,0)
    
    glutSolidCube(1)
    glPopMatrix()

    glPushMatrix()
    glTranslate(0,-2.5,89)
    glScale(10,5,7)
    glColor3ub(244,2,0)
    
    glutSolidCube(1)
    glPopMatrix()

    glPushMatrix()
    glTranslate(5.5,-4,105)
    glScale(5,5,5)
    glColor3ub(0,0,0)
    glRotate(90,0,1,0)
    
    glutSolidTorus(0.15, 0.5, 5, 10)
    glPopMatrix()

    glPushMatrix()
    glTranslate(5.5,-4,90)
    glScale(5,5,5)
    glColor3ub(0,0,0)
    glRotate(90,0,1,0)
    
    glutSolidTorus(0.15, 0.5, 5, 10)
    glPopMatrix()

    glPushMatrix()
    glTranslate(-5.5,-4,90)
    glScale(5,5,5)
    glColor3ub(0,0,0)
    glRotate(90,0,1,0)
    
    glutSolidTorus(0.15, 0.5, 5, 10)
    glPopMatrix()

    glPushMatrix()
    glTranslate(-5.5,-4,105)
    glScale(5,5,5)
    glColor3ub(0,0,0)
    glRotate(90,0,1,0)
    
    glutSolidTorus(0.15, 0.5, 5, 10)
    glPopMatrix()
    glPopMatrix()

def tree():
    glPushMatrix()
    glTranslate(-10,0,0)

    
    glPushMatrix()
    glTranslate(-10,10,-100)
    glScale(1,20,1)
    glColor3ub(118,92,72)
    glRotate(90,1,0,0)
    
    
    glutSolidCylinder(1,1,25,25)
 
    glPopMatrix()
    
    glPushMatrix()
    glTranslate(-10,10,-100)
    glScale(10,10,10)
    glColor3ub(0,160,0)
    glutSolidSphere(1,25,25)

    glPopMatrix()
    glPopMatrix()
    
    
def init():
    global width
    global height
    glClearColor(0.5, 0.803, 0.9, 1.0)
# Enable depth testing
    glEnable(GL_DEPTH_TEST)
    glEnable(GL_LIGHTING)
    glEnable(GL_NORMALIZE)
    
    glLightfv(GL_LIGHT0, GL_AMBIENT, ambientLight)
    glLightfv(GL_LIGHT0, GL_DIFFUSE, diffuseLight)
    glLightfv(GL_LIGHT0, GL_SPECULAR, specular)
    glEnable(GL_LIGHT0)
    glEnable(GL_COLOR_MATERIAL)
    glColorMaterial(GL_FRONT, GL_AMBIENT_AND_DIFFUSE)
    glMaterialfv(GL_FRONT, GL_SPECULAR, specref)
    glMateriali(GL_FRONT, GL_SHININESS, 128)

    glMatrixMode(GL_PROJECTION)
    glMatrixMode(GL_MODELVIEW)

   
   
def specialkeys( key, x, y):
    global xrot
    global yrot
    global xscal
    global yscal
    global zscal
    if key == GLUT_KEY_UP:



        

       
            xrot -= 2.0
    if key == GLUT_KEY_DOWN:
        xrot += 2.0
    if key == GLUT_KEY_LEFT:
        yrot -= 2.0
    if key == GLUT_KEY_RIGHT:
        yrot += 2.0
        
        
    glutPostRedisplay()

def reshape( w, h):

    lightPos = (-50.0, 50.0, 100.0, 1.0)
    nRange = 200.0
    if h==0:
            h = 1
    glViewport(0, 0, w, h)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    
    
# this section allows for window reshaping while
# maintaining a “normal” GLUT shape
    #if w <= h:
        #glOrtho(-nRange, nRange, -nRange*h/w, nRange*h/w, -nRange, nRange)
    #else:
        #glOrtho(-nRange*w/h, nRange*w/h, -nRange, nRange, -nRange, nRange)
    
    glFrustum (-2, 2, -2, 2, 1, 350.0)
    glMatrixMode(GL_MODELVIEW)
    
    glLightfv(GL_LIGHT0, GL_POSITION, lightPos)
def keyboard(key, n,m):
    key = key.decode("utf-8")
    global glutshape, solid,xscal,yscal,zscal,anim,x,y,z,j,p,ex,ez,cz,cx

    if key=="z"or key==chr(122):
        
        j=1
        


        
        
         #xscal += 0.3
         #yscal += 0.3
         #zscal += 0.3
         #glTranslate(xscal,yscal,zscal)
    if key=="o"or key==chr(111):
        j=0
        
        xscal -= 0.3
        yscal -= 0.3
        zscal -= 0.3
        glTranslate(xscal,yscal,zscal)
        
    if key=="a" or key==(27):
        
        ez=ez-5
        ex=cx
        
        
        
    if key=="l":
        ex=ex+5
        cx=30
        ez=-5
        cz=-5
        
        
    if key == chr(2) or key == "q":
        sys.exit()
    try:
        if int(key) < 10:
            glutshape = int(key)
    except:
        pass
    if key == "w" or key == "s":
        solid = key
        glutPostRedisplay()
    



def main():
    global width
    global height
    glutInit(sys.argv)
# Setup for double-buffered display and depth testing
    glutInitDisplayMode(GLUT_RGB|GLUT_DOUBLE|GLUT_DEPTH)
    glutInitWindowPosition(100,100)
    glutInitWindowSize(width,height)
    glutInit(sys.argv)
    glutCreateWindow("GLUT Shapes... Rotations")
    init()
    glutReshapeFunc(reshape)
    glutDisplayFunc(renderscene)
    glutIdleFunc(renderscene)
   

    
    glutKeyboardFunc(keyboard)
    glutSpecialFunc(specialkeys)
    glutMainLoop()
main()
