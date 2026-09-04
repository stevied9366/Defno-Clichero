extends TextureRect

@export var gold: int = 0
var lifetimeGold = 0
var tempGold

@export var prestigeGold = 0
var prestigeGoldGain = len(str(gold)) - 6

# Monster in the middle to click
# Clicking makes gold
# Heroes can be hired to auto hit the monster, generating gold
# Start out with warriors, higher DPS attracts different heroes
# DPS is an upgrade for a hero that effects gold generation multipliers
# Stronger monsters can be fought only if the heroes have a high enough DPS
	# How do I lock monsters behind DPS and/or unit requirements?

# Display units fighting monster (# displayed depends on number of digits of generator level (1 = 1 displayed, 10 = 2 displayed, 100 = 3 displayed, etc
	# If unitLevel > 1
		# If unitLevel > 10
			# If unitLevel > 100
			
# Prestige
	# Can be based on gold gained and units purchased
		# Prestiging gold gives gold gain bonuses
			# Every number place past 1,000,000 gives 1 point
				# 10 million = 1 point, 100 million = 2, etc.\
			# Increase gold earned from all sources (total goldGained multiplied)
			# decrease cost of generators and upgrades (much lower than first bonus, but much cheaper)
			# Permanent click power increase
	
	# Unit prestiging
		# Make unit prestiging an upgrade
		# Prestige bonus for every 10 units
		#	Bonuses for each iteration of 10 (10 = .1, 20 = .25, 30 = .75, etc)
	
		# Prestiging units gives DPS/Cost bonuses
			# First bonus increases TotalDPS and reduces cost of generators (not upgrades)
			# Second bonus increases/decreases a specific stat
		
# Stop/Start unit attacks
# Some monsters are strong against some units
# Elemental type damage, being able to change it
# Achievements
#	Defeat Eyegor with only warriors

#	BaseCost
#	CostMulti

# 	BaseIncomeRate
#	Threshold

var prestigeBonus1Level = 0
var prestigeBonus2Level = 0
var prestigeBonus3Level = 0

var prestigeBonus1Cost = 1 + 2.5 ** prestigeBonus1Level
var prestigeBonus2Cost = 1 + 1.5 ** prestigeBonus2Level
var prestigeBonus3Cost = 1 + 3.5 ** prestigeBonus3Level 

# unit levels
@export var warriorLevel = 0
var archerLevel = 0
var mageLevel = 0
var demoLevel = 0
var clericLevel = 0
var beastmasterLevel = 0
var draconicSorcererLevel = 0
var changelingLevel = 0
var monarchLevel = 0

# upgrade levels
var warriorUpgrade1Level = 0
var warriorUpgrade2Level = 0
var archerUpgrade1Level = 0
var archerUpgrade2Level = 0
var mageUpgrade1Level = 0
var mageUpgrade2Level = 0
var demoUpgrade1Level = 0
var demoUpgrade2Level = 0
var clericUpgrade1Level = 0
var clericUpgrade2Level = 0
var beastmasterUpgrade1Level = 0
var beastmasterUpgrade2Level = 0
var draconicSorcererUpgrade1Level = 0
var draconicSorcererUpgrade2Level = 0
var changelingUpgrade1Level = 0
var changelingUpgrade2Level = 0
var monarchUpgrade1Level = 0
var monarchUpgrade2Level = 0

