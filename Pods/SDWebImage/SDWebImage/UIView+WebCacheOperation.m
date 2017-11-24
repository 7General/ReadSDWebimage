/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIView+WebCacheOperation.h"

#if SD_UIKIT || SD_MAC

#import "objc/runtime.h"

static char loadOperationKey;

typedef NSMutableDictionary<NSString *, id> SDOperationsDictionary;

@implementation UIView (WebCacheOperation)

- (SDOperationsDictionary *)operationDictionary {
    /**
     ### 这里有一个疑问？
     这样创建出来的字典每一次都是新的
    虽然用了 static char loadOperationKey，但是没一次创建的地址都是新的，并且该字典还是空的。
     创建完成之后都直接返回了。不知道每次创建的都是新的并且还是空的字典，这样的开销会很大的？？！！！，也希望各位看官给予解答啊？？？
     */
    NSLog(@"====================");
    SDOperationsDictionary *operations = objc_getAssociatedObject(self, &loadOperationKey);
    // 创建成功返回该字典，直接把该字典当做属性返回
    if (operations) {
        return operations;
    }
    operations = [NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, &loadOperationKey, operations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return operations;
}

- (void)sd_setImageLoadOperation:(nullable id)operation forKey:(nullable NSString *)key {
    if (key) {
        [self sd_cancelImageLoadOperationWithKey:key];
        if (operation) {
            SDOperationsDictionary *operationDictionary = [self operationDictionary];
            operationDictionary[key] = operation;
        }
    }
}

- (void)sd_cancelImageLoadOperationWithKey:(nullable NSString *)key {
    // Cancel in progress downloader from queue
    /**
     * 在该对象中，用runtime手动的添加一个字典属性。
     ### 说一下这里的operationDictionary
     ### 该字典的value是下载的操作，然而key是对视图和操作来做的标识字符串
    */
    SDOperationsDictionary *operationDictionary = [self operationDictionary];
    /*
     * 在生成字典中的都是新的，所有都没有数据
     */
    
    id operations = operationDictionary[key];
    if (operations) {
        if ([operations isKindOfClass:[NSArray class]]) {
            for (id <SDWebImageOperation> operation in operations) {
                if (operation) {
                    [operation cancel];
                }
            }
        } else if ([operations conformsToProtocol:@protocol(SDWebImageOperation)]){
            [(id<SDWebImageOperation>) operations cancel];
        }
        [operationDictionary removeObjectForKey:key];
    }
}

- (void)sd_removeImageLoadOperationWithKey:(nullable NSString *)key {
    if (key) {
        SDOperationsDictionary *operationDictionary = [self operationDictionary];
        [operationDictionary removeObjectForKey:key];
    }
}

@end

#endif
