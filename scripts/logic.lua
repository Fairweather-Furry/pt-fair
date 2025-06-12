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

function calculate_floor_cost(floor_count)
  if Tracker:ProviderCountForCode("toppins") >= Tracker:ProviderCountForCode(floor_count) then
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
    (has("op_pepp") and has("bodyslam") and ((has("sjump") and has("op_diff_exp")) or (has("wclimb") and has("op_diff_norm")))) 
  )
end

function tutorial_pin()
  return(
    tutorial_sau() and has("grab")
  )
end

function tutorial_noise()
  return(
    has("op_noise") and ((has("sjump") and (has("bodyslam") or has("nado"))) or (has("crush") and (has("sjump") or has("op_diff_exp"))) or (has("sjump") and has("wbounce") and has("op_diff_exp"))) 
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
    has("op_noise") and has("grab") and has("sjump")
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
    pizzascape_noise_s3() or (has("op_noise") and has("op_diff_exp") and (has("ucut") or (has("grab") and (has("wbounce") or has("crush")))))
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
    has("op_noise") and has("op_diff_norm") and has("grab") and (has("sjump") and (has("bodyslam") or has("nado") or has("crush")))
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
    has("op_noise") and (has("sjump") or has("wbounce"))
  )
end

function wasteyard_noise_com()
  return(
    wasteyard_noise_s1() or (has("op_noise") and has("ucut"))
  )
end

function wasteyard_exp_noise_com()
  return(
    wasteyard_noise_com() or (has("op_noise") and has("op_diff_exp") and has("crush"))
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

function crust_cove_noise_com()
  return(
    has("op_noise") and has("sjump") and (has("crush") or has("bodyslam") or has("nado"))
  )
end

function crust_cove_norm_noise_ct2()
  return(
    has("op_noise") and has("op_diff_norm") and ((has("sjump") and has("bodyslam")) or has("crush"))
  )
end

function crust_cove_exp_noise_com()
  return(
    crust_cove_noise_com() or (has("op_noise") and has("op_diff_exp") and has("sjump") and has("wbounce"))
  )
end

function crust_cove_noise_che()
  return(
    has("op_noise") and has("sjump")
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

function gnome_forest_exp_noise_com()
  return(
    has("op_noise") and has("op_diff_exp") and has("crush")
  )
end

function gnome_forest_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and ((has("bodyslam") or has("crush") or has("nado")) and (has("sjump") or has("wbounce")))
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
    has("op_noise") and has("bodyslam") and (has("sjump") or has("ucut") or has("wbounce"))
  )
end

function deep_dish_9_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and ((has("bodyslam") or has("nado") or has("crush")) and (has("sjump") or has("wbounce") or has("ucut")))
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
    deep_dish_9_noise_ct3() or (has("op_noise") and has("op_diff_exp") and has("crush") and has("bodyslam"))
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

function reach_noise()
  return(
    reach_elevator_2() and calculate_floor_cost("op_f3_cost") and (has("prog_key_2") or has("op_oworld")) and (has("sjump") or has("wclimb") or has("ucut") or has("crush") or has("wbounce") or has("op_ladder3")) 
  )
end

function reach_elevator_3()
  return(
    reach_elevator_2() and (has("sjump") or has("ucut") or has("wclimb") or has("crush") or has("wbounce") or has("op_ladder3"))
  )
end

function pig_city_pepp_tom()
  return(
    has("op_pepp") and has("bodyslam")
  )
end

function pig_city_pepp_com()
  return(
    pig_city_pepp_tom() and has("djump")
  )
end

function pig_city_pepp_che()
  return(
    has("op_pepp") and (has("sjump") or has("wclimb"))
  )
end

function pig_city_noise_che()
  return(
    has("op_noise") and (has("sjump"))
  )
end

function pig_city_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and (has("crush") or (has("bodyslam") and (has("sjump") or has("wbounce") or has("ucut"))))
  )
end

function pigcity_norm_noise_sau()
  return(
    has("op_noise") and has("op_diff_norm") and has("bodyslam") and (has("sjump") or has("wbounce"))
  )
end

function pig_city_exp_noise_che()
  return(
    pig_city_noise_che() or (has("op_noise") and has("op_diff_exp") and (has("ucut") or has("wbounce") or has("crush")))
  )
end

