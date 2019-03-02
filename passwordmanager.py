import random 
import string
import os
import sys

print("By yaya7211")

def PassGen():
    char=str(input("Which charset do you want to use?\n> "))
    taille=int(input("How many character?\n> "))
    if taille < 8:
        print("The password is too short, do you realy want to use it? (y/N)")
        choix=input("> ")
        if choix=="N":
            PassGen()
    return ''.join((random.choice(char) for i in range(taille)))

def txt():
    try:
        fichier = open('PasswordFiles.txt', 'a')
    except IOError:
        print("Passwords file doesn't seem to exist, it's maybe the first time you use this script.")
        print("File PasswordsFiles.txt succefully created. It is in the same repository that PassManager.py .")
        fichier = open("PasswordFiles.txt", 'a')
    filetxt = comment + " : " + passw
    try:
        fichier.write(filetxt)
        fichier.write("\n")
        fichier.close()
    except:
        print("Failed to write on the file, you should maybe run as root")
        sys.exit()
    else:
        print("Succefully registered in PasswordsFiles.txt")
        
    
print("Generate a strong password")
comment=str(input("Where do you use this password?\n> "))
passw=PassGen()
txt()
