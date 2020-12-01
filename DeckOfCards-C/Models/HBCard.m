//
//  HBCard.m
//  DeckOfCards-C
//
//  Created by Heli Bavishi on 12/1/20.
//

#import "HBCard.h"

static NSString * const suitKey = @"suit";
static NSString * const imageKey = @"image";
static NSString * const valueKey = @"value";

@implementation HBCard

- (instancetype)initWithSuit:(NSString *)suit image:(NSString *)image value:(NSString *)value
{
    if (self = [super init])
    {
        _suit = suit;
        _image = image;
        _value = value;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *suit = dictionary[suitKey];
    NSString *image = dictionary[imageKey];
    NSString *value = dictionary[valueKey];

    return [self initWithSuit:suit image:image value:value];
}
                                
@end

