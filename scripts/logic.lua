function has(item, amount)
  local count = Tracker:ProviderCountForCode(item)
  amount = tonumber(amount)
  if not amount then
    return count > 0
  else
    return count >= amount
  end
end

function not_swap()
  return(
    not has("op_swap")
  )
end

function not_noise()
  return(
    not has("op_noise")
  )
end

function calculate_floor_cost(floor_percentage)
  local toppins_req = (Tracker:ProviderCountForCode(floor_percentage) / 100) * Tracker:ProviderCountForCode("op_toppin_count")
  if Tracker:ProviderCountForCode("toppins") >= toppins_req then
    return true
  else
    return false
  end
end

function tutorial_mus()
  return(
    (has("op_pepp") and has("bodyslam"))
  )
end

function tutorial_che_tom()
  return(
    (has("op_pepp") and has("bodyslam") and (has("wclimb") or (has("sjump") and has("op_diff_exp"))))
  )
end


function tutorial_sau()
  return (
    (has("op_pepp") and has("bodyslam") and (has("sjump") and has("op_diff_exp")) or (has("wclimb") and has("op_diff_norm"))) 
  )
end

function tutorial_pin()
  return(
    tutorial_sau() and has("grab")
  )
end

function tutorial_noise()
  return(
    has("op_noise") and ((has("sjump") and has("bodyslam")) or (has("sjump") and has("nado")) or (has("crush")) or (has("sjump") and has("wbounce") and has("op_diff_exp"))) 
  )
end

function tutorial_com()
  return(
    tutorial_pin() or tutorial_noise()
  )
end

function john_gutter_pepp_com()
  return(
    has("op_pepp") and has("sjump")
  )
end

function john_gutter_pepp_tom()
  return(
    john_gutter_pepp_com() or (has("op_pepp") and (has("wclimb") or has("ucut")))
  )
end

function john_gutter_exp_pepp_com()
  return(
    john_gutter_pepp_com() or (has("op_pepp") and has("op_diff_exp") and has("wclimb"))
  )
end

function john_gutter_exp_pepp_tom()
  return (
    john_gutter_pepp_tom() or (has("op_pepp") and has("op_diff_exp") and has("grab"))
  )
end

function john_gutter_exp_pepp_mus()
  return (
    john_gutter_pepp_tom() or (has("op_pepp") and has("op_diff_exp") and (has("grab") or has("bodyslam")))
  )
end

function john_gutter_noise_com()
  return(
    has("op_noise") and has("sjump")
  )
end

function john_gutter_noise_tom()
  return(
    john_gutter_noise_com() or (has("op_noise") and (has("wbounce") or has("crush") or has("ucut")))
  )
end

function john_gutter_nom_noise_s2()
  return(
    has("op_noise") and has("op_diff_norm") and has("sjump") and (has("bodyslam") or has("crush") or has("nado"))
  )
end

function john_gutter_exp_noise_com()
  return (
    john_gutter_noise_com() or (has("op_noise") and has("op_diff_exp") and (has("ucut") or has("crush") or has("wbounce")))
  )
end

function john_gutter_exp_noise_tom()
  return(
    john_gutter_noise_tom() or (has("op_noise") and has("op_diff_exp") and (has("grab") or has("bodyslam")))
  )
end

function pizzascape_pepp_com()
  return(
    has("op_pepp") and has("grab") and has("wclimb")
  )
end

function pizzascape_pepp_pin()
  return(
    has("op_pepp") and has("grab")
  )
end

function pizzascape_pepp_s3()
  return(
    has("op_pepp") and has("grab") and has("sjump")
  )
end

function pizzascape_pepp_tre()
  return(
    pizzascape_pepp_s3() or (has("op_pepp") and has("grab") and has("wclimb"))
  )
end

function pizzascape_exp_pepp_com()
  return(
    pizzascape_pepp_com() or (has("op_pepp") and has("op_diff_exp") and ((has("sjump") and has("grab")) or has("ucut")))
  )
end

function pizzascape_exp_pepp_pin()
  return(
    pizzascape_pepp_pin() or (has("op_pepp") and has("op_diff_exp") and has("ucut"))
  )
