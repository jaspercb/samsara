script "kingcheese.ash";
import <cc_ascend/cc_util.ash>

boolean pullPVPJunk();

void handleKingLiberation()
{
	if((get_property("kingLiberated") == "true") && (get_property("cc_snapshot") == ""))
	{
		print("Yay! The King is saved. I suppose you should do stuff.");
		if(!get_property("cc_kingLiberation").to_boolean())
		{
			set_property("cc_snapshot", "aborted");
			return;
		}
		#visit_url("storage.php?action=pullall&pwd&");
		visit_url("storage.php?action=takemeat&pwd&amt=" + my_storage_meat());
		visit_url("storage.php?pwd&");

		if(my_familiar() != $familiar[Black Cat])
		{
			set_property("cc_100familiar", false);
		}

		// Some items don\'t get pulled, notably, Stench Wad but some others as well (fat loot token, holiday fun, box of sunshine).
		// This might fix it...
		cli_execute("refresh all");

		if(have_display())
		{
			boolean[item] toDisplay = $items[Instant Karma, Thwaitgold Caterpillar Statuette, Thwaitgold Nit Statuette, Thwaitgold Scarab Beetle Statuette, Thwaitgold Spider Statuette, Thwaitgold Termite Statuette];
			foreach it in toDisplay
			{
				put_display(item_amount(it), it);
			}
		}

		boolean[item] toPull = $items[30669 scroll, 33398 scroll, 334 scroll, 5-hour acrimony, 64067 scroll, 668 scroll, 7-foot dwarven mattock, angst burger, antique accordion, ass-stompers of violence, auxiliary backbone, backwoods banjo, bag o\' tricks, bag of park garbage, ball-in-a-cup, baneful bandolier, beach buck, beautiful rainbow, bellhop\'s hat, belt of loathing, blue LavaCo Lamp&trade;, Boris\'s Helm, Boris\'s Helm (askew), box of sunshine, Brand of Violence, Bricko Eye Brick, Bricko Brick, Buddy Bjorn, Camp Scout Backpack, can of rain-doh, carrot juice, carrot nose, caustic slime nodule, chamoisole, cheap sunglasses, chibibuddy&trade; (on), chibibuddy&trade; (off), chroner, circle drum, claw of the infernal seal, cloak of dire shadows, coinspiracy, cold stone of hatred, cold wad, confusing led clock, corroded breeches, corrosive cowl, The Crown of Ed the Undying, crumpled felt fedora, csa fire-starting kit, das boot, deck of tropical cards, defective game grid token, diabolical crossbow, Dinsey\'s Brain, Dinsey\'s Glove, Dinsey\'s Oculus, Dinsey\'s Pants, Dinsey\'s Pizza Cutter, Dinsey\'s Radar Dish, dreadful fedora, dreadful glove, dreadful sweater, dread tarragon, dreadful roast, drunkula\'s wineglass, electronic dulcimer pants, eleven-foot pole, empty agua de vida bottle, eternal car battery, Experimental Carbon Fiber Pasta Additive, Fake Washboard, Fat Loot Token, Filthy Lucre, Fishy Pipe, Flaskfull of Hollow, Fossilized Necklace, Freddy Kruegerand, Frying Brainpan, Fudgecycle, Funfunds&trade;, fuzzy slippers of hatred, game grid ticket, game grid token, garbage sticker, giant yellow hat, girdle of hatred, glass eye, glass of goat\'s milk, goggles of loathing, Golden Mr. Accessory, grandfather watch, Gravyskin Belt of the Sauceblob, Great Wolf\'s Headband, Greatest American Pants, green face paint, green LavaCo Lamp&trade;, Grisly Shield, Hairpiece on Fire, Handmade Hobby Horse, Hardened Slime Belt, Hardened Slime Hat, Hardened Slime Pants, High-Temperature mining drill, HOA regulation book, Hobo Nickel, Holiday Fun!, hot wad, how to avoid scams, instant karma, ittah bittah hookah, jarlsberg\'s pan, jarlsberg\'s pan (Cosmic Portal Mode), jeans of loathing, Jewel-Eyed Wizard Hat, jodhpurs of violence, juju mojo mask, LARP Membership Card, leathery bat skin, the legendary beat, lens of hatred, lens of violence, Liar\'s Pants, Lime, Little Geneticist DNA-Splicing Lab, Little Red Book, little wooden mannequin, llama lama gong, Loathing Legion Helicopter, Loathing Legion Jackhammer, Loathing Legion Knife, Mace of the Tortoise, Map to Kokomo, Malevolent Medallion, mayor ghost\'s scissors, mayfly bait necklace, mer-kin digpick, mer-kin gladiator mask, mer-kin gladiator tailpiece, Mercenary Pistol, Mesmereyes&trade; Contact Lenses, milk of magnesium, miner\'s helmet, miner\'s pants, Mr. Accessory, Mr. Accessory Jr., Mr. Cheeng\'s Spectacles, mon tiki, moon-amber, nasty-smelling moss, nasty rat mask, ninjammies, novelty belt buckle of violence, The Nuge\'s Favorite Crossbow, numberwang, octolus-skin cloak, odd silver coin, operation patriot shield, opium grenade, order of the silver wossname, ornamental sextant, Oscus\'s dumpster waders, Oscus\'s Neverending Soda, Oscus\'s Pelt, outrageous sombrero, over-the-shoulder folder holder, pantaloons of hatred, pantsgiving, peppermint parasol, pernicious cudgel, Pick-O-Matic lockpicks, pigsticker of violence, pine cone necklace, pocket square of loathing, poppy, portable mayo clinic, possessed sugar cube, psychoanalytic jar, puppet strings, quake of arrows, Ratskin Pajama Pants, red and green rain stick, red face paint, red LavaCo Lamp&trade;, reflection of a map, Ring of Detect Boring Doors, rubber spider, sand dollar, sasq&trade; watch, scepter of loathing, sea lasso, sea cowbell, sewing kit, set of jacks, shirt kit, Shore Inc. Ship Trip Scrip, silver cow creamer, Sister Accessory, sleaze wad, slime-covered club, slime-covered compass, slime-covered greaves, slime-covered helmet, slime-covered lantern, slime-covered necklace, slime-covered shovel, slime-covered speargun, slime-covered staff, smooth velvet bra, smooth velvet hanky, smooth velvet hat, smooth velvet pants, smooth velvet pocket square, smooth velvet shirt, smooth velvet socks, Sneaky Pete\'s Leather Jacket, Sneaky Pete\'s Leather Jacket (Collar Popped), snow suit, soft green echo eyedrop antidote, solid shifting time weirdness, Space Trip Safety Headphones, spinning wheel, spooky putty monster, spooky putty sheet, spooky wad, staff of the scummy sink, staff of simmering hatred, stench wad, stinky cheese diaper, stinky cheese eye, stinky cheese sword, stinky cheese wheel, Stephen\'s Lab Coat, stick-knife of loathing, still-beating spleen, stinking agaricus, stinky fannypack, STYX Deodorant Body Spray, Tales of Spelunking, Talisman of Baio, Talking Spade, Tenderizing Hammer, Thor\'s Pliers, Tiki Lighter, Time Bandit Time Towel, Time Bandit Badge of Courage, Time Lord Badge of Honor, Time Shuriken, time sword, Time-twitching Toolbelt, tiny costume wardrobe, tropical paperweight, toy accordion, Travoltan Trousers, Transmission from Planet Xi, Treads of Loathing, twinkly wad, unbearable light, Uncle Buck, unconscious collective dream jar, V for Vivala Mask, villainous scythe, volcoino, Wal-Mart gift certificate, Wand of Oscus, water wings for babies, Work is a Four Letter Sword, woven baling wire bracelets, Xiblaxian 5D Printer, Xiblaxian Alloy, Xiblaxian Circuitry, Xiblaxian Holo-Wrist-Puter, Xiblaxian Polymer, Xiblaxian Stealth Cowl, Xiblaxian Stealth Trousers, Xiblaxian Stealth Vest, Zombo\'s Empty Eye];
		foreach it in toPull
		{
			pullAll(it);
		}

		toPull = $items[Bittycar meatcar, burrowgrub hive, chester\'s bag of candy, chroner cross, chroner trigger, the cocktail shaker, festive warbear bank, glass gnoll eye, picky tweezers, taco dan\'s taco stand flier, Trivial Avocations Board Game, warbear breakfast machine, warbear soda machine];
		foreach it in toPull
		{
			pullAndUse(it, 1);
		}

		pullAndUse($item[cheap toaster], 3);

		if(item_amount($item[can of rain-doh]) > 0)
		{
			use(1, $item[can of rain-doh]);
		}

		pullPVPJunk();

//		visit_url("lair2.php?preaction=key&whichkey=436");

		visit_url("place.php?whichplace=desertbeach&action=db_nukehouse");
		visit_url("shop.php?whichshop=hippy");
		visit_url("clan_rumpus.php?action=click&spot=3&furni=3");
		visit_url("clan_rumpus.php?action=click&spot=3&furni=3");
		visit_url("clan_rumpus.php?action=click&spot=3&furni=3");
		visit_url("clan_rumpus.php?action=click&spot=1&furni=4");
		visit_url("clan_rumpus.php?action=click&spot=4&furni=2");
		visit_url("clan_rumpus.php?action=click&spot=9&furni=3");

		if(get_property("cc_borrowedTimeOnLiberation").to_boolean() && (get_property("_borrowedTimeUsed") == "false"))
		{
			if(get_property("_clipartSummons").to_int() < 3)
			{
				cli_execute("make borrowed time");
			}
			if(item_amount($item[Borrowed Time]) > 0)
			{
				use(1, $item[borrowed time]);
			}
		}

		visit_url("campground.php?action=workshed");

		if(get_property("cc_snapshot") == "")
		{
			if(svn_info("bumcheekascend-snapshot").last_changed_rev > 0)
			{
				cli_execute("snapshot");
			}
			if(svn_info("ccascend-snapshot").last_changed_rev > 0)
			{
				cli_execute("cc_snapshot");
			}
			set_property("cc_snapshot", "done");
		}

		int oldToken = item_amount($item[Defective Game Grid Token]);
		visit_url("place.php?whichplace=arcade");
		visit_url("place.php?whichplace=arcade&action=arcade_plumber");
		if(item_amount($item[defective game grid token]) > oldToken)
		{
			abort("Woohoo!!! You got a game grid tokON!!");
		}
	}

	if((get_property("kingLiberated") == "true") && (get_property("cc_aftercore") == ""))
	{
		buy_item($item[4-d camera], 1, 10000);
		buy_item($item[mojo filter], 2, 3500);
		buy_item($item[stone wool], 2, 3500);
		buy_item($item[drum machine], 1, 2500);
		buy_item($item[killing jar], 1, 500);
		buy_item($item[spooky-gro fertilizer], 1, 500);
		buy_item($item[stunt nuts], 1, 500);
		buy_item($item[wet stew], 1, 3500);
		buy_item($item[star chart], 1, 500);
		buy_item($item[milk of magnesium], 2, 1200);
		buy_item($item[Boris\'s Key Lime Pie], 1, 8500);
		buy_item($item[Jarlsberg\'s Key Lime Pie], 1, 8500);
		buy_item($item[Sneaky Pete\'s Key Lime Pie], 1, 8500);
#		buy_item($item[Digital Key Lime Pie], 1, 8500);
		buy_item($item[Star Key Lime Pie], 3, 8500);
		buy_item($item[The Big Book of Pirate insults], 1, 600);
		buy_item($item[hand in glove], 1, 5000);


		if(get_property("cc_dickstab").to_boolean())
		{
			while(item_amount($item[Shore Inc. Ship Trip Scrip]) < 3)
			{
				adventure(1, $location[The Shore\, Inc. Travel Agency]);
			}
			buy_item($item[frost flower], 1, 50000);
		}

		if(!have_familiar($familiar[grimstone golem]))
		{
			buy_item($item[grimstone mask], 0, 7500);
		}

		if(have_skill($skill[Iron Palm Technique]) && (have_effect($effect[Iron Palms]) == 0))
		{
			use_skill(1, $skill[Iron Palm Technique]);
		}
		set_property("cc_aftercore", "done");
	}

	print("King Liberation Complete. Thank you for playing", "blue");
	if(get_property("cc_dickstab").to_boolean())
	{
		print("Remember to get Shore Scrip!!", "red");
	}
	if(get_property("cc_clearCombatScripts").to_boolean())
	{
		clear_property_if("cc_kingLiberatedScript", "scripts/kingcheese.ash");
		clear_property_if("cc_afterAdventureScript", "scripts/postcheese.ash");
		clear_property_if("cc_betweenAdventureScript", "scripts/precheese.ash");
		clear_property_if("cc_betweenBattleScript", "scripts/precheese.ash");

		restore_property("kingLiberatedScript", "cc_kingLiberatedScript");
		restore_property("afterAdventureScript", "cc_afterAdventureScript");
		restore_property("betweenAdventureScript", "cc_betweenAdventureScript");
		restore_property("betweenBattleScript", "cc_betweenBattleScript");
	}
}


boolean pullPVPJunk()
{
	if(!get_property("cc_pullPVPJunk").to_boolean())
	{
		return false;
	}
	boolean[item] toPull = $items[artisanal hand-squeezed wheatgrass juice, ascii fu manchu, bangyomaman battle juice, black friar\'s tonsure, black magic powder, blob of acid, blue oyster badge, booby trap, brigand brittle, bubblin\' chemistry solution, bull blubber, button rouge, cheap clip-on ninja tie, clove-flavored lip balm, compressed air canister, cube of ectoplasm, dancing fan, ectoplasm <i>au jus</i>, eldritch dough, electric copperhead potion, enchanted flyswatter, enchanted muesli, enchanted plunger, filthy armor, fireclutch, fitspiration&trade; poster, flask of rainwater, flayed mind, frog lip-print, fu manchu wax, gearhead goo, giant neckbeard, giant tube of black lipstick, gilt perfume bottle, glass of gnat milk, glass of warm milk, gnollish crossdress, gold toothbrush, handyman &quot;hand soap&quot;, holistic headache remedy, iiti kitty gumdrop, illuminati earpiece, janglin\' bones, jazzy cigarette holder, knob goblin mutagen, kobold kibble, leather glove, leonard\'s glasses, lucky cat\'s paw, lynyrd skinner toothblack, missing eye simulation device, muscle oil, ninja eyeblack, ninja fear powder, oil-filled donut, page of the necrohobocon, perpendicular guano, pirate cream pie, plastic jefferson wings, punk patch, pygmy adder oil, pygmy dart, pygmy papers, pygmy witchhazel, ravenous eye, red army camouflage kit, redeye&trade; eyedrops, salt water taffy, scrunchie tourniquet, secret mummy herbs and spices, Shivering Ch&egrave;vre, short deposition, skelelton spine, skeletal banana, skullery maid\'s knee, smart bone dust, smut orc sunglasses, space marine flash grenade, spooky gravy fairy warlock hat, steampunk potion, stone golem pebbles, tears of the quiet healer, temporary tribal tattoo, tiny canopic jar, una poca de gracia, unholy water, vial of swamp vapors, voodoo glowskull, white chocolate golem seeds, zombie hollandaise];
	foreach it in toPull
	{
		pullAll(it);
	}

	toPull = $items[all-purpose cleaner, awful poetry journal, batgut];
	foreach it in toPull
	{
		pullAll(it);
	}
	return true;
}

void main(){
	handleKingLiberation();
}
