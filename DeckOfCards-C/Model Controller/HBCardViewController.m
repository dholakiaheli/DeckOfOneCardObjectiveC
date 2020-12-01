//
//  HBCardViewController.m
//  DeckOfCards-C
//
//  Created by Heli Bavishi on 12/1/20.
//

#import "HBCardViewController.h"

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/draw/";
static NSString * const countName = @"count";

@implementation HBCardViewController

+ (void)drawNewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<HBCard *> *_Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSString *cardCount = [@(numberOfCards) stringValue];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:countName value:cardCount];
    urlComponents.queryItems = @[queryItem];
    
    NSURL *finalURL = urlComponents.URL;
    NSLog(@"%@",finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            return completion(nil);
        }
        
        if (response)
        {
            NSLog(@"%@",response);
        }
        
        if (!data)
        {
            NSLog(@"No data was found");
            return completion(nil);
        }
        
        NSDictionary *toplevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if(!toplevelDictionary)
        {
            NSLog(@"Error parsing the JSON: %@", error);
            return completion(nil);
        }
        
        NSDictionary *jsonDictionaries = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSArray *cardsArray = jsonDictionaries[@"cards"];
        NSMutableArray *cardsPlaceholder = [NSMutableArray array];
        
        for (NSDictionary *cardDictionary in cardsArray)
        {
            HBCard *card = [[HBCard alloc] initWithDictionary:cardDictionary];
            [cardsPlaceholder addObject: card];
        }
        completion(cardsPlaceholder);
    }] resume];
    
}

+ (void)fetchImage:(HBCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.image];

    [[NSURLSession.sharedSession dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        
        if (error)
        {
            NSLog(@"%@", error);
            return completion(nil);
        }
        
        if (!data)
        {
            NSLog(@"%@", error);
            return completion(nil);
        }
        
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
    }] resume];
    
}
@end