end

function pizzascape_exp_pepp_s3()
  return(
    pizzascape_pepp_s3() or (has("op_pepp") and has("op_diff_exp") and ((has("ucut") and (has("sjump") or has("wclimb"))) or (has("grab") and has("wclimb"))))
  )
end

function pizzascape_exp_pepp_tre()
  return(
    pizzascape_pepp_tre() or (has("op_pepp") and has("op_diff_exp") and has("ucut") and (has("sjump") or has("wclimb")))
  )
end

function pizzascape_noise_com()
  return(
    has("op_noise") and has("grab") and (has("sjump") or has("wbounce") or has("crush"))
  )
end

function pizzascape_noise_pin()
  return(
    has("op_noise") and has("grab")
  )
end

function pizzascape_noise_s3()
  return(
    has("op_noise") and has("grab") and (has("sjump") or has("crush"))
  )
end

function pizzascape_norm_noise_com()
  return(
    pizzascape_noise_com() or (has("op_noise") and has("op_diff_norm") and has("grab") and has("ucut"))
  )
end

function pizzascape_exp_noise_com()
  return(
    pizzascape_noise_com() or (has("op_noise") and has("op_diff_exp") and has("ucut"))
  )
end

function pizzascape_exp_noise_pin()
  return(
    pizzascape_noise_pin() or (has("op_noise") and has("op_diff_exp") and has("ucut"))
  )
end

function pizzascape_exp_noise_s3()
  return(
    pizzascape_noise_s3() or (has("op_noise") and has("op_diff_exp") and (has("ucut") or (has("grab") and has("wbounce"))))
  )
end

function ancient_cheese_pepp_com()
  return(
    has("op_pepp") and has("grab") and has("bodyslam") and (has("sjump") or has("wclimb"))
  )
end

function ancient_cheese_pepp_che()
  return(
    has("op_pepp") and has("grab")
  )
end

function ancient_cheese_exp_pepp_com()
  return(
    ancient_cheese_pepp_com() or (has("op_pepp") and has("op_diff_exp") and has("ucut") and has("bodyslam") and (has("wclimb") or has("sjump")))
  )
end

function ancient_cheese_exp_pepp_pin()
  return(
    ancient_cheese_pepp_com() or (has("op_pepp") and has("op_diff_exp") and (has("ucut") and has("bodyslam")))
  )
end

function ancient_cheese_exp_pepp_tom()
  return(
    has("op_pepp") and has("op_diff_exp") and (has("ucut") or (has("grab") and (has("wclimb") or has("sjump"))))
  )
end

function ancient_cheese_exp_pepp_che()
  return(
    ancient_cheese_pepp_che() or (has("op_pepp") and has("op_diff_exp") and has("ucut"))
  )
end

function ancient_cheese_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and has("grab") and ((has("sjump") or has("ucut") or has("wbounce")) and (has("bodyslam") or has("nado") or has("crush")))
  )
end

function ancient_cheese_norm_noise_che()
  return(
    has("op_noise") and has("op_diff_norm") and has("grab") and (has("sjump") or has("ucut") or has("wbounce") or has("crush"))
  )
end

function ancient_cheese_exp_noise_com()
  return(
    has("op_noise") and has("op_diff_exp") and has("sjump") and ((has("grab") or has("ucut")) and (has("bodyslam") or has("nado")))
  )
end

function ancient_cheese_exp_noise_che()
  return(
    has("op_noise") and has("op_diff_exp") and (has("grab") or has("ucut"))
  )
end

function ancient_cheese_exp_noise_s2()
  return(
    has("op_noise") and has("op_diff_exp") and (has("ucut") or (has("grab") and (has("sjump") or has("wbounce") or has("crush"))))
  )
end

function bloodsauce_dungeon_pepp_com()
  return(
    has("op_pepp") and has("bodyslam") and (has("sjump") or has("wclimb"))
  )
end

function bloodsauce_dungeon_pepp_pin()
  return(
    has("op_pepp") and has("bodyslam")
  )
end

function bloodsauce_dungeon_pepp_s2()
  return(
    has("op_pepp") and has("bodyslam") and has("sjump")
  )
