extends Node
var player_stats_location = "res://resources/PlayerStats.tres"
var stats_data = load(player_stats_location) as PlayerStats

func save_player_stats():
	ResourceSaver.save(player_stats_location, stats_data)


# individual stats
func add_player_deaths():
	stats_data.player_deaths = stats_data.player_deaths + 1
	
func add_player_hits():
	stats_data.player_hits = stats_data.player_hits + 1
	
func add_enemies_killed():
	stats_data.enemies_killed = stats_data.enemies_killed + 1
	
func add_bosses_defeated():
	stats_data.bosses_defeated = stats_data.bosses_defeated + 1
	
func add_continues_used():
	stats_data.continues_used = stats_data.continues_used + 1
	
func add_gameovers():
	stats_data.gameovers = stats_data.gameovers + 1
	
func add_highscore_boss_rush():
	stats_data.highscore_boss_rush = stats_data.highscore_boss_rush + 1
	
func add_highscore_boss_1():
	stats_data.highscore_boss_1 = stats_data.highscore_boss_1 + 1
	
func add_highscore_boss_2():
	stats_data.highscore_boss_2 = stats_data.highscore_boss_2 + 1
	
func add_highscore_boss_3():
	stats_data.highscore_boss_3 = stats_data.highscore_boss_3 + 1
	
func add_highscore_boss_4():
	stats_data.highscore_boss_4 = stats_data.highscore_boss_4 + 1
	
func add_highscore_boss_tlb():
	stats_data.highscore_boss_tlb = stats_data.highscore_boss_tlb + 1
	
