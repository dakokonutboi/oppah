import random 
import string
import os

def PassGen():
    char=str(input("Which char do you want to use?\n> "))
    taille=int(input("How many chars?\n> "))
    if taille < 8:
        print("The password is too law to be strong, do you realy want to use it? (y/N)")
        choix=input("> ")
        if choix=="N":
            PassGen()
    return ''.join((random.choice(char) for i in range(taille)))

def txt():
    try:
        fichier = open('PasswordsFiles.txt', 'r')
    except IOError:
        print("Passwords file seen doesn't exist, it's maybe the first time you use this script.")
        print("File PasswordsFiles.txt succefully created. It is iin the same repository that PassManager.py .")
        fichier = open("PasswordFiles.txt", 'a')
        filetxt = comment + " : " + passw
    fichier.write(filetxt)
    fichier.close()
    print("Succefully registered in PasswordsFiles.txt")
        
    
print("Generate a strong password")
comment=str(input("Where do you use this password?\n> "))
passw=PassGen()
txt()
