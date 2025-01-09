//
//  main.m
//  ObjCApp1
//
//  Created by MacDonald,Liam on 2025-01-07.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        //Declare Variables
        int myInt = 100;
        int myInt2  = 500;
        float myFloat = 355.55;
        double myDouble = 355.5;
        char myChar = 'D';
        NSString *myString = @"Hello Liam!";
        
        //print variables to console
        NSLog(@"My integer: %d and my Second Integer is %i", myInt, myInt2);
        NSLog(@"My Float is: %f",myFloat);
        NSLog(@"My Double is: %g",myDouble);
        NSLog(@"My Char is: %c",myChar);
        NSLog(@"My String is: %@",myString);
        
        //capture data
        int intInput = 0;
        NSLog(@"Enter a Number");
        scanf("%i", &intInput);
        
        NSLog(@"You selected the number: %i", intInput);
        
        NSLog(@"Enter a String");
        char word[10];
        //scanf("%s", word );
        
        fflush(stdin);
        
        int sentenceSize = 0;
        sentenceSize = sizeof(word);
        fgets(word,sentenceSize,stdin);
        
        NSString *enteredString = [NSString stringWithUTF8String:word];
        NSLog(@"You Entered the String %@",enteredString);
        
        
    }
    return 0;
}
