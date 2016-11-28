//
//  customCollectionViewController.m
//  CPCollectionView
//
//  Created by Student P_05 on 18/11/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "customCollectionViewController.h"

@interface customCollectionViewController ()

@end

@implementation customCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    [super viewDidLoad];
    
    // Initialize recipe image array
    recipePhotos = [NSArray arrayWithObjects:@"cat1.jpg", @"cat2.jpg", @"cat3.jpg", @"cat4.jpg", @"cat5.jpg", @"cat6.jpg", @"cat7.jpg", @"cat8.jpg", @"cat9.jpg", @"cat10.jpg", @"cat11.jpg", @"cat12.jpg", @"cat13.jpg", @"cat14.jpg", @"cat15.jpg", @"cat16.jpg", nil];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
   // #warning Incomplete implementation, return the number of sections
    return recipePhotos.count ;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return recipePhotos.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:[recipePhotos objectAtIndex:indexPath.row]];
    
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        recipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [[NSString alloc]initWithFormat:@"Cats group #%li", indexPath.section + 1];
        
        headerView.headerLabel.text = title;
      
        reusableview = headerView;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        
        reusableview = footerview;
    }
    
    return reusableview;
}

#pragma mark <UICollectionViewDelegate>

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"showCat"]) {
//        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
//        catViewController *destViewController = segue.destinationViewController;
//        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
//        destViewController.catsImage = [recipePhotos[indexPath.section] objectAtIndex:indexPath.row];
//        
//        [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
//    }
//}
@end