function pig_city_exp_noise_tom()
  return(
    has("op_noise") and has("op_diff_exp") and (has("crush") or has("bodyslam"))
  )
end

function pig_city_exp_noise_com()
  return(
    has("op_noise") and has("op_diff_exp") and (has("wbounce") or has("crush") or ((has("sjump") or has("ucut")) and (has("bodyslam") or has("nado"))))
  )
end

function pig_city_exp_noise_ct1()
  return(
    has("op_noise") and has("op_diff_exp") and (has("crush") or (has("bodyslam") and (has("sjump") or has("wbounce") or has("ucut"))))
  )
end

function pig_city_swap_ct2()
  return(
    has("op_swap") and has("rkick") and (has("crush") or (has("bodyslam") and (has("djump") or has("wbounce") or has("ucut") or has("sjump"))))
  )
end

function peppibot_factory_pepp_mus()
  return(
    has("op_pepp") and has("sjump")
  )
end

function peppibot_factory_norm_pepp_sau()
  return(
    peppibot_factory_pepp_mus() and has("op_diff_norm") and has("wclimb")
  )
end

function peppibot_factory_norm_pepp_com()
  return(
    peppibot_factory_norm_pepp_sau() and has("bodyslam")
  )
end

function peppibot_factory_norm_pepp_s2()
  return(
    peppibot_factory_norm_pepp_sau() and has("ucut")
  )
end

function peppibot_factory_exp_pepp_mus()
  return(
    peppibot_factory_pepp_mus() or (has("op_pepp") and has("op_diff_exp") and has("wclimb") and (has("grab") or has("ucut")))
  )
end

function peppibot_factory_exp_pepp_pin()
  return(
    (peppibot_factory_pepp_mus() and has("op_diff_exp") and has("ucut")) or (has("op_pepp") and has("op_diff_exp") and has("wclimb") and (has("grab") or has("ucut")))
  )
end

function peppibot_factory_exp_pepp_com()
  return(
    peppibot_factory_exp_pepp_pin() and has("bodyslam")
  )
end

function peppibot_factory_exp_pepp_s1()
  return(
    peppibot_factory_pepp_mus() or (has("op_pepp") and has("op_diff_exp") and has("wclimb"))
  )
end

function peppibot_factory_exp_pepp_tre()
  return(
    peppibot_factory_exp_pepp_s1() and has("bodyslam")
  )
end

function peppibot_factory_noise_pin()
  return(
    has("op_noise") and has("sjump")
  )
end

function peppibot_factory_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and (has("sjump") and (has("bodyslam") or has("nado") or has("crush")))
  )
end

function peppibot_factory_exp_noise_com()
  return(
    peppibot_factory_noise_pin() or (has("op_noise") and has("op_diff_exp") and (has("crush") or has("ucut")))
  )
end

function peppibot_factory_exp_noise_s3()
  return(
    has("op_noise") and has("op_diff_exp") and (has("crush") or ((has("sjump") or has("ucut")) and (has("wbounce") or has("nado"))))
  )
end

function oh_shit_pepp_mus()
  return(
    has("op_pepp") and has("bodyslam")
  )
end

function oh_shit_pepp_com()
  return(
    oh_shit_pepp_mus() and has("wclimb")
  )
end

function oh_shit_pepp_che()
  return(
    oh_shit_pepp_com() or (has("op_pepp") and has("bodyslam") and (has("sjump") or has("ucut")))
  )
end

function oh_shit_pepp_s2()
  return(
    (oh_shit_pepp_com() and has("op_diff_norm") and has("taunt")) or (oh_shit_pepp_che() and has("op_diff_exp") and has("taunt"))
  )
end

function oh_shit_norm_pepp_s3()
  return(
    oh_shit_pepp_com() and has("op_diff_norm") and has("sjump")
  )
end

function oh_shit_noise_mus()
  return(
    has("op_noise") and (has("bodyslam") or has("nado") or has("crush"))
  )
end

function oh_shit_norm_noise_che()
  return(
    has("op_noise") and has("op_diff_norm") and (has("crush") or ((has("bodyslam") or has("nado")) and (has("wbounce") or has("sjump") or has("ucut"))))
  )
end

function oh_shit_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and (((has("bodyslam") or has("nado") or has("crush")) and (has("wbounce") or has("sjump") or has("ucut"))))
  )
