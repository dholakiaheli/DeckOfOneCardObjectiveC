//
//  HBCard.h
//  DeckOfCards-C
//
//  Created by Heli Bavishi on 12/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HBCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *image;
@property (nonatomic, copy, readonly) NSString *value;

- (instancetype) initWithSuit: (NSString *)suit
                        image:(NSString *)image
                        value:(NSString *)value;

@end

@interface HBCard (JSONConvertable)
- (HBCard *)initWithDictionary:(NSDictionary<NSString *, id> *)topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
