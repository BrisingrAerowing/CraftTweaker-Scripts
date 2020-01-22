#loader contenttweaker

import mods.contenttweaker.enchantments.EnchantmentBuilder;
import crafttweaker.enchantments.IEnchantmentDefinition;

val chaching = EnchantmentBuilder.create("chaching");
chaching.treasure = true;
chaching.maxLevel = 5;
chaching.setTypeWeapon();
chaching.calcEnchantabilityMin = function(e as IEnchantmentDefinition, l as int) { return 30; };
chaching.calcEnchantabilityMax = function(e as IEnchantmentDefinition, l as int) { return 30; };
chaching.setRarityVeryRare();
chaching.register();