end

function bloodsauce_dungeon_norm_pepp_mus()
  return(
    has("op_pepp") and has("op_diff_norm") and (has("sjump") or has("wclimb"))
  )
end

function bloodsauce_dungeon_noise_com()
  return(
    has("op_noise") and has("sjump") and (has("bodyslam") or has("nado") or has("crush"))
  )
end

function bloodsauce_dungeon_noise_pin()
  return(
    has("op_noise") and (has("bodyslam") or has("nado") or has("crush"))
  )
end

function bloodsauce_dungeon_norm_noise_mus()
  return(
    has("op_noise") and has("op_diff_norm") and (has("sjump")  or has("wbounce") or has("ucut") or has("crush"))
  )
end

function bloodsauce_dungeon_exp_noise_com()
  return(
    bloodsauce_dungeon_noise_com() or (has("op_noise") and has("op_diff_exp") and (has("sjump") and has("wbounce")))
  )
end

function bloodsauce_dungeon_exp_noise_pin()
  return(
    bloodsauce_dungeon_noise_pin() or (has("op_noise") and has("op_diff_exp") and has("wbounce"))
  )
end

function boss_pepp()
  return(
    has("op_pepp") and has("grab")
  )
end

function boss_noise()
  return(
    has("op_noise") and has("bomb")
  )
end

function boss_norm_noise()
  return(
    boss_noise() or (has("op_noise") and has("op_diff_norm") and has("grab"))
  )
end

function reach_elevator_1()
  return(
    has("sjump") or has("wclimb") or (has("op_noise") and has("ucut")) or  has("crush") or has("wbounce") or has("op_ladder1")
  )
end

function oregano_desert_pepp_com()
  return(
    has("op_pepp") and has("wclimb")
  )
end

function oregano_desert_pepp_che()
  return(
    oregano_desert_pepp_com() or (has("op_pepp") and has("sjump"))
  )
end

function oregano_desert_exp_pepp_com()
  return(
    oregano_desert_pepp_com() or (has("op_pepp") and has("op_diff_exp") and has("grab") and (has("sjump") or has("ucut")))
  )
end

function oregano_desert_exp_pepp_che()
  return(
    oregano_desert_pepp_che() or (has("op_pepp") and has("op_diff_exp") and (has("ucut") and has("grab")))
  )
end

function oregano_desert_exp_pepp_mus()
  return(
    oregano_desert_pepp_che() or (has("op_pepp") and has("op_diff_exp") and has("ucut"))
  )
end

function oregano_desert_noise_s1()
  return(
    has("op_noise") and has("wbounce")
  )
end

function oregano_desert_noise_com()
  return(
    oregano_desert_noise_s1() or (has("op_noise") and (has("sjump") or has("ucut") or has("crush")))
  )
end

function oregano_desert_exp_noise_s1()
  return(
    oregano_desert_noise_s1() or (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("crush")))
  )
end

function wasteyard_pepp_com()
  return(
    has("op_pepp") and (has("sjump") or has("wclimb"))
  )
end

function wasteyard_exp_pepp_pin()
  return(
    wasteyard_pepp_com() or (has("op_pepp") and has("op_diff_exp") and has("ucut"))
  )
end

function wasteyard_noise_s1()
  return(
    has("op_noise") and (has("sjump") or has("crush") or has("wbounce"))
  )
end

function wasteyard_noise_com()
  return(
    wasteyard_noise_s1() or (has("op_noise") and has("ucut"))
  )
end

function fun_farm_pepp_com()
  return(
    has("op_pepp") and has("bodyslam") and (has("sjump") or has("wclimb"))
  )
end

function fun_farm_pepp_che()
  return(
    fun_farm_pepp_com() or (has("op_pepp") and has("bodyslam") and has("ucut"))
  )
end

function fun_farm_pepp_ct2()
  return(
    fun_farm_pepp_com() and has("staunt")
  )
end

function fun_farm_exp_pepp_com()
  return(
    fun_farm_pepp_com() or (has("op_pepp") and has("op_diff_exp") and has("grab") and has("bodyslam") and has("ucut"))
  )
