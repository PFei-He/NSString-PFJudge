//
//  NSString+PFJudge.m
//  NSString+PFJudge
//
//  Created by PFei_He on 14-8-15.
//  Copyright (c) 2014年 PFei_He. All rights reserved.
//

#import "NSString+PFJudge.h"

@implementation NSString (PFJudge)

//判断是否QQ号码
- (BOOL)isQQ
{
    NSString *emailRegex = @"(^[0-9]*$)";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

//判断是否邮箱地址
- (BOOL)isEmail
{
	NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];

	return [pred evaluateWithObject:self];
}

//判断是否url
- (BOOL)isURL
{
    NSString *regex = @"(http[s]{0,1}|ftp):\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];

	return [pred evaluateWithObject:self];
}

//判断是否手机号码
- (BOOL)isTelephone
{
    NSString *MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString *CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString *CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString *CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString *PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];

    return  [regextestmobile evaluateWithObject:self]   ||
    [regextestcm evaluateWithObject:self]       ||
    [regextestcu evaluateWithObject:self]       ||
    [regextestct evaluateWithObject:self]       ||
    [regextestphs evaluateWithObject:self];
}

//判断是否ip地址
- (BOOL)isIPAddress
{
	NSArray *components = [self componentsSeparatedByString:@"."];
	NSCharacterSet *invalidCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];

	if ( [components count] == 4 )
	{
		NSString *part1 = [components objectAtIndex:0];
		NSString *part2 = [components objectAtIndex:1];
		NSString *part3 = [components objectAtIndex:2];
		NSString *part4 = [components objectAtIndex:3];

		if ( [part1 rangeOfCharacterFromSet:invalidCharacters].location == NSNotFound &&
            [part2 rangeOfCharacterFromSet:invalidCharacters].location == NSNotFound &&
            [part3 rangeOfCharacterFromSet:invalidCharacters].location == NSNotFound &&
            [part4 rangeOfCharacterFromSet:invalidCharacters].location == NSNotFound )
		{
			if ( [part1 intValue] < 255 &&
                [part2 intValue] < 255 &&
                [part3 intValue] < 255 &&
                [part4 intValue] < 255 )
			{
				return YES;
			}
		}
	}

	return NO;
}

//匹配邮箱地址
- (NSString *)matchesEmail:(NSString *)string
{
    NSError *error;
    NSString *regulaStr = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];

    NSString *matchesStr = nil;
    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        matchesStr = [string substringWithRange:match.range];
    }

    return matchesStr;
}

//匹配url
- (NSString *)matchesURL:(NSString *)string
{
    NSError *error;
    NSString *regulaStr = @"(http[s]{0,1}|ftp):\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];

    NSString *matchesStr = nil;
    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        matchesStr = [string substringWithRange:match.range];
    }
    
    return matchesStr;
}

@end
