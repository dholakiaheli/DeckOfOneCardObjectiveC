//
//  HBCardViewController.h
//  DeckOfCards-C
//
//  Created by Heli Bavishi on 12/1/20.
//

#import <Foundation/Foundation.h>
#import "HBCard.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HBCardViewController : NSObject

+ (void)drawNewCard:(NSInteger)numberOfCards completion:(void(^) (NSArray<HBCard *> *_Nullable cards))completion;

+ (void)fetchImage:(HBCard *)card completion:(void(^) (UIImage * _Nonnull))completion;

@end
NS_ASSUME_NONNULL_END
