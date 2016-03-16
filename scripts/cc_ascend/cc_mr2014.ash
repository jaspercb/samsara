script "cc_mr2014.ash"
import<cc_ascend/cc_adventure.ash>
import<cc_ascend/cc_elementalPlanes.ash>

#	This is meant for items that have a date of 2014.
#	Handling: Little Geneticist DNA-Splicing Lab
#


boolean dna_bedtime();
boolean dna_sorceressTest();
boolean dna_generic();
boolean dna_startAcquire();

//Supplemental




boolean dna_startAcquire()
{
	if(!is_unrestricted($item[Little Geneticist DNA-Splicing Lab]))
	{
		return false;
	}
	if((get_property("cc_day1_dna") == "finished") || (my_daycount() != 1))
	{
		return false;
	}
	if(have_effect($effect[Human-Weird Thing Hybrid]) == 2147483647)
	{
		return false;
	}
	if(item_amount($item[DNA Extraction Syringe]) == 0)
	{
		return false;
	}

	if(get_property("dnaSyringe") == $phylum[weird])
	{
		cli_execute("camp dnainject");
	}
	else
	{
		if((have_familiar($familiar[Machine Elf])) && !get_property("cc_100familiar").to_boolean())
		{
			familiar bjorn = my_bjorned_familiar();
			if(bjorn == $familiar[Machine Elf])
			{
				handleBjornify($familiar[Grinning Turtle]);
			}
			handleFamiliar($familiar[Machine Elf]);
			ccAdv(1, $location[The Deep Machine Tunnels]);
			if(bjorn == $familiar[Machine Elf])
			{
				handleBjornify(bjorn);
			}
			cli_execute("camp dnainject");
		}
		else if(elementalPlanes_access($element[sleaze]))
		{
			if($location[Sloppy Seconds Diner].turns_spent == 0)
			{
				ccAdv(1, $location[Sloppy Seconds Diner]);
			}
			ccAdv(1, $location[Sloppy Seconds Diner]);
			cli_execute("camp dnainject");
		}
	}
	set_property("cc_day1_dna", "finished");
	if(have_effect($effect[Human-Weird Thing Hybrid]) != 2147483647)
	{
		print("DNA Hybridization failed, perhaps it was due to ML which is annoying us right now.", "red");
	}
	return true;
}

boolean dna_generic()
{
	if(!is_unrestricted($item[Little Geneticist DNA-Splicing Lab]))
	{
		return false;
	}
	if(get_property("dnaSyringe") == $phylum[none])
	{
		return false;
	}

	boolean[phylum] potion;

	if(cc_my_path() == "standard")
	{
		switch(my_daycount())
		{
		case 1:			potion = $phylums[construct, construct, humanoid];	break;
		case 2:			potion = $phylums[dude, constellation, humanoid];	break;
		case 3:			potion = $phylums[dude, constellation, plant];		break;
		default:		potion = $phylums[humanoid, construct, dude];		break;
		}
	}
	else if(cc_my_path() == "Heavy Rains")
	{
		switch(my_daycount())
		{
		case 1:			potion = $phylums[construct, construct, fish];		break;
		case 2:			potion = $phylums[fish, constellation, dude];		break;
		case 3:			potion = $phylums[construct, humanoid, dude];		break;
		default:		potion = $phylums[humanoid, construct, dude];		break;
		}
	}
	else if(cc_my_path() == "Community Service")
	{
		switch(my_daycount())
		{
		case 1:			potion = $phylums[beast, pirate, elemental];		break;
		case 2:			potion = $phylums[construct, dude, humanoid];		break;
		default:		potion = $phylums[humanoid, construct, dude];		break;
		}
	}
	else
	{
		switch(my_daycount())
		{
		case 1:			potion = $phylums[construct, construct, fish];		break;
		case 2:			potion = $phylums[fish, constellation, dude];		break;
		case 3:			potion = $phylums[construct, humanoid, dude];		break;
		default:		potion = $phylums[humanoid, construct, dude];		break;
		}
	}

	int i = 0;
	foreach phy in potion
	{
		if((get_property("dnaSyringe") == phy) && (get_property("_dnaPotionsMade").to_int() == i))
		{
			cli_execute("camp dnapotion");
		}
		i = i + 1;
	}


	return false;
}


boolean dna_sorceressTest()
{
	# FIXME: Can we do this earlier? This isn't even all that useful, to be fair.
	# When is the last time we encounter each of these types?
	if(!is_unrestricted($item[Little Geneticist DNA-Splicing Lab]))
	{
		return false;
	}
	if(get_property("dnaSyringe") == $phylum[none])
	{
		return false;
	}
	if(my_level() < 13)
	{
		return false;
	}
	if(get_property("_dnaPotionsMade").to_int() >= 3)
	{
		return false;
	}
	if(get_property("choiceAdventure1003").to_int() < 3)
	{
		return false;
	}
	if((get_property("nsChallenge2") == "") && (get_property("telescopeUpgrades").to_int() >= 2))
	{
		ns_crowd3();
	}

	if((get_property("dnaSyringe") == $phylum[plant]) && (get_property("nsChallenge2") == $element[cold]) && (item_amount($item[Gene Tonic: Plant]) == 0))
	{
		boolean temp = cli_execute("camp dnainject");
	}
	else if((get_property("dnaSyringe") == $phylum[demon]) && (get_property("nsChallenge2") == $element[hot]) && (item_amount($item[Gene Tonic: Demon]) == 0))
	{
		boolean temp = cli_execute("camp dnainject");
	}
	else if((get_property("dnaSyringe") == $phylum[slime]) && (get_property("nsChallenge2") == $element[sleaze]) && (item_amount($item[Gene Tonic: Slime]) == 0))
	{
		boolean temp = cli_execute("camp dnainject");
	}
	else if((get_property("dnaSyringe") == $phylum[undead]) && (get_property("nsChallenge2") == $element[spooky]) && (item_amount($item[Gene Tonic: Undead]) == 0))
	{
		boolean temp = cli_execute("camp dnainject");
	}
	else if((get_property("dnaSyringe") == $phylum[hobo]) && (get_property("nsChallenge2") == $element[stench]) && (item_amount($item[Gene Tonic: Hobo]) == 0))
	{
		boolean temp = cli_execute("camp dnainject");
	}

	return false;
}

boolean dna_bedtime()
{
	if(!is_unrestricted($item[Little Geneticist DNA-Splicing Lab]))
	{
		return false;
	}
	if(get_property("dnaSyringe") == $phylum[none])
	{
		return false;
	}
	if(get_campground() contains $item[Little Geneticist DNA-Splicing Lab])
	{
		while(get_property("_dnaPotionsMade").to_int() < 3)
		{
			boolean temp = cli_execute("camp dnapotion");
		}
	}
	return false;
}