end

function oh_shit_exp_noise_mus()
  return(
    oh_shit_noise_mus() or (has("op_noise") and has("op_diff_exp") and has("wbounce"))
  )
end

function oh_shit_exp_noise_com()
  return(
    has("op_noise") and has("op_diff_exp") and (has("wbounce") or has("crush") or ((has("sjump") or has("ucut")) and (has("bodyslam") or has("nado"))))
  )
end

function freezerator_pepp_che()
  return(
    has("op_pepp") and has("wclimb")
  )
end

function freezerator_pepp_mus()
  return(
    has("op_pepp") and (has("wclimb") or has("sjump"))
  )
end

function freezerator_norm_pepp_com()
  return(
    freezerator_pepp_che() and has("op_diff_norm") and has("bodyslam") and has("sjump")
  )
end

function freezerator_norm_pepp_s2()
  return(
    freezerator_norm_pepp_com() and has("grab") and has("staunt")
  )
end

function freezerator_exp_pepp_che()
  return(
    freezerator_pepp_che() or (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("ucut")))
  )
end

function freezerator_exp_pepp_com()
  return(
    has("op_noise") and has("op_diff_exp") and has("bodyslam") and (has("sjump") or has("wclimb"))
  )
end

function freezerator_norm_noise_s2()
  return (
    has("op_noise") and has("op_diff_norm") and has("grab")
  )
end

function freezerator_exp_noise_s2()
  return (
    has("op_noise") and has("op_diff_exp") and has("staunt")
  )
end

function reach_fake_pepp()
  return(
    reach_elevator_3() and calculate_floor_cost("op_f4_cost") and (has("prog_key_3") or has("op_oworld")) and (has("sjump") or has("wclimb") or (has("ucut") and has("op_noise")) or has("crush") or has("wbounce") or has("op_ladder4")) 
  )
end

function reach_elevator_4()
  return(
    reach_elevator_3()
  )
end

function pizzascare_pepp_com()
  return(
    has("op_pepp") and has("wclimb") and has("bodyslam")
  )
end

function pizzascare_pepp_mus()
  return(
    pizzascare_pepp_com() or (has("op_pepp") and has("sjump") and has("bodyslam"))
  )
end

function pizzascare_exp_pep_com()
  return(
    pizzascare_pepp_com() or (has("op_pepp") and has("op_diff_exp") and has("sjump") and has("bodyslam"))
  )
end

function pizzascare_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and (((has("sjump") or has("wbounce")) and (has("bodyslam") or has("nado") or has("crush"))))
  )
end

function pizzascare_norm_noise_che()
  return(
    has("op_noise") and has("op_diff_norm") and (has("crush") or (has("sjump") or has("wbounce") or has("ucut") and (has("bodyslam") or has("nado"))))
  )
end

function pizzascare_exp_noise_com()
  return(
    has("op_noise") and has("op_diff_exp") and (has("crush") or has("wbounce") or ((has("sjump") or has("ucut")) and (has("bodyslam") or has("nado"))))
  )
end

function dont_make_sound_pepp_che()
  return(
    has("op_pepp") and has("wclimb")
  )
end

function dont_make_sound_pepp_tom()
  return(
    dont_make_sound_pepp_che() and has("bodyslam")
  )
end

function dont_make_sound_pepp_sau()
  return(
    dont_make_sound_pepp_tom() or (has("op_pepp") and has("wclimb") and has("sjump"))
  )
end

function dont_make_sound_norm_pepp_com()
  return(
    dont_make_sound_pepp_sau() and has("op_diff_norm") and has("grab")
  )
end

function dont_make_sound_exp_pepp_che()
  return(
    dont_make_sound_pepp_che() or (has("op_pepp") and has("op_diff_exp") and has("sjump"))
  )
end

function dont_make_sound_exp_pepp_tom()
  return(
    dont_make_sound_pepp_tom() or (has("op_pepp") and has("op_diff_exp") and has("sjump") and has("bodyslam"))
  )
end

function dont_make_sound_exp_pepp_com()
  return(
    has("op_pepp") and has("op_diff_exp") and has("wclimb") and (has("grab") or has("ucut"))
  )
end

function dont_make_sound_exp_pepp_s2()
  return(
    dont_make_sound_pepp_che() or (has("op_pepp") and has("op_diff_exp") and has("sjump") and has("ucut"))
  )