end

function fun_farm_noise_com()
  return(
    has("op_noise") and (has("crush") or (has("bodyslam") and (has("wbounce") or has("ucut") or has("sjump"))))
  )
end

function fun_farm_noise_ct2()
  return(
    fun_farm_noise_com() and has("staunt")
  )
end

function fun_farm_norm_noise_sau()
  return(
    (fun_farm_noise_com() and has("op_diff_norm")) or (has("op_noise") and has("op_diff_norm") and has("nado") and (has("wbounce") or has("ucut") or has("sjump")))
  )
end

function fun_farm_exp_noise_sau()
  return(
    has("op_noise") and has("op_diff_exp") and (has("wbounce") or has("crush") or ((has("sjump") or has("ucut")) and (has("bodyslam") or has("nado"))))
  )
end

function fastfood_saloon_pepp_mus()
  return(
    has("op_pepp") and has("sjump")
  )
end

function fastfood_saloon_pepp_com()
  return(
    fastfood_saloon_pepp_mus() and has("grab")
  )
end

function fastfood_saloon_norm_pepp_s3()
  return(
    fastfood_saloon_pepp_com() and has("op_diff_norm") and has("wclimb")
  )
end

function fastfood_saloon_exp_pepp_mus()
  return(
    fastfood_saloon_pepp_mus() or (has("op_pepp") and has("op_diff_exp") and has("wclimb"))
  )
end

function fastfood_saloon_exp_pepp_com()
  return (
    fastfood_saloon_pepp_com() or (has("op_pepp") and has("op_diff_exp") and has("grab") and has("wclimb"))
  )
end

function fastfood_saloon_exp_pepp_s3()
  return(
    has("op_pepp") and has("op_diff_exp") and has("grab") and has("wclimb")
  )
end

function fastfood_saloon_noise_mus()
  return(
    has("op_noise") and has("sjump")
  )
end

function fastfood_saloon_noise_com()
  return(
    fastfood_saloon_noise_mus() and has("grab")
  )
end

function fastfood_saloon_exp_noise_mus()
  return(
    fastfood_saloon_noise_mus() or (has("op_noise") and has("op_diff_exp") and (has("ucut") or has("crush") or has("wbounce")))
  )
end

function fastfood_saloon_exp_noise_com()
  return(
    fastfood_saloon_noise_com() or (has("op_noise") and has("op_diff_exp") and has("grab") and (has("ucut") or has("crush") or has("wbounce")))
  )
end

function reach_elevator_2()
  return(
    reach_elevator_1()
  )
end

function crust_cove_pepp_com()
  return(
    has("op_pepp") and has("wclimb") and has("bodyslam")
  )
end

function crust_cove_pepp_che()
  return(
    has("op_pepp") and (has("sjump") or has("wclimb"))
  )
end

function crust_cove_pepp_s3()
  return(
    crust_cove_pepp_com() and has("taunt")
  )
end

function crust_cove_pepp_ct1()
  return(
    crust_cove_pepp_che() and has("taunt")
  )
end

function crust_cove_exp_pepp_com()
  return(
    crust_cove_pepp_com() or (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and has("sjump") and has("ucut"))
  )
end

function crust_cove_exp_pepp_s3()
  return(
    crust_cove_pepp_s3() or (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and has("sjump") and has("ucut") and has("taunt"))
  )
end

function crust_cove_exp_pepp_ct1()
  return(
    crust_cove_pepp_ct1() and has("bodyslam")
  )
end

function crust_cove_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and (has("sjump") or has("crush"))
  )
end

function crust_cove_norm_noise_s3()
  return(
    crust_cove_norm_noise_com() and has("taunt")
  )
end

function crust_cove_norm_noise_ct2()
  return(
    has("op_noise") and has("op_diff_norm") and ((has("sjump") and has("bodyslam")) or has("crush"))
  )
end

function crust_cove_exp_noise_com()
  return(
    has("op_noise") and has("op_diff_exp") and has("sjump") and (has("crush") or has("nado") or has("bodyslam") or has("wbounce"))
  )
end

function crust_cove_exp_noise_che()
  return(
    has("op_noise") and has("op_diff_exp") and has("sjump")
  )
