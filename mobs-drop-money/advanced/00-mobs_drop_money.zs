import crafttweaker.event.EntityLivingDeathDropsEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityMob;
import mods.ctutils.utils.Math;
import crafttweaker.enchantments.IEnchantment;

events.onEntityLivingDeathDrops(function(event as EntityLivingDeathDropsEvent) {

    if (event.damageSource.getTrueSource() instanceof IPlayer) {
        val player as IPlayer = event.damageSource.getTrueSource();
        if(!(player.isFake())) {
            var modifier = 1;
            for ench in player.currentItem.enchantments {
                if(ench.definition == <enchantment:contenttweaker:chaching>) {
                    modifier = 1 + (0.2 * ench.level);
                }
            }
            if(event.entityLivingBase instanceof IEntityMob) {
                var value as float = (event.entityLivingBase.maxHealth / 8) * modifier;

                if(value >= 100) {

                    val hundreds = <modcurrency:banknote:5> * Math.floor(value / 100);
                    event.addItem(hundreds);
                    value = value - (100 * Math.floor(value / 100));
                }

                if(value >= 50) {
                    val fifties = <modcurrency:banknote:4> * Math.floor(value / 50);
                    event.addItem(fifties);
                    value = value - (50 * Math.floor(value / 50));
                }

                if(value >= 20) {
                    val twenties = <modcurrency:banknote:3> * Math.floor(value / 20);
                    event.addItem(twenties);
                    value = value - (20 * Math.floor(value / 20));
                }

                if(value >= 10) {
                    val tens = <modcurrency:banknote:2> * Math.floor(value / 10);
                    event.addItem(tens);
                    value = value - (10 * Math.floor(value / 10));
                }

                if(value >= 5) {
                    val fives = <modcurrency:banknote:1> * Math.floor(value / 5);
                    event.addItem(fives);
                    value = value - (5 * Math.floor(value / 5));
                }

                if(value >= 2)
                {
                    val twos = <modcurrency:coin:5> * Math.floor(value / 2);
                    event.addItem(twos);
                    value = value - (2 * Math.floor(value / 2));
                }

                if(value >= 1) {
                    val ones = <modcurrency:coin:4> * Math.floor(value);
                    event.addItem(ones);
                    value = value - (1 * Math.floor(value));
                }

                var num = ((value / 0.25) as int);

                if(num > 0) {
                    val quarters = <modcurrency:coin:3> * num;
                    event.addItem(quarters);
                    value = value - (0.25 * ((value / 0.25) as int));
                }

                num = ((value / 0.1) as int);
                
                if(num > 0) {
                    val dimes = <modcurrency:coin:2> * num;
                    event.addItem(dimes);
                    value = value - (0.1 * ((value / 0.1) as int));
                }

                num = ((value / 0.05) as int);

                if(num > 0) {
                    val nickels = <modcurrency:coin:1> * num;
                    event.addItem(nickels);
                    value = value - (0.05 *((value / 0.05) as int));
                }

                num = ((value / 0.01) as int);

                if(num > 0) {
                    val pennies = <modcurrency:coin:0> * num;
                    event.addItem(pennies);
                }

            }
        }
    }

});