//
//  main.m
//  MyTime
//
//  Created by MacDonald,Liam on 2025-01-09.
//

#import <Foundation/Foundation.h>

@interface TimeConvert : NSObject{
@private
    int _minutes;
}
@end

@implementation TimeConvert
- (NSString) convertToHours:(int) minutes{
    minutes += 60;
    return minutes;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int minutes = 0;
        NSLog(@"Enter an amount of time in minutes");
        scanf("%i", &minutes);
        
        TimeConvert *timeConvert = [[TimeConvert alloc]init];
        
        minutes = [timeConvert convertToHours:minutes];
        NSLog(@"%i", minutes);
        
        
        fflush(stdin);
    }
    return 0;
}
