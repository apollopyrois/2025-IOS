//
//  main.m
//  ObjCObjects
//
//  Created by MacDonald,Liam on 2025-01-09.
//

#import <Foundation/Foundation.h>

@interface DMFraction : NSObject{
@private
    int _numerator;
    int _denominator;
}

//Setters
- (void) setNumerator:(int) numerator;
- (void) setDenominator:(int) denominator;
- (void) setNumeratorAndDenominator:(int) numerator withDenominator:(int) denominator;


//Getters
-(int) numerator;
-(int) denominator;

//Methods
- (void) print;

@end

@implementation DMFraction

//Setters
- (void) setNumerator:(int) numerator {
    _numerator = numerator;
}

- (void) setDenominator:(int)denominator {
    _denominator = denominator;
}

-(void) setNumeratorAndDenominator: (int) numerator withDenominator:(int) denominator{
    _numerator = numerator;
    _denominator = denominator;
}
//Getters
- (int) numerator{
    return _numerator;
}

- (int) denominator {
    return _denominator;
}

//Methods
- (void) print{
    NSLog(@"The Result of %i divided by %i is: %g",_numerator,_denominator,(double)_numerator / (double)_denominator);
}

- (NSString*) description {
    NSString *fracDesc = [NSString stringWithFormat:@"Numerator: %i, Denominator: %i", _numerator, _denominator];
    return fracDesc;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        DMFraction *fract = [[DMFraction alloc]init];
        [fract setNumerator:1];
        [fract setDenominator:3];
        [fract print];
        
        //Calc 2
        [fract setNumeratorAndDenominator:10 withDenominator:5];
        [fract print];
        
        NSLog(@"Your fraction Object: %@", fract);
        
    }
    return 0;
}
