//
//  CCViewController.m
//  Pirate Adventure
//
//  Created by Eliot Arntz on 10/2/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import "CCViewController.h"
#import "CCFactory.h"
#import "CCTile.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /* Create a factory instance so that we can use our tile, character and boss instance methods. These methods return objects that we set equal to our properties */
    CCFactory *factory = [[CCFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    
    /* Setup the initial point in our coordinate system as 0,0. */
    self.currentPoint = CGPointMake(0,0);
    
    /*Call the method update character stats. As an initial setup pass in nil, nil and 0 so that else will trigger in this method. In this way we can apply our initial weapon and armor's stats to our characters health and damage stats. */
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    
    /* Call the method updateTile in order to setup the view's labels text and action button title based on the current tile. */
    [self updateTile];
    
    /* Run the logic to hide and unhide our directional arrow buttons based on what is a valid tile in our coordinate system. */
    [self updateButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    /* Determine our current tile using our CGPoint and our tiles array. */
    CCTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    /* Run a test to determine if we are on the boss tile. If we are on our the boss tile update the bosses health based on our character's damage.*/
    if (tile.healthEffect == -15){
        self.boss.health = self.boss.health - self.character.damage;
    }
    /* Call the method updateCharacterStatsForArmor so that we can use the armor, weapon or health effect on our tile. */
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    
    /* If the character's health is less than or equal to 0 show an alertview telling the user they died! */
    if(self.character.health <=0)
    {
        /* UIAlertView objects take multiple parameters. For now we will only use strings for a title, message and cancel button. Make sure to set other buttons and delegate to nil */
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have died please restart the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }
    /* If the bosses health is below 0 show an alertview that tells the user they won the game */
    else if(self.boss.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory message" message:@"You have defeated the evil pirate boss!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }
    
    /* After we perform an action we call the method updateTile so that our view will update with a new weapon, armor or health stat. */
    [self updateTile];
}

/* When the directional arrows are pressed we update our current CGPoint's x or y by creating a new CGPoint. Now that we have a new point we call the method updateButtons to hide them dynamically. Finally, we update our view's information with our new curren tile. */
- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y -1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

/* The reset button pressed set our character and boss objects to nil. Next we call the method viewDidLoad since we did all of our initial setup here. */
- (IBAction)resetButtonPressed:(UIButton *)sender
{
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}

#pragma mark - helper methods

/* The update tile method first determines what our current tile is based on our current CGPoint. Using our current tile we update all of our View's properties. Remember for a UIButton we have to update its' title using the method setTitle:forState:. We will learn about control state in the future. For now we use UIControlStateNormal. */
-(void)updateTile
{
    CCTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
}

/* For each button we set our hidden property equal to the return value of our tileExistsAtPoint method. For each direction we test a different CGPoint using the function CGPointMake. */
-(void)updateButtons
{
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
}

/* The method returns a BOOL based on a CGPoint parameter. If the point exists in our coordinate system we return NO otherwise we return YES. */
-(BOOL)tileExistsAtPoint:(CGPoint)point
{
    if (point.y >= 0 && point.x >=0 && point.x < [self.tiles count] && point.y <[[self.tiles objectAtIndex:point.x] count]){
        return NO;
    }
    else {
        return YES;
    }
}

/* Update the character's stats based on a armor, weapon, health effect or no impact. If the parameter does not equal nil or 0 we update the character's stats and the item if valid. If we don't pass in any valid aguments we update our charater's stats for damage and health based on their current weapon and armor. */
-(void)updateCharacterStatsForArmor:(CCArmor *)armor withWeapons:(CCWeapon *)weapon withHealthEffect:(int)healthEffect
{
    if (armor != nil){
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0){
        self.character.health = self.character.health + healthEffect;
    }
    else {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}

@end
