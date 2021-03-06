//
//  MisoApiArrangementsClient.m
//  MisoApiProject
//
//  Created by Chris Lavender on 12/15/11.
//  Copyright (c) 2011 Miso Media. All rights reserved.
//

#import "MisoApiArrangementsClient.h"
#import "MisoApiClient.h"

static NSString *arrangementsPath = @"song-arrangements";

@implementation MisoApiArrangementsClient
// assigned
@synthesize delegate;
- (void)getFeaturedArrangementsForPageNumber:(NSNumber *)pageNumber
                                   itemCount:(NSNumber *)numberOfItems
                                 andCallback:(void (^)(id))handler
{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            pageNumber, @"page",
                            numberOfItems, @"per_page",
                            nil];
    
    [self.delegate requestWithPath:arrangementsPath 
                            method:@"featured" 
                         getParams:params 
                        postParams:nil 
                       andCallback:handler];
}

- (void)getTopArrangementsForPageNumber:(NSNumber *)pageNumber
                              itemCount:(NSNumber *)numberOfItems
                            andCallback:(void (^)(id))handler
{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            pageNumber, @"page",
                            numberOfItems, @"per_page",
                            nil];
    
    [self.delegate requestWithPath:arrangementsPath 
                            method:@"top" 
                         getParams:params 
                        postParams:nil 
                       andCallback:handler];
}

- (void)getArrangementWithId:(NSNumber *)arrangement_id 
                 andCallback:(void(^)(id))handler
{
    [self.delegate requestWithPath:arrangementsPath 
                            method:[arrangement_id stringValue]
                         getParams:nil 
                        postParams:nil 
                       andCallback:handler];
}

- (void)getPartsForArrangementWithId:(NSNumber *)arrangement_id 
                         andCallback:(void(^)(id))handler
{
    NSString *arrangementPartsMethod = [NSString stringWithFormat:@"%@/parts",arrangement_id];

    [self.delegate requestWithPath:arrangementsPath 
                            method:arrangementPartsMethod
                         getParams:nil 
                        postParams:nil 
                       andCallback:handler];
}

- (void)searchArrangementsWithGetParameters:(NSDictionary *)getParams 
                                andCallback:(void(^)(id))handler
{
        [self.delegate requestWithPath:arrangementsPath 
                            method:nil
                         getParams:getParams 
                        postParams:nil 
                       andCallback:handler];
}

@end