# generator costs
var warriorCost = \
		(10 * (1 - (.02 * warriorUpgrade2Level))) ** (1 + .07 * warriorLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
var archerCost = \
		50 ** (1 + .08 * archerLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
var mageCost = \
		250 ** (1 + .09 * mageLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
var demoCost = \
		1000 ** (1 + .1 * demoLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
var clericCost = \
		2500 ** (1 + .11 * clericLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
var beastmasterCost = \
		5000 ** (1 + 0.12 * beastmasterLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
var draconicSorcererCost = \
		10000 ** (1 + 0.13 * draconicSorcererLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
var changelingCost = \
		25000 ** (1 + 0.14 * changelingLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
var monarchCost = \
		100000 ** (1 + 0.15 * monarchLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))

# upgrade costs - generator cost * 2.5/5
var warriorUpgrade1Cost = (25 * (1 - (.01 * warriorUpgrade2Level))) ** (1 + .07 * warriorUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
var warriorUpgrade2Cost = (50 * (1 - (.01 * warriorUpgrade2Level))) ** (1 + .09 * warriorUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
var archerUpgrade1Cost = 125 ** (1 + .08 * archerUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
var archerUpgrade2Cost = 250 ** (1 + .1 * archerUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
var mageUpgrade1Cost = 625 ** (1 + .09 * mageUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
var mageUpgrade2Cost = 1250 ** (1 + .1 * mageUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
var demoUpgrade1Cost = 2500 ** (1 + .09 * demoUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
var demoUpgrade2Cost = 5000 ** (1 + .12 * demoUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
var clericUpgrade1Cost = 6250 ** (1 + .1 * clericUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
var clericUpgrade2Cost = 12500 ** (1 + .11 * clericUpgrade2Level)  * (1 - (.02 * prestigeBonus2Level))
var beastmasterUpgrade1Cost = 12500 ** (1 + .11 * beastmasterUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
var beastmasterUpgrade2Cost = 25000 ** (1 + .13 * beastmasterUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
var draconicSorcererUpgrade1Cost = 25000 ** (1 + .14 * draconicSorcererUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
var draconicSorcererUpgrade2Cost = 50000  ** (1 + .15 * draconicSorcererUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
var changelingUpgrade1Cost = 62500 ** (1 + .16 * changelingUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
var changelingUpgrade2Cost = 125000 ** (1 + .17 * changelingUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
var monarchUpgrade1Cost = 250000 ** (1 + .18 * monarchUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
var monarchUpgrade2Cost = 500000 ** (1 + .20 * monarchUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))

# dps rates
var warriorDPSRate = 2.5 * (1.0 + .1 * warriorUpgrade1Level) * (1 + .015 * mageUpgrade2Level) * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level) + (warriorLevel * .25 * clericUpgrade2Level)
var warriorTotalDPS = (warriorLevel + (1 * monarchUpgrade2Level)) * warriorDPSRate
var archerDPSRate = 5 * (1 + .25 * archerUpgrade1Level) * (1 + .015 * mageUpgrade2Level) * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level) + (archerLevel * .25 * clericUpgrade2Level)
var archerTotalDPS = (archerLevel + (1 * monarchUpgrade2Level)) * archerDPSRate
var mageDPSRate = 10 * (1 + .3 * mageUpgrade1Level) * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level) + (mageLevel * .25 * clericUpgrade2Level)
var mageTotalDPS = (mageLevel + (1 * monarchUpgrade2Level)) * mageDPSRate
var demoDPSRate = 25 * (1 + .35 * demoUpgrade1Level) * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level) + (demoLevel * .25 * clericUpgrade2Level)
var demoTotalDPS = (demoLevel + (1 * monarchUpgrade2Level)) * demoDPSRate
var clericDPSRate = 20 * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level)
var clericTotalDPS = (clericLevel + (1 * monarchUpgrade2Level)) * clericDPSRate
var beastmasterDPSRate = 40 * (1 + .05 * beastmasterUpgrade1Level) * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level)
var beastmasterTotalDPS = (beastmasterLevel + (1 * monarchUpgrade2Level)) * beastmasterDPSRate
var draconicSorcererDPSRate = 65 * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level)
var draconicSorcererTotalDPS = (draconicSorcererLevel + (1 * monarchUpgrade2Level)) * draconicSorcererDPSRate
var changelingDPSRate = 90 * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level)
var changelingTotalDPS = (changelingLevel + (1 * monarchUpgrade2Level)) * changelingDPSRate
var monarchDPSRate = 80 * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level)
var monarchTotalDPS = monarchLevel * monarchDPSRate

var warriorAscendPoints = 0
var archerAscendPoints = 0
var mageAscendPoints = 0
var demoAscendPoints = 0
var clericAscendPoints = 0
var beastmasterAscendPoints = 0
var draconicSorcererAscendPoints = 0
var changelingAscendPoints = 0
var monarchAscendPoints = 0

var clickUpgrade1Level = 0
var clickUpgrade1Cost = 100 ** (1 + .07 * clickUpgrade1Level)
var clickUpgrade2Level = 0
var clickUpgrade2Cost = 5000 ** (1 + .1 * clickUpgrade2Level)
var clickPower = (10 + clickUpgrade1Level + prestigeBonus3Level) * (1 + .25 * clickUpgrade2Level)

var tickSpeed = (1.0 - (.025 * demoUpgrade2Level) - (.01 * beastmasterUpgrade1Level)) # "Rate of attack"

var monsterGold = 1
var monsterHPReset = 0
var monsterHPMax = (100 + 100 * monsterFrame) * (1 - .015 * mageUpgrade2Level) * (1 - .02 * changelingUpgrade1Level)
var monsterHP = monsterHPMax
var HPResetMax = 300 + (.25 * clericUpgrade1Level) # iterated in delta process, ~5 seconds

func _ready():
	
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = tickSpeed
	add_child(timer)
	
	timer.timeout.connect(func():
		
		# update tick speed directly onto wait timer
		timer.wait_time = tickSpeed
		var totalDPS = ((warriorTotalDPS + archerTotalDPS + mageTotalDPS + demoTotalDPS + clericTotalDPS + beastmasterTotalDPS + draconicSorcererTotalDPS + changelingTotalDPS + monarchTotalDPS) * (1 +  .05 * archerUpgrade2Level) * (1 + .1 * monarchUpgrade1Level))
		if totalDPS < monsterHPMax:
			monsterHP -= totalDPS
			if monsterHP <= 0:
				monsterHP = monsterHPMax
				monsterHPReset = 0
				tempGold = floori((randi_range(1,(3 + draconicSorcererUpgrade1Level)) * monsterGold) * (1 + .01 * prestigeBonus1Level))
				gold += tempGold
				lifetimeGold += tempGold
				$MonsterButton/GoldGainedLabel.text = str(tempGold) + " gold!"
				
				print("Di Bugg: GoldGained: " + str(tempGold))
		# Upgrade if statement here...
		if totalDPS >= monsterHPMax:
			var l = floor(totalDPS/monsterHPMax)
			tempGold = (randi_range(1,(3 + draconicSorcererUpgrade1Level)) * monsterGold) * (1 + .01 * prestigeBonus1Level) * l
			gold += tempGold
			lifetimeGold += tempGold
			$MonsterButton/GoldGainedLabel.text = str(tempGold) + " gold!"
			print("Debug: OVERKILL!!!! By a multiple of... " + str(l))
	
		)

var monsterFrame: int = 0

var monster1 = "res://MonsterSprites/Monster1.png" # Slime
var monster2 = "res://MonsterSprites/Monster2.png" # Mork
var monster3 = "res://MonsterSprites/Monster3.png" # Imp
var monster4 = "res://MonsterSprites/Monster4.png" # Ghoul
var monster5 = "res://MonsterSprites/Monster5.png" # Living Painting
var monster6 = "res://MonsterSprites/Monster6.png" # Eyegor - Boss 1
var monster7 = "res://PlaceholderButtoneFrame.png" # PLACEHOLDER
var monster8 # how many monsters before pallete changes?

var monsterDic = {
	"0":monster1 , "1": monster2, "2": monster3, "3": monster4, "4": monster5, "5": monster6, 
	"6": monster7, "7": monster7, "8": monster7, "9": monster7, "10": monster7, 
	"11": monster7, "12": monster7, "13": monster7, "14": monster7, "15": monster7, 
	"16": monster7, "17": monster7, "18": monster7, "19": monster7, "20": monster7, 
	"21": monster7, "22": monster7, "23": monster7, "24": monster7, "25": monster7, 
	"26": monster7, "27": monster7, "28": monster7, "29": monster7, "30": monster7,
	"31": monster7, "32": monster7, "33": monster7, "34": monster7, "35": monster7,
	"36": monster7, "37": monster7, "38": monster7, "39": monster7, "40": monster7,
	"41": monster7, "42": monster7, "43": monster7, "44": monster7, "45": monster7,
	"46": monster7, "47": monster7, "48": monster7, "49": monster7, "50": monster7,
	}

var monsterNames = {
	monster1: "Slime", 
	monster2: "Mork", 
	monster3: "Imp", 
	monster4: "Ghoul", 
	monster5: "Living Painting", 
	monster6: "BOSS: Eyegor",
	monster7: "PLACEHOLDER"
	}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Reset monster's HP after ~5 sec (300 units in delta time)
	if monsterHP < monsterHPMax:
		monsterHPReset += 1
		if monsterHPReset >= HPResetMax:
			monsterHPReset = 0
			monsterHP = monsterHPMax

	$UnitLabel.text = \
		"Gold: " + str(_number_conversion(int(gold))) + \
		"\nLifetime Gold: " + str(_number_conversion(lifetimeGold)) + \
		"   Gold Prestige: " + str(prestigeGold) + \
		"\nTotal DPS: " + str((warriorTotalDPS + archerTotalDPS + mageTotalDPS + demoTotalDPS + clericTotalDPS + beastmasterTotalDPS + draconicSorcererTotalDPS + changelingTotalDPS + monarchTotalDPS) * (1 +  .05 * archerUpgrade2Level) * (1 + .1 * monarchUpgrade1Level))
	$MonsterLabel.text = \
		"Monster Name: " + monsterNames[monsterDic[str(monsterFrame)]] + \
		"\nMonster HP: " + str(monsterHP) + " // " + str(monsterHPMax)

	# Gold prestige based on how many digits of gold
	prestigeGoldGain = len(str(gold)) - 6

	if prestigeGoldGain >= 1:
		$GoldPrestigeLabel.visible = true
		$GoldPrestigeLabel.text = str(prestigeGoldGain)
	else:
		$GoldPrestigeLabel.visible = false
		
	if $PrestigeBonuses/PrestigeBonusMenu/PrestigeBonus1.is_hovered() == true:
		$PrestigeBonuses/PrestigeBonusMenu/PrestigeUpgradeDescrBox/PrestigeUpgradeDescrBoxText.text = \
			"+.1% more gold from all sources\nTotal Bonus: -" + str(0.1 * prestigeBonus1Level) + "%\nCost: " + str(prestigeBonus1Cost)
	if $PrestigeBonuses/PrestigeBonusMenu/PrestigeBonus2.is_hovered() == true:
		$PrestigeBonuses/PrestigeBonusMenu/PrestigeUpgradeDescrBox/PrestigeUpgradeDescrBoxText.text = \
			"-2% cost for Units and their Upgrades\nTotal Bonus: -" + str(2 * prestigeBonus2Level) + "%\nCost: " + str(prestigeBonus2Cost)
	if $PrestigeBonuses/PrestigeBonusMenu/PrestigeBonus3.is_hovered() == true:
		$PrestigeBonuses/PrestigeBonusMenu/PrestigeUpgradeDescrBox/PrestigeUpgradeDescrBoxText.text = \
			"+1 click power\nTotal Bonus: +" + str(prestigeBonus3Level) + "\nCost: " + str(prestigeBonus3Cost)
			
	$MonsterHealthFill.max_value = monsterHPMax
	$MonsterHealthFill.value = monsterHP
	$MonsterHealthFill/MonsterHPResetBar.value = monsterHPReset
	
	# Generator descriptors
		# warrior
	$HeroContainer/VBoxContainer/WarriorButton/WarriorDescr/WarriorDescrText.text  = "Warrior Level: " + str(warriorLevel + (1 * monarchUpgrade2Level)) + "\nCost: %.2f" % warriorCost + "\nWarrior DPS: " + str(warriorTotalDPS)
	if $HeroContainer/VBoxContainer/WarriorButton/WarriorPrestigeButton.is_hovered() == true:
		$HeroContainer/VBoxContainer/WarriorButton/WarriorDescr/WarriorDescrText.text = "Ascend your warriors!"
		# archer
	$HeroContainer/VBoxContainer/ArcherButton/ArcherDescr/ArcherDescrText.text = "Archer Level: " + str(archerLevel + (1 * monarchUpgrade2Level)) + "\nCost: %.2f" % archerCost + "\nArcher DPS: " + str(archerTotalDPS)
	if $HeroContainer/VBoxContainer/ArcherButton/ArcherPrestigeButton.is_hovered() == true:
		$HeroContainer/VBoxContainer/ArcherButton/ArcherDescr/ArcherDescrText.text = "Ascend your archers!"	
		#mage
	$HeroContainer/VBoxContainer/MageButton/MageDescr/MageDescrText.text = "Mage Level: " + str(mageLevel + (1 * monarchUpgrade2Level)) + "\nCost: %.2f" % mageCost + "\nMage DPS: " + str(mageTotalDPS)
	if 	$HeroContainer/VBoxContainer/MageButton/MagePrestigeButton.is_hovered() == true:
		$HeroContainer/VBoxContainer/MageButton/MageDescr/MageDescrText.text = "Ascend your mages!"
		# demo
	$HeroContainer/VBoxContainer/DemoButton/DemoDescr/DemoDescrText.text = "Demo Level: " + str(demoLevel + (1 * monarchUpgrade2Level)) + "\nCost: %.2f" % demoCost + "\nDemo DPS: " + str(demoTotalDPS)
	if $HeroContainer/VBoxContainer/DemoButton/DemoPrestigeButton.is_hovered() == true:
		$HeroContainer/VBoxContainer/DemoButton/DemoDescr/DemoDescrText.text = "Ascend your demos!"
		# cleric
	$HeroContainer/VBoxContainer/ClericButton/ClericDescr/ClericDescrText.text = "Cleric Level: " + str(clericLevel + (1 * monarchUpgrade2Level)) + "\nCost: %.2f" % clericCost + "\nCleric DPS: " + str(clericTotalDPS)
	if $HeroContainer/VBoxContainer/ClericButton/ClericPrestigeButton.is_hovered() == true:
		$HeroContainer/VBoxContainer/ClericButton/ClericDescr/ClericDescrText.text =  "Ascend your clerics!"
		# beastmaster
	$HeroContainer/VBoxContainer/BeastmasterButton/BeastmasterDescr/BeastmasterDescrText.text = "Beastmaster Level: " + str(beastmasterLevel + (1 * monarchUpgrade2Level)) + "\nCost: %.2f" % beastmasterCost + "\nBeastmaster DPS: " + str(beastmasterTotalDPS)
	if $HeroContainer/VBoxContainer/BeastmasterButton/BeastmasterPrestigeButton.is_hovered() == true:
		$HeroContainer/VBoxContainer/BeastmasterButton/BeastmasterDescr/BeastmasterDescrText.text =  "Ascend your beastmasters!"
		# draconic sorcerer
	$HeroContainer/VBoxContainer/DraconicSorcererButton/DraconicSorcererDescr/DraconicSorcererDescrText.text = "Draconic Sorcerer Level: " + str(draconicSorcererLevel + (1 * monarchUpgrade2Level)) + "\nCost: %.2f" % draconicSorcererCost + "\nDraconic Sorcerer DPS: " + str(draconicSorcererTotalDPS)
	if $HeroContainer/VBoxContainer/DraconicSorcererButton/DraconicSorcererPrestigeButton.is_hovered() == true:
		$HeroContainer/VBoxContainer/DraconicSorcererButton/DraconicSorcererDescr/DraconicSorcererDescrText.text =  "Ascend your Draconic Sorcerers!"
		# changeling
	$HeroContainer/VBoxContainer/ChangelingButton/ChangelingDescr/ChangelingDescrText.text = "Changeling Level: " + str(changelingLevel + (1 * monarchUpgrade2Level)) + "\nCost: %.2f" % changelingCost + "\nChangeling DPS: " + str(changelingTotalDPS)
	if $HeroContainer/VBoxContainer/ChangelingButton/ChangelingPrestigeButton.is_hovered() == true:
		$HeroContainer/VBoxContainer/ChangelingButton/ChangelingDescr/ChangelingDescrText.text =  "Ascend your changelings!"
		# monarch
	$HeroContainer/VBoxContainer/MonarchButton/MonarchDescr/MonarchDescrText.text = "Monarch Level: " + str(monarchLevel) + "\nCost: %.2f" % monarchCost + "\nMonarch DPS: " + str(monarchTotalDPS)
	if $HeroContainer/VBoxContainer/MonarchButton/MonarchPrestigeButton.is_hovered() == true:
		$HeroContainer/VBoxContainer/MonarchButton/MonarchDescr/MonarchDescrText.text =  "Ascend your monarchs!"
	
	# prev/next monster button fading
	#if monsterFrame == 0:					# commented out to use back arrow as debug (multiply 'gold' by 10)
		#$LastMonsterButton.visible = false
	elif monsterFrame + 1 == monsterDic.size():
		$NextMonsterButton.visible = false
	else:
		$NextMonsterButton.visible = true
		$LastMonsterButton.visible = true
	
	# Description box info
		# click upgrades
	if $UpgradeContainer/GridContainer/ClickUpgrade1.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Click Power\nUpgrade Level " + str(clickUpgrade1Level) + "\n+1 damage per click with each upgrade\nCost: %.2f" % clickUpgrade1Cost
	if $UpgradeContainer/GridContainer/ClickUpgrade2.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Click Multiplier\nUpgrade Level " + str(clickUpgrade2Level) + "\n+25%% damage per click with each upgrade\nCost: %.2f" % clickUpgrade2Cost
		# warrior upgrades
	if $UpgradeContainer/GridContainer/WarriorUpgrade1.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Sword Sharpener\nUpgrade Level " + str(warriorUpgrade1Level) + "\n+10%% damage per warrior with each upgrade\nCost: %.2f" % warriorUpgrade1Cost
	if $UpgradeContainer/GridContainer/WarriorUpgrade2.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Buy in Bulk\nUpgrade Level " + str(warriorUpgrade2Level) + "\n-2%% Warrior cost, -1%% Warrior Upgrade cost per level\nCost: %.2f" % warriorUpgrade2Cost
		# archer upgrades
	if $UpgradeContainer/GridContainer/ArcherUpgrade1.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Obsidian Tips\nUpgrade Level " + str(archerUpgrade1Level) + "\n+25%% damage per archer with each upgrade\nCost: %.2f" % archerUpgrade1Cost
	if $UpgradeContainer/GridContainer/ArcherUpgrade2.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Cover Fire\nUpgrade Level " + str(archerUpgrade2Level) + "\n+5%% total damage per upgrade (not shown on units)\nCost: %.2f" % archerUpgrade2Cost
		# mage upgrades
	if $UpgradeContainer/GridContainer/MageUpgrade1.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Dragoncore Wands\nUpgrade Level " + str(mageUpgrade1Level) + "\n+30%% mage damage per upgrade\nCost: %.2f" % mageUpgrade1Cost
	if $UpgradeContainer/GridContainer/MageUpgrade2.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Rust Armor\nUpgrade Level " + str(mageUpgrade2Level) + "\n-1.5%% max monster HP, and +1.5%% DPS for warriors and archers\nCost: %.2f" % mageUpgrade2Cost
		# demo upgrades
	if $UpgradeContainer/GridContainer/DemoUpgrade1.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Bombastic Kerplosions\nUpgrade Level " + str(demoUpgrade1Level) + "\n+35%% demo damage per upgrade\nCost: %.2f" % demoUpgrade1Cost
	if $UpgradeContainer/GridContainer/DemoUpgrade2.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Fire Under the Ass\nUpgrade Level " + str(demoUpgrade2Level) + "\n2.5%% faster attacks (tick speed)\nCost: %.2f" % demoUpgrade2Cost
		# cleric upgrades
	if $UpgradeContainer/GridContainer/ClericUpgrade1.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Healing\nUpgrade Level " + str(clericUpgrade1Level) + "\nHeal your heroes, giving them +20%% more time to attack\nCost: %.2f" % clericUpgrade1Cost
	if $UpgradeContainer/GridContainer/ClericUpgrade2.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Bless\nUpgrade Level " + str(clericUpgrade2Level) + "\n25%% more DPS per hero level, per upgrade level, for warriors, archers, mages, and demos.\nCost: %.2f" % clericUpgrade2Cost
		# beastmaster upgrades
	if $UpgradeContainer/GridContainer/BeastmasterUpgrade1.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Thrill of the Hunt\nUpgrade Level " + str(beastmasterUpgrade1Level) + "\nThe Beastmaster fuels your party with adrenaline. +1%% faster attacks (tick speed) and +5%% beastmaster DPS.\nCost: %.2f" % beastmasterUpgrade1Cost
	if $UpgradeContainer/GridContainer/BeastmasterUpgrade2.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Assemble the Horde\nUpgrade Level " + str(beastmasterUpgrade2Level) + "\nA call to arms accompanied by hawk screeching inspires troops to join. -1%% cost for all units per level.\nCost: %.2f" % beastmasterUpgrade2Cost
		# draconic sorcerer upgrades
	if $UpgradeContainer/GridContainer/DraconicSorcererUpgrade1.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Wild Magic\nUpgrade Level " + str (draconicSorcererUpgrade1Level) + "\nImprove the wild magic that turns monster corpses into currency! Base gold from monsters is now multiplied 1x to " + str(3 + draconicSorcererUpgrade1Level) + "x (Normally 1x - 3x).\nCost: %.2f" % draconicSorcererUpgrade1Cost
	if $UpgradeContainer/GridContainer/DraconicSorcererUpgrade2.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Dragonfire Enchantment\nUpgrade Level " + str(draconicSorcererUpgrade2Level) + "\nRed scales grow across the sorcerer's skin. +10%% Draconic Sorcerrer DPS and +5%% DPS for all other units per level.\nCost: %.2f" % draconicSorcererUpgrade2Cost 
		# changeling upgrades
	if $UpgradeContainer/GridContainer/ChangelingUpgrade1.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Improvise, Adapt, Overcome\nUpgrade Level " + str(changelingUpgrade1Level) + "\nChanging into the monsters helps the changelings learn their weaknesses -2%% Max Monster HP per level.\nCost: %.2f" % changelingUpgrade1Cost
	if $UpgradeContainer/GridContainer/ChangelingUpgrade2.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Strange Shape\nUpgrade Level " + str(changelingUpgrade2Level) + "\nThe changelings become part of each unit. All units cost -.1%% per upgrade level and get +.1%% DPS per warrior, archer, mage, demo, cleric, beastmaster, and draconic sorcerer, per upgrade level.\nTotal +/-: %.3f" % ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level) + "\nCost: %.2f" % changelingUpgrade2Cost
		# monarch upgrades
	if $UpgradeContainer/GridContainer/MonarchUpgrade1.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Divine Sight\nUpgrade Level " + str(monarchUpgrade1Level) + "\nAnnointed to lead by divinity, the monarch increases total DPS by 1%% per upgrade level. Also allows units to ascend!\nCost: %.2f" % monarchUpgrade1Cost
	if $UpgradeContainer/GridContainer/MonarchUpgrade2.is_hovered() == true:
		$TempDescrBox/TempDescrBox.text = "Arm Your Forces\nUpgrade Level " + str(monarchUpgrade2Level) + "\nThe Monarch leads his army effectively. +1 level for all units (except the monarch) per upgrade level.\nCost: %.2f" % monarchUpgrade2Cost
	
# Unit button and upgrades

	# Warrior button and upgrades

func _on_warrior_button_pressed() -> void:
	if gold >= warriorCost:
		gold -= warriorCost
		warriorLevel += 1 
		_generator_purchase()
		if warriorLevel >= 1:
			$HeroContainer/VBoxContainer/ArcherButton.show()
			$UpgradeContainer/GridContainer/WarriorUpgrade1.show()
			$UpgradeContainer/GridContainer/WarriorUpgrade2.show()
		
func _on_warrior_upgrade_1_pressed() -> void:	# Increases warrior DPS
	if gold >= warriorUpgrade1Cost:
		gold -= warriorUpgrade1Cost
		warriorUpgrade1Level += 1
		_costs_update(warriorUpgrade1Cost)
		_dps_update(warriorTotalDPS)

func _on_warrior_upgrade_2_pressed() -> void:	# Decreases cost of warriors and warrior upgrades
	if gold >= warriorUpgrade2Cost:
		gold -= warriorUpgrade2Cost
		warriorUpgrade2Level += 1
		_costs_update(warriorCost)
		_costs_update(warriorUpgrade1Cost)
		_costs_update(warriorUpgrade2Cost)
		
	# Archer button and upgrades

func _on_archer_button_pressed() -> void:
	if gold >= archerCost:
		gold -= archerCost
		archerLevel += 1
		_generator_purchase()
		if archerLevel >= 1:
			$HeroContainer/VBoxContainer/MageButton.show()
			$UpgradeContainer/GridContainer/ArcherUpgrade1.show()
			$UpgradeContainer/GridContainer/ArcherUpgrade2.show()

func _on_archer_upgrade_1_pressed() -> void:	# Increases archer DPS
	if gold >= archerUpgrade1Cost:
		gold -= archerUpgrade1Cost
		archerUpgrade1Level += 1
		_costs_update(archerUpgrade1Cost)
		_dps_update(archerTotalDPS)

func _on_archer_upgrade_2_pressed() -> void:	 # Increase total DPS
	if gold >= archerUpgrade2Cost:
		gold -= archerUpgrade2Cost
		archerUpgrade2Level += 1
		_costs_update(archerUpgrade2Cost)

	# Mage button and upgrades

func _on_mage_button_pressed() -> void:
	if gold >= mageCost:
		gold -= mageCost
		mageLevel += 1
		_generator_purchase()
		if mageLevel >= 1:
			$HeroContainer/VBoxContainer/DemoButton.show()
			$UpgradeContainer/GridContainer/MageUpgrade1.show()
			$UpgradeContainer/GridContainer/MageUpgrade2.show()

func _on_mage_upgrade_1_pressed() -> void:	# Increases mage DPS
	if gold >= mageUpgrade1Cost:
		gold -= mageUpgrade1Cost
		mageUpgrade1Level += 1
		_costs_update(mageUpgrade1Cost)
		_dps_update(mageTotalDPS)

func _on_mage_upgrade_2_pressed() -> void: # Reduces enemy max HP, Increases DPS of warriors and archers
	if gold >= mageUpgrade2Cost:
		gold -= mageUpgrade2Cost
		mageUpgrade2Level += 1
		_costs_update(mageUpgrade2Cost)
		_monster_stat_update(monsterFrame)
		_dps_update(warriorTotalDPS)
		_dps_update(archerTotalDPS)

	# demo button and upgrades

func _on_demo_button_pressed() -> void:
	if gold >= demoCost:
		gold -= demoCost
		demoLevel += 1
		_generator_purchase()
		if demoLevel >= 1:
			$HeroContainer/VBoxContainer/ClericButton.show()
			$UpgradeContainer/GridContainer/DemoUpgrade1.show()
			$UpgradeContainer/GridContainer/DemoUpgrade2.show()

func _on_demo_upgrade_1_pressed() -> void:	# Increases demo DPS
	if gold >= demoUpgrade1Cost:
		gold -= demoUpgrade1Cost
		demoUpgrade1Level += 1
		_costs_update(demoUpgrade1Cost)
		_dps_update(demoTotalDPS)

func _on_demo_upgrade_2_pressed() -> void:	# Increases tick speed
	if gold >= demoUpgrade2Cost:
		gold -= demoUpgrade2Cost
		demoUpgrade2Level += 1
		_costs_update(demoUpgrade2Cost)
		_stats_update(tickSpeed)

	# cleric button and upgrades

func _on_cleric_button_pressed() -> void:
	if gold >= clericCost:
		gold -= clericCost
		clericLevel += 1
		_generator_purchase()
		if clericLevel >= 1:
			$HeroContainer/VBoxContainer/BeastmasterButton.show()
			$UpgradeContainer/GridContainer/ClericUpgrade1.show()
			$UpgradeContainer/GridContainer/ClericUpgrade2.show()

func _on_cleric_upgrade_1_pressed() -> void:	# "Healing" Increases amount of time you have to kill monster
	if gold >= clericUpgrade1Cost:
		gold -= clericUpgrade1Cost
		clericUpgrade1Level += 1
		_costs_update(clericUpgrade1Cost)
		_stats_update(HPResetMax)

func _on_cleric_upgrade_2_pressed() -> void:	# Buff heroes, + .25 DPS per hero level
	if gold >= clericUpgrade2Cost:
		gold -= clericUpgrade2Cost
		clericUpgrade2Level += 1
		_costs_update(clericUpgrade2Cost)
		_dps_update(warriorTotalDPS)
		_dps_update(archerTotalDPS)
		_dps_update(mageTotalDPS)
		_dps_update(demoTotalDPS)

	# beastmaster button and upgrades

func _on_beastmaster_button_pressed() -> void:
	if gold >= beastmasterCost:
		gold -= beastmasterCost
		beastmasterLevel += 1
		_generator_purchase()
		if beastmasterLevel >= 1:
			$HeroContainer/VBoxContainer/DraconicSorcererButton.show()
			$UpgradeContainer/GridContainer/BeastmasterUpgrade1.show()
			$UpgradeContainer/GridContainer/BeastmasterUpgrade2.show()

func _on_beastmaster_upgrade_1_pressed() -> void:	# tick speed increase, beastmaster DPS increase
	if gold >= beastmasterUpgrade1Cost:
		gold -= beastmasterUpgrade1Cost
		beastmasterUpgrade1Level += 1
		_costs_update(beastmasterUpgrade1Cost)
		_stats_update(tickSpeed)
		_dps_update(beastmasterTotalDPS)
	
func _on_beastmaster_upgrade_2_pressed() -> void: # 10% off unit costs
	if gold >= beastmasterUpgrade2Cost:
		gold -= beastmasterUpgrade2Cost
		beastmasterUpgrade2Level += 1
		_costs_update(beastmasterUpgrade2Cost)
		_costs_update(warriorCost)
		_costs_update(archerCost)
		_costs_update(mageCost)
		_costs_update(demoCost)
		_costs_update(beastmasterCost)
		_costs_update(draconicSorcererCost)
		_costs_update(changelingCost)
		_costs_update(monarchCost)
		
	# draconic sorcerer button and upgrades

func _on_draconic_sorcerer_button_pressed() -> void:
	if gold >= draconicSorcererCost:
		gold -= draconicSorcererCost
		draconicSorcererLevel += 1
		_generator_purchase()
		if draconicSorcererLevel >= 1:
			$HeroContainer/VBoxContainer/ChangelingButton.show()
			$UpgradeContainer/GridContainer/DraconicSorcererUpgrade1.show()
			$UpgradeContainer/GridContainer/DraconicSorcererUpgrade2.show()

func _on_draconic_sorcerer_upgrade_1_pressed() -> void: # increases monster gold range from [1 to 3] to [1 to 3 + level]
	if gold >= draconicSorcererUpgrade1Cost:
		gold -= draconicSorcererUpgrade1Cost
		draconicSorcererUpgrade1Level += 1
		_costs_update(draconicSorcererUpgrade1Cost)

func _on_draconic_sorcerer_upgrade_2_pressed() -> void: # increases DS DPS and other units DPS
	if gold >= draconicSorcererUpgrade2Cost:
		gold -= draconicSorcererUpgrade2Cost
		draconicSorcererUpgrade2Level += 1
		_costs_update(draconicSorcererUpgrade2Cost)
		_dps_update(warriorTotalDPS)
		_dps_update(archerTotalDPS)
		_dps_update(mageTotalDPS)
		_dps_update(demoTotalDPS)
		_dps_update(clericTotalDPS)
		_dps_update(beastmasterTotalDPS)
		_dps_update(draconicSorcererTotalDPS)
		_dps_update(changelingTotalDPS)
		_dps_update(monarchTotalDPS)

	# changeling button and upgrades

func _on_changeling_button_pressed() -> void:
	if gold >= changelingCost:
		gold -= changelingCost
		changelingLevel += 1
		_generator_purchase()
		if changelingLevel >= 1:
			$HeroContainer/VBoxContainer/MonarchButton.show()
			$UpgradeContainer/GridContainer/ChangelingUpgrade1.show()
			$UpgradeContainer/GridContainer/ChangelingUpgrade2.show()
	
func _on_changeling_upgrade_1_pressed() -> void: # -2% to monster max HP per upgrade level
	if gold >= changelingUpgrade1Cost:
		gold -= changelingUpgrade1Cost
		changelingUpgrade1Level += 1
		_monster_stat_update(monsterFrame)

func _on_changeling_upgrade_2_pressed() -> void: # For every other warrior, archer, mage, demo, cleric, beastmaster, and DS, -.1% cost and +.1% DPS to all units
	if gold >= changelingUpgrade2Cost:
		gold -= changelingUpgrade2Cost
		changelingUpgrade2Level += 1
		_costs_update(warriorCost)
		_costs_update(archerCost)
		_costs_update(mageCost)
		_costs_update(demoCost)
		_costs_update(clericCost)
		_costs_update(beastmasterCost)
		_costs_update(draconicSorcererCost)
		_dps_update(warriorTotalDPS)
		_dps_update(archerTotalDPS)
		_dps_update(mageTotalDPS)
		_dps_update(demoTotalDPS)
		_dps_update(clericTotalDPS)
		_dps_update(beastmasterTotalDPS)
		_dps_update(draconicSorcererTotalDPS)
		_dps_update(changelingTotalDPS)
		_dps_update(monarchTotalDPS)

	# monarch button and upgrades

func _on_monarch_button_pressed() -> void:
	if gold >= monarchCost:
		gold -= monarchCost
		monarchLevel += 1
		_generator_purchase()
		if monarchLevel >= 1:
			$UpgradeContainer/GridContainer/MonarchUpgrade1.show()
			$UpgradeContainer/GridContainer/MonarchUpgrade2.show()

func _on_monarch_upgrade_1_pressed() -> void: #  +1% total DPS, activate ascension
	if gold >= monarchUpgrade1Cost:
		gold -= monarchUpgrade1Cost
		monarchUpgrade1Level += 1
		_costs_update(monarchUpgrade1Cost)
		_ascension_buttons()

func _on_monarch_upgrade_2_pressed() -> void:	# +1 level to all other units per upgrade level
	if gold >= monarchUpgrade2Cost:
		gold -= monarchUpgrade2Cost
		monarchUpgrade2Level += 1
		_costs_update(monarchUpgrade2Cost)
		_generator_purchase()

	# click upgrades

func _on_click_upgrade_1_pressed() -> void:
	if gold >= clickUpgrade1Cost:
		gold -= clickUpgrade1Cost
		clickUpgrade1Level += 1
		_costs_update(clickUpgrade1Cost)
		_stats_update(clickPower)

func _on_click_upgrade_2_pressed() -> void:
	if gold >= clickUpgrade2Cost:
		gold -= clickUpgrade2Cost
		clickUpgrade2Level += 1
		_costs_update(clickUpgrade2Cost)
		_stats_update(clickPower)
		

func _on_monster_button_pressed() -> void:
	
	if clickPower < monsterHPMax:
			monsterHP -= clickPower
			if monsterHP <= 0:
				monsterHP = monsterHPMax
				monsterHPReset = 0
				tempGold = (randi_range(1,(3 + draconicSorcererUpgrade1Level)) * monsterGold) * (1 + .01 * prestigeBonus1Level)
				print("Click Gold Gain: " + str(tempGold))
				gold += tempGold
				lifetimeGold += tempGold
				$MonsterButton/GoldGainedLabel.text = str(tempGold) + " gold!"
	
	if clickPower >= monsterHPMax:
		var n = floor(clickPower/monsterHPMax)
		tempGold = (randi_range(1,(3 + draconicSorcererUpgrade1Level)) * monsterGold) * (1 + .01 * prestigeBonus1Level) * n
		gold += tempGold
		lifetimeGold += tempGold
		$MonsterButton/GoldGainedLabel.text = str(tempGold) + " gold!\nOVERKILL!!!! By a multiple of... " + str(n)
			
# Set monster HP & Max, adjust gold given for defeating
func _on_last_monster_button_pressed() -> void:
	if monsterFrame > 0:
		var x = monsterFrame - 1
		monsterFrame = x
		$MonsterButton/MonsterSprite.set_texture(ResourceLoader.load(monsterDic[str(x)]))
		_monster_stat_update(x)
		monsterHPReset = 0
	else:
		gold *= 10		# DEBUG
		lifetimeGold *= 10 	# DEBUG
		print(prestigeGoldGain)
		print("Fail son")

func _on_next_monster_button_pressed() -> void:
	if (monsterFrame + 1) < monsterDic.size():
		var x = monsterFrame + 1
		monsterFrame = x
		$MonsterButton/MonsterSprite.set_texture(ResourceLoader.load(monsterDic[str(x)]))
		_monster_stat_update(x)
		monsterHPReset = 0
		print("monsterDic: " + str(x) + "\nmonsterFrame: " + str(monsterFrame))
	else:
		print("Fail son")

# Updates monster stats, bosses every 5 monsters, major bosses every 25, god bosses every 100
func _monster_stat_update(monsterFrame):
	if monsterFrame == 0:		# HP Max 1
		monsterHPMax = 100 * (1 - .015 * mageUpgrade2Level) * (1 - .02 * changelingUpgrade1Level)
		monsterHP = monsterHPMax
		monsterGold = 1
	
	if monsterFrame % 5 != 0 && monsterFrame != 0: # HP Max 2
		monsterHPMax = (100 + 100 * monsterFrame) * (1 - .015 * mageUpgrade2Level) * (1 - .02 * changelingUpgrade1Level)
		monsterHP = monsterHPMax
		monsterGold = 1 +  1 * monsterFrame
		
	if monsterFrame % 5 == 0 && monsterFrame != 0: # HP Max 3
		monsterHPMax = (250 * monsterFrame) * (1 - .015 * mageUpgrade2Level) * (1 - .02 * changelingUpgrade1Level)
		monsterHP = monsterHPMax
		monsterGold = 5 * monsterFrame
		
	if monsterFrame % 10 == 0 && monsterFrame != 0: # HP Max 4
		monsterHPMax = (1000 * monsterFrame) * (1 - .015 * mageUpgrade2Level) * (1 - .02 * changelingUpgrade1Level)
		monsterHP = monsterHPMax
		monsterGold = 12 * monsterFrame

func _on_gold_prestige_button_pressed() -> void:
	if prestigeGoldGain >= 1:
		prestigeGold += prestigeGoldGain
		gold = 0

# Prestige bonuses menu visibility
func _on_prestige_bonuses_pressed() -> void:
	if $PrestigeBonuses/PrestigeBonusMenu.visible == false:
		$PrestigeBonuses/PrestigeBonusMenu.visible = true
	elif $PrestigeBonuses/PrestigeBonusMenu.visible == true:
		$PrestigeBonuses/PrestigeBonusMenu.visible = false
		
func _on_prestige_bonus_1_pressed() -> void:	# Increase gold earned from all sources (total goldGained multiplied)
	if prestigeGold >= prestigeBonus1Cost:
		prestigeGold -= prestigeBonus1Cost 
		prestigeBonus1Level += 1
		_costs_update(prestigeBonus1Cost)
		
func _on_prestige_bonus_2_pressed() -> void:	# decrease cost of generators and upgrades (much lower than first bonus, but much cheaper)
	if prestigeGold >= prestigeBonus2Cost:
		prestigeGold -= prestigeBonus2Cost 
		prestigeBonus2Level += 1
		_costs_update(prestigeBonus2Cost)
		# warrior and upgrades
		_costs_update(warriorCost)
		_costs_update(warriorUpgrade1Cost)
		_costs_update(warriorUpgrade2Cost)
		# archer and upgrades
		_costs_update(archerCost)
		_costs_update(archerUpgrade1Cost)
		_costs_update(archerUpgrade2Cost)
		# mage and upgrades
		_costs_update(mageCost)
		_costs_update(mageUpgrade1Cost)
		_costs_update(mageUpgrade2Cost)
		# demo and upgrades
		_costs_update(demoCost)
		_costs_update(demoUpgrade1Cost)
		_costs_update(demoUpgrade2Cost)
		# cleric and upgrades
		_costs_update(clericCost)
		_costs_update(clericUpgrade1Cost)
		_costs_update(clericUpgrade2Cost)
		# beastmaster and upgrades
		_costs_update(beastmasterCost)
		_costs_update(beastmasterUpgrade1Cost)
		_costs_update(beastmasterUpgrade2Cost)
		# dra sor variables
		_costs_update(draconicSorcererCost)
		_costs_update(draconicSorcererUpgrade1Cost)
		_costs_update(draconicSorcererUpgrade2Cost)
		# changeling variables
		_costs_update(changelingCost)
		_costs_update(changelingUpgrade1Cost)
		_costs_update(changelingUpgrade2Cost)
		# monarch variables
		_costs_update(monarchCost)
		_costs_update(monarchUpgrade1Cost)
		_costs_update(monarchUpgrade2Cost)
		
func _on_prestige_bonus_3_pressed() -> void:	# Permanent click power increase
	if prestigeGold >= prestigeBonus3Cost:
		prestigeGold -= prestigeBonus3Cost 
		prestigeBonus3Level += 1
		_stats_update(clickPower)
		_costs_update(prestigeBonus3Cost)
		
# number conversion function
# If number is over 'x' digits long, make an exponent and divide the number down
# How do I make it revert when number goes down?
func _number_conversion(number):
	var exponent = len(str(number - 2))
	if len(str(number)) <= 6:
		return(number)
	if len(str(number)) > 6:
		number = number / float(10 ** exponent - 1)
		if number < 1:
			number *= 10
			exponent -= 1
		return(("%.2f" % number) + "e" + str(exponent))

# Save game variables to a JSON text file
func _save_game():
	var save_file = FileAccess.open("res://savegame.save", FileAccess.WRITE)

	var save_dict = {
		
			"filename" : get_scene_file_path(),
			"parent" : get_parent().get_path(),
			
			"gold" : gold,
			"lifetimeGold" : lifetimeGold,
			"prestigeGold" : prestigeGold,
			"prestigeGoldGain" : prestigeGoldGain,
			"prestigeBonus1Level" : prestigeBonus1Level,
			"prestigeBonus2Level" : prestigeBonus2Level,
			"prestigeBonus3Level" : prestigeBonus3Level,
			"prestigeBonus1Cost" : prestigeBonus1Cost,
			"prestigeBonus2Cost" : prestigeBonus2Cost,
			"prestigeBonus3Cost" : prestigeBonus3Cost,
			
			"monsterGold" : monsterGold,
			"tickSpeed" : tickSpeed, # attack rate
			"HPResetMax" : HPResetMax,
			"monsterFrame" : monsterFrame,
			"monsterHPMax" : monsterHPMax,
			"monsterHP" : monsterHP,

			"clickPower" : clickPower,
			"clickUpgrade1Level" : clickUpgrade1Level,
			"clickUpgrade2Level" : clickUpgrade2Level,
			"clickUpgrade1Cost" : clickUpgrade1Cost,
			"clickUpgrade2Cost" : clickUpgrade2Cost,

			"warriorLevel" : warriorLevel,
			"warriorCost" : warriorCost,
			"warriorUpgrade1Level" : warriorUpgrade1Level,
			"warriorUpgrade2Level" : warriorUpgrade2Level,
			"warriorUpgrade1Cost" : warriorUpgrade1Cost,
			"warriorUpgrade2Cost" : warriorUpgrade2Cost,
			"warriorDPSRate" : warriorDPSRate,
			"warriorTotalDPS" : warriorTotalDPS,

			"archerLevel" : archerLevel,
			"archerCost" : archerCost,
			"archerUpgrade1Level" : archerUpgrade1Level,
			"archerUpgrade2Level" : archerUpgrade2Level,
			"archerUpgrade1Cost" : archerUpgrade1Cost,
			"archerUpgrade2Cost" : archerUpgrade2Cost,
			"archerDPSRate" : archerDPSRate,
			"archerTotalDPS" : archerTotalDPS,

			"mageLevel" : mageLevel,
			"mageCost" : mageCost,
			"mageUpgrade1Level" : mageUpgrade1Level,
			"mageUpgrade2Level" : mageUpgrade2Level,
			"mageUpgrade1Cost" : mageUpgrade1Cost,
			"mageUpgrade2Cost" : mageUpgrade2Cost,
			"mageDPSRate" : mageDPSRate,
			"mageTotalDPS" : mageTotalDPS,

			"demoLevel" : demoLevel,
			"demoCost" : demoCost,
			"demoUpgrade1Level" : demoUpgrade1Level,
			"demoUpgrade2Level" : demoUpgrade2Level,
			"demoUpgrade1Cost" : demoUpgrade1Cost,
			"demoUpgrade2Cost" : demoUpgrade2Cost,
			"demoDPSRate" : demoDPSRate,
			"demoTotalDPS" : demoTotalDPS,

			"clericLevel" : clericLevel,
			"clericCost" : clericCost,
			"clericUpgrade1Level" : clericUpgrade1Level,
			"clericUpgrade2Level" : clericUpgrade2Level,
			"clericUpgrade1Cost" : clericUpgrade1Cost,
			"clericUpgrade2Cost" : clericUpgrade2Cost,
			"clericDPSRate" : clericDPSRate,
			"clericTotalDPS" : clericTotalDPS,
			
			"beastmasterLevel" : beastmasterLevel,
			"beastmasterCost" : beastmasterCost,
			"beastmasterUpgrade1Level" : beastmasterUpgrade1Level,
			"beastmasterUpgrade2Level" : beastmasterUpgrade2Level,
			"beastmasterUpgrade1Cost" : beastmasterUpgrade1Cost,
			"beastmasterUpgrade2Cost" : beastmasterUpgrade2Cost,
			"beastmasterDPSRate" : beastmasterDPSRate,
			"beastmasterTotalDPS" : beastmasterTotalDPS,
			
			"draconicSorcererLevel" : draconicSorcererLevel,
			"draconicSorcererCost" : draconicSorcererCost,
			"draconicSorcererUpgrade1Level" : draconicSorcererUpgrade1Level,
			"draconicSorcererUpgrade2Level" : draconicSorcererUpgrade2Level,
			"draconicSorcererUpgrade1Cost" : draconicSorcererUpgrade1Cost,
			"draconicSorcererUpgrade2Cost" : draconicSorcererUpgrade2Cost,
			"draconicSorcererDPSRate" : draconicSorcererDPSRate,
			"draconicSorcererTotalDPS" : draconicSorcererTotalDPS,
			
			# changeling variables
			"changelingLevel" : changelingLevel,
			"changelingCost" : changelingCost,
			"changelingUpgrade1Level" : changelingUpgrade1Level,
			"changelingUpgrade2Level" : changelingUpgrade2Level,
			"changelingUpgrade1Cost" : changelingUpgrade1Cost,
			"changelingUpgrade2Cost" : changelingUpgrade2Cost,
			"changelingDPSRate" : changelingDPSRate,
			"changelingTotalDPS" : changelingTotalDPS,
			
			# monarch variables
			"monarchLevel" : monarchLevel,
			"monarchCost" : monarchCost,
			"monarchUpgrade1Level" : monarchUpgrade1Level,
			"monarchUpgrade2Level" : monarchUpgrade2Level,
			"monarchUpgrade1Cost" : monarchUpgrade1Cost,
			"monarchUpgrade2Cost" : monarchUpgrade2Cost,
			"monarchDPSRate" : monarchDPSRate,
			"monarchTotalDPS" : monarchTotalDPS,
		
	}

	var json_save_dict = JSON.stringify(save_dict)
	save_file.store_line(json_save_dict)

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		print("Quit detected")
		_save_game()
		# track time quit here, in load game, track time then, subtract, provide player with offline gains
		get_tree().quit() # default behavior

# Loading system
# parses each line from JSON save file, sets the variable to the value
# TO-DO: Encrypt the lines so users can't easily edit the variables (Why? Let 'em cheat)
func _load_game():
	var save_file = FileAccess.open("res://savegame.save", FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_dict_string = save_file.get_line()
	
		var json =  JSON.new()
		
		var parse_result = json.parse(json_dict_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_dict_string, " at line ", json.get_error_line())
			continue
		
		# Loads JSON dictionary and parses each line, then sets the variables to their respective values
		var save_data = json.data
		
		for i in save_data.keys():
			if i != "parent" && i != "filename":
				print(i + ":" + str(save_data[i]))
				set(i, save_data[i])

func _save_game_reset():
	# Confirmation message first, then...
	# Reset variables to base state ('0' or OG formula)
	gold = 0
	lifetimeGold = 0
	# Prestige Reset
	prestigeGold = 0
	prestigeGoldGain = 0
	
	prestigeBonus1Level = 0
	prestigeBonus2Level = 0
	prestigeBonus3Level = 0
	# Levels and Upgrades Reset First
	
	clickUpgrade1Level = 0
	clickUpgrade2Level = 0
	
	_costs_update(prestigeBonus1Cost)
	_costs_update(prestigeBonus2Cost)
	_costs_update(prestigeBonus3Cost)
	
	warriorLevel = 0
	warriorUpgrade1Level = 0
	warriorUpgrade2Level = 0
	
	archerLevel = 0
	archerUpgrade1Level = 0
	archerUpgrade2Level = 0
	
	mageLevel = 0
	mageUpgrade1Level = 0
	mageUpgrade2Level = 0
	
	demoLevel = 0
	demoUpgrade1Level = 0
	demoUpgrade2Level = 0
	
	clericLevel = 0
	clericUpgrade1Level = 0
	clericUpgrade2Level = 0
	
	beastmasterLevel = 0
	beastmasterUpgrade1Level = 0
	beastmasterUpgrade2Level = 0
	
	draconicSorcererLevel = 0
	draconicSorcererUpgrade1Level = 0
	draconicSorcererUpgrade2Level = 0
	
	changelingLevel = 0
	changelingUpgrade1Level = 0
	changelingUpgrade2Level = 0
	
	monarchLevel = 0
	monarchUpgrade1Level = 0
	monarchUpgrade2Level = 0
	
	monsterGold = 1
	_stats_update(tickSpeed)
	_stats_update(HPResetMax)
	_stats_update(monsterHPMax)
	monsterFrame = 0
	monsterHP = monsterHPMax

	clickPower = (10 + clickUpgrade1Level + prestigeBonus3Level) * (1 + .25 * clickUpgrade2Level)
	
	_costs_update(clickUpgrade1Cost)
	_costs_update(clickUpgrade2Cost)
	
	_costs_update(warriorCost)
	_costs_update(warriorUpgrade1Cost)
	_costs_update(warriorUpgrade2Cost)
	_dps_update(warriorTotalDPS)

	_costs_update(archerCost)
	_costs_update(archerUpgrade1Cost)
	_costs_update(archerUpgrade2Cost)
	_dps_update(archerTotalDPS)

	_costs_update(mageCost)
	_costs_update(mageUpgrade1Cost)
	_costs_update(mageUpgrade2Cost)
	_dps_update(mageTotalDPS)

	_costs_update(demoCost)
	_costs_update(demoUpgrade1Cost)
	_costs_update(demoUpgrade2Cost)
	_dps_update(demoTotalDPS)

	_costs_update(clericCost)
	_costs_update(clericUpgrade1Cost)
	_costs_update(clericUpgrade2Cost)
	_dps_update(clericTotalDPS)
	
	_costs_update(beastmasterCost)
	_costs_update(beastmasterUpgrade1Cost)
	_costs_update(beastmasterUpgrade2Cost)
	_dps_update(beastmasterTotalDPS)
	
	_costs_update(draconicSorcererCost)
	_costs_update(draconicSorcererUpgrade1Cost)
	_costs_update(draconicSorcererUpgrade2Cost)
	_dps_update(draconicSorcererTotalDPS)
	
	_costs_update(changelingCost)
	_costs_update(changelingUpgrade1Cost)
	_costs_update(changelingUpgrade2Cost)
	_dps_update(changelingTotalDPS)
	
	_costs_update(monarchCost)
	_costs_update(monarchUpgrade1Cost)
	_costs_update(monarchUpgrade2Cost)
	_dps_update(monarchTotalDPS)
	
	$HeroContainer/VBoxContainer/WarriorButton/WarriorPrestigeButton.hide()
	$HeroContainer/VBoxContainer/ArcherButton/ArcherPrestigeButton.hide()
	$HeroContainer/VBoxContainer/MageButton/MagePrestigeButton.hide()
	$HeroContainer/VBoxContainer/DemoButton/DemoPrestigeButton.hide()
	$HeroContainer/VBoxContainer/ClericButton/ClericPrestigeButton.hide()
	$HeroContainer/VBoxContainer/BeastmasterButton/BeastmasterPrestigeButton.hide()
	$HeroContainer/VBoxContainer/DraconicSorcererButton/DraconicSorcererPrestigeButton.hide()
	$HeroContainer/VBoxContainer/ChangelingButton/ChangelingPrestigeButton.hide()
	$HeroContainer/VBoxContainer/MonarchButton/MonarchPrestigeButton.hide()
	
	_hide_units_and_upgrades()

func _on_test_button_pressed() -> void:
	_save_game_reset()


func _on_ready() -> void:
	_load_game()
	
# Mostly Implemented
# Scope of function: Update costs of generators, upgrades, and prestige
# by feeding in variable
# TO-DO: new _dps_update function to update DPS values in the same way
func _costs_update(cost):
# Prestige bonus costs
	if cost == prestigeBonus1Cost:
		prestigeBonus1Cost = 1 + 2.5 ** prestigeBonus1Level
	if cost == prestigeBonus2Cost:
		prestigeBonus2Cost = 1 + 1.5 ** prestigeBonus2Level
	if cost == prestigeBonus3Cost:
		prestigeBonus3Cost = 1 + 3.5 ** prestigeBonus3Level 
# Click upgrade Costs 
	if cost == clickUpgrade1Cost:
		clickUpgrade1Cost = 100 ** (1 + .07 * clickUpgrade1Level)
	if cost == clickUpgrade2Cost:
		clickUpgrade2Cost = 5000 ** (1 + .1 * clickUpgrade2Level)
# Warrior costs 
	if cost == warriorCost:
		warriorCost = \
		(10 * (1 - (.02 * warriorUpgrade2Level))) ** (1 + .07 * warriorLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
	if cost == warriorUpgrade1Cost:
		warriorUpgrade1Cost = (25 * (1 - (.01 * warriorUpgrade2Level))) ** (1 + .07 * warriorUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
	if cost == warriorUpgrade2Cost:
		warriorUpgrade2Cost = (50 * (1 - (.01 * warriorUpgrade2Level))) ** (1 + .09 * warriorUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
# Archer costs
	if cost == archerCost:
		archerCost = \
		50 ** (1 + .08 * archerLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
	if cost == archerUpgrade1Cost:
		archerUpgrade1Cost = 125 ** (1 + .08 * archerUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
	if cost == archerUpgrade2Cost:
		archerUpgrade2Cost = 250 ** (1 + .1 * archerUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
# Mage costs
	if cost == mageCost:
		mageCost = \
		250 ** (1 + .09 * mageLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
	if cost == mageUpgrade1Cost:
		mageUpgrade1Cost = 625 ** (1 + .09 * mageUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
	if cost == mageUpgrade2Cost:
		mageUpgrade2Cost = 1250 ** (1 + .1 * mageUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
# Demo costs
	if cost == demoCost:
		demoCost = \
		1000 ** (1 + .1 * demoLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
	if cost == demoUpgrade1Cost:
		demoUpgrade1Cost = 2500 ** (1 + .09 * demoUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
	if cost == demoUpgrade2Cost:
		demoUpgrade2Cost = 5000 ** (1 + .12 * demoUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
# Cleric costs
	if cost == clericCost:
		clericCost = \
		2500 ** (1 + .11 * clericLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
	if cost == clericUpgrade1Cost:
		clericUpgrade1Cost = 6250 ** (1 + .1 * clericUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
	if cost == clericUpgrade2Cost:
		clericUpgrade2Cost = 12500 ** (1 + .11 * clericUpgrade2Level)  * (1 - (.02 * prestigeBonus2Level))
# Beastmaster costs
	if cost == beastmasterCost:
		beastmasterCost = \
		5000 ** (1 + 0.12 * beastmasterLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
	if cost == beastmasterUpgrade1Cost: 
		beastmasterUpgrade1Cost = 12500 ** (1 + .11 * beastmasterUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
	if cost == beastmasterUpgrade2Cost:
		beastmasterUpgrade2Cost = 25000 ** (1 + .13 * beastmasterUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
# Draconic Sorcerer costs
	if cost == draconicSorcererCost:
		draconicSorcererCost = \
		10000 ** (1 + 0.13 * draconicSorcererLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
	if cost == draconicSorcererUpgrade1Cost:
		draconicSorcererUpgrade1Cost = 25000 ** (1 + .14 * draconicSorcererUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
	if cost == draconicSorcererUpgrade2Cost:
		draconicSorcererUpgrade2Cost = 50000  ** (1 + .15 * draconicSorcererUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
# Changeling costs
	if cost == changelingCost:
		changelingCost = \
		25000 ** (1 + 0.14 * changelingLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
	if cost == changelingUpgrade1Cost:
		changelingUpgrade1Cost = 62500 ** (1 + .16 * changelingUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
	if cost == changelingUpgrade2Cost:
		changelingUpgrade2Cost = 125000 ** (1 + .17 * changelingUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
# Monarch costs
	if cost == monarchCost:
		monarchCost = \
		100000 ** (1 + 0.15 * monarchLevel) * \
		(1 - (.02 * prestigeBonus2Level) - (.01 * beastmasterUpgrade2Level) - ((.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level))
	if cost == monarchUpgrade1Cost:
		monarchUpgrade1Cost = 250000 ** (1 + .18 * monarchUpgrade1Level) * (1 - (.02 * prestigeBonus2Level))
	if cost == monarchUpgrade2Cost:
		monarchUpgrade2Cost = 500000 ** (1 + .20 * monarchUpgrade2Level) * (1 - (.02 * prestigeBonus2Level))
		
# Scope of function: Update costs of stats (tickspeed, monster hp reset timer, max monster hp)
# by feeding in variable
func _stats_update(stat):
	# Monster fighting (tickspeed, HP Max, Attack Reset Time) costs
	if stat == tickSpeed:
		tickSpeed = (1.0 - (.025 * demoUpgrade2Level))
	if stat == HPResetMax:
		HPResetMax = 300 + (.25 * clericUpgrade1Level)
	# Click power
	if stat == clickPower:
		clickPower = (10 + clickUpgrade1Level + prestigeBonus3Level) * (1 + .25 * clickUpgrade2Level)

# Scope of function: Update DPS of units when called by feeding in unit
func _dps_update(unitDPS):
# Warrior DPS
	if unitDPS == warriorTotalDPS:
		warriorDPSRate = 2.5 * (1.0 + .1 * warriorUpgrade1Level) * (1 + .015 * mageUpgrade2Level) * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level) + (warriorLevel * .25 * clericUpgrade2Level)
		warriorTotalDPS = (warriorLevel + (1 * monarchUpgrade2Level)) * warriorDPSRate
# Archer DPS
	if unitDPS == archerTotalDPS:
		archerDPSRate = 5 * (1 + .25 * archerUpgrade1Level) * (1 + .015 * mageUpgrade2Level) * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level) + (archerLevel * .25 * clericUpgrade2Level)
		archerTotalDPS = (archerLevel + (1 * monarchUpgrade2Level)) * archerDPSRate
# Mage DPS
	if unitDPS == mageTotalDPS:
		mageDPSRate = 10 * (1 + .3 * mageUpgrade1Level) * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level) + (mageLevel * .25 * clericUpgrade2Level)
		mageTotalDPS = (mageLevel + (1 * monarchUpgrade2Level)) * mageDPSRate
# Demo DPS
	if unitDPS == demoTotalDPS:
		demoDPSRate = 25 * (1 + .35 * demoUpgrade1Level) * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level) + (demoLevel * .25 * clericUpgrade2Level)
		demoTotalDPS = (demoLevel + (1 * monarchUpgrade2Level)) * demoDPSRate
# Cleric DPS
	if unitDPS == clericTotalDPS:
		clericDPSRate = 20 * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level)
		clericTotalDPS = (clericLevel + (1 * monarchUpgrade2Level)) * clericDPSRate
# Beastmaster DPS
	if unitDPS == beastmasterTotalDPS:
		beastmasterDPSRate = 40 * (1 + .05 * beastmasterUpgrade1Level) * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level)
		beastmasterTotalDPS = (beastmasterLevel + (1 * monarchUpgrade2Level)) * beastmasterDPSRate
# Draconic Sorcerer DPS
	if unitDPS == draconicSorcererTotalDPS:
		draconicSorcererDPSRate = 65 * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level)
		draconicSorcererTotalDPS = (draconicSorcererLevel + (1 * monarchUpgrade2Level)) * draconicSorcererDPSRate
# Changeling DPS
	if unitDPS == changelingTotalDPS:
		changelingDPSRate = 90 * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level)
		changelingTotalDPS = (changelingLevel + (1 * monarchUpgrade2Level)) * changelingDPSRate
# Monarch DPS
	if unitDPS == monarchTotalDPS:
		monarchDPSRate = 80 * (1 + .1 * draconicSorcererUpgrade2Level) * (1 + (.001 * (warriorLevel + archerLevel + mageLevel + demoLevel + clericLevel + beastmasterLevel + draconicSorcererLevel)) * changelingUpgrade2Level)
		monarchTotalDPS = monarchLevel * monarchDPSRate

func _generator_purchase():
	_costs_update(warriorCost)
	_costs_update(archerCost)
	_costs_update(mageCost)
	_costs_update(demoCost)
	_costs_update(clericCost)
	_costs_update(beastmasterCost)
	_costs_update(draconicSorcererCost)
	_costs_update(changelingCost)
	_costs_update(monarchCost)
	_dps_update(warriorTotalDPS)
	_dps_update(archerTotalDPS)
	_dps_update(mageTotalDPS)
	_dps_update(demoTotalDPS)
	_dps_update(clericTotalDPS)
	_dps_update(beastmasterTotalDPS)
	_dps_update(draconicSorcererTotalDPS)
	_dps_update(changelingTotalDPS)
	_dps_update(monarchTotalDPS)

func _ascension_buttons():
	$HeroContainer/VBoxContainer/WarriorButton/WarriorPrestigeButton.show()
	$HeroContainer/VBoxContainer/ArcherButton/ArcherPrestigeButton.show()
	$HeroContainer/VBoxContainer/MageButton/MagePrestigeButton.show()
	$HeroContainer/VBoxContainer/DemoButton/DemoPrestigeButton.show()
	$HeroContainer/VBoxContainer/ClericButton/ClericPrestigeButton.show()
	$HeroContainer/VBoxContainer/BeastmasterButton/BeastmasterPrestigeButton.show()
	$HeroContainer/VBoxContainer/DraconicSorcererButton/DraconicSorcererPrestigeButton.show()
	$HeroContainer/VBoxContainer/ChangelingButton/ChangelingPrestigeButton.show()
	$HeroContainer/VBoxContainer/MonarchButton/MonarchPrestigeButton.show()

func _hide_units_and_upgrades():
	# generator hiding
	$HeroContainer/VBoxContainer/ArcherButton.hide()
	$HeroContainer/VBoxContainer/MageButton.hide()
	$HeroContainer/VBoxContainer/DemoButton.hide()
	$HeroContainer/VBoxContainer/ClericButton.hide()
	$HeroContainer/VBoxContainer/BeastmasterButton.hide()
	$HeroContainer/VBoxContainer/DraconicSorcererButton.hide()
	$HeroContainer/VBoxContainer/ChangelingButton.hide()
	$HeroContainer/VBoxContainer/MonarchButton.hide()
	# upgrade hiding
	$UpgradeContainer/GridContainer/WarriorUpgrade1.hide()
	$UpgradeContainer/GridContainer/WarriorUpgrade2.hide()
	$UpgradeContainer/GridContainer/ArcherUpgrade1.hide()
	$UpgradeContainer/GridContainer/ArcherUpgrade2.hide()
	$UpgradeContainer/GridContainer/MageUpgrade1.hide()
	$UpgradeContainer/GridContainer/MageUpgrade2.hide()
	$UpgradeContainer/GridContainer/DemoUpgrade1.hide()
	$UpgradeContainer/GridContainer/DemoUpgrade2.hide()
	$UpgradeContainer/GridContainer/ClericUpgrade1.hide()
	$UpgradeContainer/GridContainer/ClericUpgrade2.hide()
	$UpgradeContainer/GridContainer/BeastmasterUpgrade1.hide()
	$UpgradeContainer/GridContainer/BeastmasterUpgrade2.hide()
	$UpgradeContainer/GridContainer/DraconicSorcererUpgrade1.hide()
	$UpgradeContainer/GridContainer/DraconicSorcererUpgrade2.hide()
	$UpgradeContainer/GridContainer/ChangelingUpgrade1.hide()
	$UpgradeContainer/GridContainer/ChangelingUpgrade2.hide()
	$UpgradeContainer/GridContainer/MonarchUpgrade1.hide()
	$UpgradeContainer/GridContainer/MonarchUpgrade2.hide()
# github.com/ChronoDK/GodotBigNumberClass

#   |_|_| 
# q 0 ~ 0 p 
#  -|s d|-
#   |---|

# ascension functions
# 25+ unit levels to ascend, sets unit level to 0
# Grants ascension points per 25 levels of unit
# increase DPS, reduce upgrade cost (NOT generator cost) for specific units
#	+ .01% DPS per unit ascended
#	- .01% Upgrade cost per unit ascended
# Points count for Prestige (+1 Prestige point per unit ascension point) (prestige now resets ascension too)


func _on_warrior_prestige_button_pressed() -> void:
	if warriorLevel >= 25:
		warriorAscendPoints = floor(warriorLevel / 25)
		warriorLevel = 0
		_costs_update(warriorCost)
		_dps_update(warriorTotalDPS)
		print(str(warriorAscendPoints) + " warrior ascend points.")

func _on_archer_prestige_button_pressed() -> void:
	if archerLevel >= 25:
		archerAscendPoints = floor(archerLevel / 25)
		archerLevel = 0
		_costs_update(archerCost)
		_dps_update(archerTotalDPS)
		print(str(archerAscendPoints) + " archer ascend points.")

func _on_mage_prestige_button_pressed() -> void:
	if mageLevel >= 25:
		mageAscendPoints = floor(mageLevel / 25)
		mageLevel = 0
		_costs_update(mageCost)
		_dps_update(mageTotalDPS)
		print(str(mageAscendPoints) + " mage ascend points.")

func _on_demo_prestige_button_pressed() -> void:
	if demoLevel >= 25:
		demoAscendPoints = floor(demoLevel / 25)
		demoLevel = 0
		_costs_update(demoCost)
		_dps_update(demoTotalDPS)
		print(str(demoAscendPoints) + " demo ascend points.")

func _on_cleric_prestige_button_pressed() -> void:
	if clericLevel >= 25:
		clericAscendPoints = floor(clericLevel / 25)
		clericLevel = 0
		_costs_update(clericCost)
		_dps_update(clericTotalDPS)
		print(str(clericAscendPoints) + " cleric ascend points.")

func _on_beastmaster_prestige_button_pressed() -> void:
	if beastmasterLevel >= 25:
		beastmasterAscendPoints = floor(beastmasterLevel / 25)
		beastmasterLevel = 0
		_costs_update(beastmasterCost)
		_dps_update(beastmasterTotalDPS)
		print(str(beastmasterAscendPoints) + " beastmaster ascend points.")

func _on_draconic_sorcerer_prestige_button_pressed() -> void:
	if draconicSorcererLevel >= 25:
		draconicSorcererAscendPoints = floor(draconicSorcererLevel / 25)
		draconicSorcererLevel = 0
		_costs_update(draconicSorcererCost)
		_dps_update(draconicSorcererTotalDPS)
		print(str(draconicSorcererAscendPoints) + " draconicSorcerer ascend points.")

func _on_changeling_prestige_button_pressed() -> void:
	if changelingLevel >= 25:
		changelingAscendPoints = floor(changelingLevel / 25)
		changelingLevel = 0
		_costs_update(changelingCost)
		_dps_update(changelingTotalDPS)
		print(str(changelingAscendPoints) + " changeling ascend points.")

func _on_monarch_prestige_button_pressed() -> void:
	if monarchLevel >= 25:
		monarchAscendPoints = floor(monarchLevel / 25)
		monarchLevel = 0
		_costs_update(monarchCost)
		_dps_update(monarchTotalDPS)
		print(str(monarchAscendPoints) + " monarch ascend points.")
		
		# test comment for github change test
	
