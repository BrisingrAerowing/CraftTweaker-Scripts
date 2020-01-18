#loader contenttweaker

import mods.contenttweaker.enchantments.EnchantmentBuilder;

val chaching= EnchantmentBuilder.create("chaching");
chaching.treasure = true;
chaching.maxLevel = 5;
chaching.setTypeWeapon();
chaching.setRarityVeryRare();
chaching.register();