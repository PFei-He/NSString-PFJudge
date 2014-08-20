//
//  NSString+PFJudge.h
//  NSString+PFJudge
//
//  Created by PFei_He on 14-8-15.
//  Copyright (c) 2014年 PFei_He. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PFJudge)

/**
 *  @brief 判断是否QQ号码
 */
- (BOOL)isQQ;

/**
 *  @brief 判断是否邮箱地址
 */
- (BOOL)isEmail;

/**
 *  @brief 判断是否url
 */
- (BOOL)isURL;

/**
 *  @brief 判断是否手机号码
 */
- (BOOL)isTelephone;

/**
 *  @brief 判断是否ip地址
 */
- (BOOL)isIPAddress;

/**
 *  @brief 匹配邮箱地址
 */
- (NSString *)matchesEmail:(NSString *)string;

/**
 *  @brief 匹配url
 */
- (NSString *)matchesURL:(NSString *)string;

@end