end

function crust_cove_exp_noise_s3()
  return(
    crust_cove_exp_noise_com() and has("taunt")
  )
end

function gnome_forest_norm_pepp_com()
  return(
    has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("djump") and ((has("spin") or has("rkick")) and (has("sjump") or has("wclimb")))
  )
end

function gnome_forest_norm_pepp_pin()
  return(
    has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("djump") and (has("spin") or has("rkick"))
  )
end

function gnome_forest_exp_pepp_pin()
  return(
    has("op_pepp") and has("op_diff_exp") and has("bodyslam") and has("djump")
  )
end

function gnome_forest_exp_pepp_com()
  return(
    gnome_forest_exp_pepp_pin() and (has("sjump") or has("wclimb"))
  )
end

function gnome_forest_noise_com()
  return(
    has("op_noise") and has("crush")
  )
end

function gnome_forest_norm_noise_com()
  return(
    gnome_forest_noise_com() or (has("op_noise") and has("op_diff_norm") and has("bodyslam") and (has("sjump") or has("wbounce")))
  )
end

function deep_dish_9_pepp_com()
  return(
    has("op_pepp") and has("bodyslam") and (has("sjump") or has("wclimb"))
  )
end

function deep_dish_9_norm_pepp_che()
  return(
    deep_dish_9_pepp_com() or (has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("ucut"))
  )
end

function deep_dish_9_norm_pepp_mus()
  return(
    has("op_pepp") and has("op_diff_norm") and has("bodyslam")
  )
end

function deep_dish_9_noise_mus()
  return(
    has("op_noise") and (has("bodyslam") or has("crush") or has("nado"))
  )
end

function deep_dish_9_noise_ct3()
  return(
    has("op_noise") and has("bodyslam") and (has("sjump") or has("crush") or has("wbounce"))
  )
end

function deep_dish_9_norm_noise_che()
  return(
    has("op_noise") and has("op_diff_norm") and (has("crush") or (has("bodyslam") or has("nado")) and (has("sjump") or has("wbounce")))
  )
end

function deep_dish_9_norm_noise_com()
  return(
    deep_dish_9_norm_noise_che() or (has("op_noise") and has("op_diff_norm") and has("ucut") and (has("bodyslam") or has("nado")))
  )
end

function deep_dish_9_exp_noise_tom()
  return(
    deep_dish_9_noise_mus() or (has("op_noise") and has("op_diff_exp") and has("wbounce"))
  )
end

function deep_dish_9_exp_noise_com()
  return(
    has("op_noise") and has("op_diff_exp") and (has("wbounce") or has("crush") or ((has("sjump") or has("ucut")) and (has("bodyslam") or has("nado"))))
  )
end

function deep_dish_9_exp_noise_pin()
  return(
    has("op_noise") and has("op_diff_exp") and (has("crush") or ((has("sjump") or has("ucut")) and (has("wbounce") or has("nado"))))
  )
end

function deep_dish_9_exp_noise_ct3()
  return(
    deep_dish_9_noise_ct3() or (has("op_noise") and has("op_diff_exp") and has("ucut") and has("bodyslam"))
  )
end

function golf_norm_pepp_com()
  return(
    has("op_pepp") and has("op_diff_norm") and has("grab") and (has("wclimb") or has("sjump") or has("ucut"))
  )
end

function golf_exp_pepp_com()
  return(
    has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("bodyslam") or has("wclimb") or has("ucut"))
  )
end

function golf_exp_pepp_tre()
  return(
    has("op_pepp") and has("op_diff_exp") and (has("sjump") or (has("wclimb") and has("grab")))
  )
end

function golf_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and has("grab") and (has("sjump") or has("crush") or has("ucut") or has("wbounce"))
  )
end

function golf_exp_noise_tre()
  return(
    has("op_noise") and has("op_diff_exp") and (has("sjump") or has("wbounce") or has("ucut") or has("crush"))
  )
end

function golf_exp_noise_com()
  return(
    golf_exp_noise_tre() or (has("op_noise") and has("op_diff_exp") and has("bodyslam"))
  )
end