end

function dont_make_sound_noise_che()
  return(
    has("op_noise") and (has("sjump") or has("ucut") or has("crush") or has("wbounce"))
  )
end

function dont_make_sound_noise_tom()
  return(
    has("op_noise") and has("sjump") and (has("bodyslam") or has("nado") or has("crush"))
  )
end

function dont_make_sound_noise_s3()
  return(
    has("op_noise") and has("sjump")
  )
end

function dont_make_sound_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and has("grab") and (has("crush") or (has("bodyslam") and has("sjump")))
  )
end

function dont_make_sound_norm_noise_sau()
  return(
    has("op_noise") and has("op_diff_norm") and (has("sjump") and (has("crush") or has("bodyslam")))
  )
end

function dont_make_sound_norm_noise_pin()
  return(
    dont_make_sound_norm_noise_sau() and has("grab")
  )
end

function dont_make_sound_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and has("grab") and (has("crush") or (has("sjump") or has("bodyslam")))
  )
end


function dont_make_sound_exp_noise_tom()
  return(
    dont_make_sound_noise_tom() or (has("op_noise") and has("op_diff_exp") and has("sjump") and has("wbounce"))
  )
end

function dont_make_sound_exp_noise_com()
  return(
    has("op_noise") and has("op_diff_exp") and has("sjump") and (has("grab") or has("ucut"))
  )
end

function war_pepp_com()
  return(
    has("op_pepp") and has("grab") and has("sjump") and has("bodyslam")
  )
end

function war_pepp_mus()
  return(
    has("op_pepp") and has("grab") and (has("sjump") or has("wclimb"))
  )
end

function war_norm_pepp_sau()
  return(
    war_pepp_mus() and has("op_diff_norm") and has("bodyslam")
  )
end

function war_exp_pepp_com()
  return(
    war_pepp_com() or (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and ((has("ucut") and has("sjump")) or (has("wclimb") and (has("grab") or has("ucut")))))
  )
end

function war_exp_pepp_che()
  return(
    war_pepp_mus() or (has("op_pepp") and has("op_diff_exp") and ((has("grab") and has("bodyslam")) or (has("ucut") and (has("sjump") or has("wclimb") or has("bodyslam")))))
  )
end

function war_exp_pepp_pin()
  return(
    has("op_pepp") and has("op_diff_exp") and has("bodyslam") and (has("grab") or has("ucut"))
  )
end

function war_noise_sau()
  return(
    has("op_noise") and has("grab") and (has("bodyslam") or has("crush"))
  )
end

function war_noise_che()
  return(
    war_noise_sau() or (has("op_noise") and has("grab") and (has("wbounce") or has("sjump")))
  )
end

function war_noise_exp_noise_sau()
  return(
    war_noise_che() or (has("op_noise") and has("op_diff_exp") and has("ucut") and (has("crush") or has("sjump") or has("wbounce") or has("bodyslam")))
  )
end

function war_exp_noise_pin()
  return(
    has("op_noise") and has("op_diff_exp") and (has("grab") or has("ucut")) and (has("sjump") or has("bodyslam"))
  )
end

function war_exp_noise_com()
  return(
    has("op_noise") and has("op_diff_exp") and has("sjump") and ((has("grab") or has("ucut")) and (has("bodyslam") or has("nado") or has("wbounce")))
  )
end

function reach_pizzaface()
  return(
    reach_elevator_4() and calculate_floor_cost("op_f5_cost") and (has("prog_key_4") or has("op_oworld")) and (has("sjump") or has("crush") or has("op_ladder5")) 
  )
end

function crumbling_tower_norm_pepp_com()
  return(
    has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("sjump") and has("wclimb")
  )
end

function crumbling_tower_exp_pepp_com()
  return(
    has("op_pepp") and has("op_diff_exp") and has("bodyslam") and has("grab") and (has("sjump") or has("wclimb"))
  )
end

function crumbling_tower_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and has("grab") and has("sjump") and (has("crush") or has("bodyslam") or has("nado"))
  )
end

function crumbling_tower_exp_noise_com()
  return(
    has("op_noise") and has("op_diff_exp") and has("grab") and (has("crush") or (has("sjump") and (has("bodyslam") or has("nado")) or has("wbounce")))
  )
end