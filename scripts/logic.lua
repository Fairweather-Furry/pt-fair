function has(item, amount)
  local count = Tracker:ProviderCountForCode(item)
  amount = tonumber(amount)
  if not amount then
    return count > 0
  else
    return count >= amount
  end
end

function dump_table(o, depth)
    if depth == nil then
        depth = 0
    end
    if type(o) == 'table' then
        local tabs = ('\t'):rep(depth)
        local tabs2 = ('\t'):rep(depth + 1)
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ',\n'
        end
        return s .. tabs .. '}'
    else
        return tostring(o)
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

function grab()
  return(
    has("grab") or not has("op_moverando")
  )
end

function mach4()
  return(
    has("mach4") or not has("op_moverando")
  )
end

function upper()
  return(
    has("ucut") or not has("op_moverando")
  )
end

function sjump()
  return(
    has("sjump") or not has("op_moverando")
  )
end

function taunt()
  return(
    has("taunt") or not has("op_moverando")
  )
end

function staunt()
  return(
    has("staunt") or not has("op_moverando")
  )
end

function slam()
  return(
    has("bodyslam") or not has("op_moverando")
  )
end

function climb()
  return(
    has("op_pepp") and (has("wclimb") or not has("op_moverando"))
  )
end

function djump()
  return(
    has("op_pepp") and (has("djump") or not has("op_moverando"))
  )
end

function kick()
  return(
    has("op_pepp") and (has("rkick") or not has("op_moverando"))
  )
end

function spin()
  return(
    has("op_pepp") and (has("spin") or not has("op_moverando"))
  )
end

function bounce()
  return(
    has("op_noise") and (has("wbounce") or not has("op_moverando"))
  )
end

function torn()
  return(
    has("op_noise") and (has("nado") or not has("op_moverando"))
  )
end

function crush()
  return(
    has("op_noise") and (has("crush") or not has("op_moverando"))
  )
end

function bomb()
  return(
    has("op_noise") and (has("bomb") or not has("op_moverando"))
  )
end

function ball()
  return(
    has("ball") or not has("op_tfrando")
  )
end

function knight()
  return(
    (grab() or (has("op_diff_exp") and upper())) and (has("knight") or not has("op_tfrando"))
  )
end

function fire()
  return(
    has("fmouth") or not has("op_tfrando")
  )
end

function ghost()
  return(
    has("ghost") or not has("op_tfrando")
  )
end

function mort()
  return(
    has("mort") or not has("op_tfrando")
  )
end

function ween()
  return(
    grab() and (has("weenie") or not has("op_tfrando"))
  )
end

function barr()
  return(
    has("barrel") or not has("op_tfrando")
  )
end

function bubb()
  return(
    has("obubble") or not has("op_tfrando")
  )
end

function rocket()
  return(
    has("rocket") or not has("op_tfrando")
  )
end

function box()
  return(
    has("pbox") or not has("op_tfrando")
  )
end

function sticky()
  return(
    has("scheese") or not has("op_tfrando")
  )
end

function satan()
  return(
    has("schoice") or not has("op_tfrando")
  )
end

function shotgun()
  return(
    (grab() or (has("op_diff_exp") and upper())) and (has("sgun") or not has("op_tfrando"))
  )
end

function revolver()
  return(
    grab() and has("op_pepp") and (has("revolve") or not has("op_tfrando"))
  )
end

function reach_tt()
  if Tracker:ProviderCountForCode("pumpkins") >= Tracker:ProviderCountForCode("op_tt_cost") then
    return true
  else
    return false
  end
end

function lap2()
  return(
    (not has("op_portal")) or (has("op_portal") and has("portal"))
  )
end

function pepp_slam()
  return(
    has("op_pepp") and slam()
  )
end

function pepp_grab()
  return(
    has("op_pepp") and grab()
  )
end

function climb_or_jump()
  return(
    climb() or (has("op_pepp") and sjump())
  )
end

function bomb_or_grab()
  return(
    bomb() or noise_grab()
  )
end

function noise_grab()
  return(
    has("op_noise") and grab()
  )
end

function noise_slam()
  return(
    has("op_noise") and slam()
  )
end

function noise_upper()
  return(
    has("op_noise") and upper()
  )
end

function bounce_or_jump()
  return(
    bounce() or (has("op_noise") and sjump())
  )
end

function tutorial_tom()
  return(
    slam() and (climb() or (has("op_diff_exp") and sjump() and grab()))
  )
end

function tutorial_sau()
  return(
    (slam() and climb() and sjump()) or (has("op_diff_exp") and grab() and climb_or_jump())
  )
end

function tutorial_pepp_com()
  return(
    pepp_slam() and grab() and ((climb() and sjump()) or (has("op_diff_exp") and climb_or_jump()))
  )
end

function tutorial_noise_com()
  return(
    has("op_noise") and ((sjump() and (slam() or torn() or bounce())) or (has("op_diff_exp") and crush()))
  )
end

function john_gutter_pepp_mus()
  return(
    has("op_pepp") and (climb_or_jump() or upper() or (has("op_diff_exp") and (grab() or slam())))
  )
end

function john_gutter_pepp_tom()
  return(
    has("op_pepp") and ((slam() and (climb_or_jump() or upper())) or (has("op_diff_exp") and (climb_or_jump() or upper() or grab() or slam())))
  )
end

function john_gutter_pepp_com()
  return(
    has("op_pepp") and ((sjump() and slam()) or (has("op_diff_exp") and (climb_or_jump())))
  )
end

function john_gutter_pepp_ct3()
  return(
    has("op_pepp") and ((climb() and sjump() and mach4() and slam()) or (has("op_diff_exp") and (climb_or_jump())))
  )
end

function john_gutter_pepp_pum()
  return(
    has("op_pepp") and (climb_or_jump() or upper() or (has("op_diff_exp") and grab()))
  )
end

function john_gutter_noise_mus()
  return(
    has("op_noise") and (sjump() or bounce() or crush() or upper() or (has("op_diff_exp") and (grab() or slam())))
  )
end

function john_gutter_noise_tom()
  return(
    has("op_noise") and (crush() or (slam() and (sjump() or bounce() or upper())) or (has("op_diff_exp") and (sjump() or upper() or bounce() or grab() or slam())))
  )
end

function john_gutter_noise_com()
  return(
    has("op_noise") and ((sjump() and (slam() or crush())) or (has("op_diff_exp") and (sjump() or upper() or crush() or bounce())))
  )
end

function john_gutter_noise_ct3()
  return(
    has("op_noise") and ((sjump() and mach4() and (slam() or crush())) or (has("op_diff_exp") and (sjump() or upper() or crush() or bounce())))
  )
end

function john_gutter_noise_pum()
  return(
    has("op_noise") and (sjump() or bounce() or crush() or upper() or (has("op_diff_exp") and grab()))
  )
end

function pizzascape_pepp_pin()
  return(
    knight() and (pepp_grab() or (has("op_pepp") and has("op_diff_exp") and upper()))
  )
end

function pizzascape_pepp_com()
  return(
    has("op_pepp") and knight() and ((grab() and climb()) or (has("op_diff_exp") and ((climb_or_jump() and upper()) or (sjump() and grab()))))
  )
end

function pizzascape_pepp_s3()
  return(
    knight() and ((pepp_grab() and sjump()) or (has("op_diff_exp") and ((upper() and climb_or_jump()) or (grab() and climb()))))
  )
end

function pizzascape_pepp_srank()
  return(
    knight() and ((pepp_grab() and climb() and sjump()) or (has("op_diff_exp") and (climb_or_jump() and (upper() or grab()))))
  )
end

function pizzascape_noise_pin()
  return(
    knight() and (noise_grab() or (has("op_diff_exp") and noise_upper()))
  )
end

function pizzascape_noise_com()
  return(
    has("op_noise") and knight() and ((noise_grab() and sjump()) or (has("op_diff_exp") and (upper() or (grab() and (bounce() or crush())))))
  )
end

function pizzascape_noise_ct1()
  return(
    knight() and ((has("op_diff_norm") and noise_grab() and (upper() or sjump() or bounce() or crush())) or (has("op_diff_exp") and (noise_grab() or noise_upper())))
  )
end

function pizzascape_noise_pum()
  return(
    knight() and ((noise_grab() and (sjump() or bounce())) or (noise_upper() and (grab() or has("op_diff_exp"))) or (grab() and crush()))
  )
end

function ancient_cheese_pepp_tom()
  return(
    (grab() and slam() and climb_or_jump()) or (has("op_diff_exp") and (upper() or (grab() and climb_or_jump())))
  )
end

function reach_floor1_upper()
  return(
    sjump() or climb() or noise_upper() or crush() or bounce() or has("op_ladder1")
  )
end

function ancient_cheese_pepp_com()
  return(
    pepp_slam() and ((grab() and climb_or_jump()) or (has("op_diff_exp") and climb_or_jump() and upper()))
  )
end

function ancient_cheese_pepp_tre()
  return(
    (grab() and slam() and climb_or_jump()) or (has("op_diff_exp") and climb_or_jump() and (grab() or upper()))
  )
end

function ancient_cheese_noise_che()
  return(
    (noise_grab() and (sjump() or upper() or bounce() or crush() or has("op_diff_exp"))) or (has("op_diff_exp") and noise_upper())
  )
end

function ancient_cheese_noise_tom()
  return(
    (noise_grab() and (upper() or bounce_or_jump()) and (slam() or torn() or crush())) or (has("op_diff_exp") and (noise_upper() or (grab() and bounce_or_jump())))
  )
end

function ancient_cheese_noise_pin()
  return(
    has("op_noise") and ((noise_grab() and (upper() or bounce_or_jump()) and (slam() or torn() or crush())) or (has("op_diff_exp") and ((noise_slam() or torn() or crush()) and (upper() or (grab() and bounce_or_jump())))))
  )
end

function ancient_cheese_noise_com()
  return(
    (noise_grab() and sjump() and (slam() or torn() or crush())) or (has("op_diff_exp") and (noise_slam() or torn() or crush()) and upper() and bounce_or_jump())
  )
end

function ancient_cheese_noise_ct1()
  return(
    ((noise_grab() and (upper() or bounce_or_jump()) and (slam() or torn() or crush())) or (has("op_diff_exp") and upper() and (slam() or torn() or crush()) and bounce_or_jump()))
  )
end

function bloodsauce_dungeon_pepp_mus()
  return(
    has("op_pepp") and (climb_or_jump() or has("op_diff_exp"))
  )
end

function bloodsauce_dungeon_pepp_com()
  return(
    pepp_slam() and ((has("op_diff_exp") and sjump()) or climb())
  )
end

function bloodsauce_dungeon_pepp_s3()
  return(
    slam() and climb_or_jump()
  )
end

function bloodsauce_dungeon_pepp_srank()
  return(
    pepp_slam() and ((climb() and sjump()) or (has("op_pepp_exp") and climb_or_jump()))
  )
end

function bloodsauce_dungeon_noise_mus()
  return(
    has("op_noise") and (bounce_or_jump() or upper() or crush() or has("op_noise_exp"))
  )
end

function bloodsauce_dungeon_noise_pin()
  return(
    has("op_noise") and (slam() or torn() or crush() or (has("op_noise_exp") and bounce()))
  )
end

function reach_pepperman()
  return(
    calculate_floor_cost("op_f1_cost")
  )
end


--function boss_noise()
--  return(
--    has("op_noise") and has("bomb")
--  )
--end

--function boss_norm_noise()
--  return(
--    boss_noise() or (has("op_noise") and has("op_diff_norm") and has("grab"))
--  )
--end

function reach_elevator_1()
  return(
    sjump() or climb() or (has("op_noise") and upper()) or crush() or bounce() or has("op_ladder1")
  )
end

function reach_floor2()
  return(
    reach_elevator_1() and (has("prog_key_1") or has("op_oworld"))
  )
end

function oregano_desert_pepp_mus()
  return(
    has("op_pepp") and (climb_or_jump() or (has("op_diff_exp") and upper()))
  )
end

function oregano_desert_pepp_com()
  return(
    fire() and (climb() or (has("op_diff_exp") and pepp_grab() and (sjump() or upper())))
  )
end

function oregano_desert_pepp_srank()
  return(
    fire() and (climb() or (has("op_diff_exp") and sjump() and pepp_grab()))
  )
end

function oregano_desert_noise_mus()
  return(
    has("op_noise") and (bounce_or_jump() or upper() or crush())
  )
end

function oregano_desert_noise_srank()
  return(
    fire() and (bounce() or (has("op_noise") and has("op_diff_exp") and sjump()))
  )
end

function wasteyard_pepp_che()
  return(
    has("op_pepp") and ghost() and (sjump() or climb() or has("op_diff_exp"))
  )
end

function wasteyard_pepp_com()
  return(
    ghost() and climb_or_jump()
  )
end

function wasteyard_noise_che()
  return(
    has("op_noise") and ghost() and (bounce_or_jump() or upper() or crush() or has("op_diff_exp"))
  )
end

function wasteyard_noise_pin()
  return(
    has("op_noise") and ghost() and (bounce_or_jump() or upper() or crush())
  )
end

function wasteyard_noise_com()
  return(
    has("op_noise") and ghost() and (bounce_or_jump() or upper() or (crush() and has("op_diff_exp")) )
  )
end

function wasteyard_noise_srank()
  return(
    has("op_noise") and ghost() and (bounce_or_jump() or ((crush() or upper()) and has("op_diff_exp")))
  )
end

function fun_farm_pepp_che()
  return(
    pepp_slam() and mort() and (climb_or_jump() or upper())
  )
end

function fun_farm_pepp_com()
  return(
    pepp_slam() and mort() and (climb() or (has("op_diff_exp") and (sjump() or (upper() and grab()))))
  )
end

function fun_farm_pepp_ct2()
  return(
    pepp_slam() and mort() and staunt() and (climb() or (has("op_diff_exp") and sjump()))
  )
end


function fun_farm_noise_com()
  return(
    mort() and (crush() or (noise_slam() and (bounce_or_jump() or upper())))
  )
end

function fun_farm_noise_s1()
  return(
    has("op_noise") and ((crush() or ((bounce_or_jump() or upper()) and (slam() or torn()))) or (has("op_diff_exp") and (bounce() or ((sjump() or uppper()) and (slam() or torn())))))
  )
end

function fastfood_saloon_pepp_com()
  return(
    ween() and ((sjump() and climb()) or (has("op_diff_exp") and climb_or_jump()))
  )
end

function fastfood_saloon_pepp_srank()
  return(
    ween() and climb() and (sjump() or has("op_diff_exp"))
  )
end

function fastfood_saloon_noise_com()
  return(
    has("op_noise") and ween() and (sjump() or (has("op_diff_exp") and (upper() or crush() or bounce())))
  )
end

function reach_vigilante()
  return(
    reach_floor2() and calculate_floor_cost("op_f2_cost")
  )
end

function reach_elevator_2()
  return(
    reach_elevator_1()
  )
end

function reach_crust_cove()
  return(
    reach_elevator_2() and (has("prog_key_2") or has("op_oworld"))
  )
end

function crust_cove_pepp_com()
  return(
    barr() and pepp_slam() and (climb() or (has("op_diff_exp") and sjump() and upper()))
  )
end

function crust_cove_pepp_ct3()
  return(
    pepp_slam() and ((climb() and barr()) or (has("op_diff_exp") and (sjump() or climb())))
  )
end

function crust_cove_noise_com()
  return(
    has("op_noise") and barr() and ((sjump() and (slam() or crush() or torn())) or (has("op_diff_exp") and (crush() or (sjump() and bounce()))))
  )
end

function crust_cove_noise_ct3()
  return(
    has("op_noise") and ((barr() and sjump() and (slam() or crush())) or (has("op_diff_exp") and (crush() or (slam() and (bounce_or_jump() or upper())))))
  )
end

function crust_cove_noise_pum()
  return(
    has("op_noise") and barr() and ((sjump() and (torn() or slam() or bounce() or crush())) or (has("op_diff_exp") and crush()))
  )
end

function reach_gnome_forest()
  return(
    reach_elevator_2() and (has("prog_key_2") or has("op_oworld")) and (has("sjump") or has("wclimb") or has("ucut") or has("crush") or has("wbounce") or has("op_ladder3"))
  )
end

function gnome_forest_pepp_pin()
  return(
    slam() and djump() and (spin() or kick() or has("op_diff_exp"))
  )
end

function gnome_forest_pepp_com()
  return(
    slam() and djump() and ((climb_or_jump() and (spin() or kick() or has("op_diff_exp"))))
  )
end

function gnome_forest_noise_che()
  return(
    crush() or (has("op_diff_exp") and noise_grab() and slam() and (bounce_or_jump() or upper()))
  )
end

function gnome_forest_noise_tom()
  return(
    (crush() and (bounce_or_jump() or upper() or has("op_diff_exp"))) or (has("op_diff_exp") and noise_grab() and slam() and (bounce_or_jump() or upper()))
  )
end

function gnome_forest_noise_com()
  return(
    crush() and (bounce_or_jump() or has("op_diff_exp"))
  )
end

function reach_deep_dish_9()
  return(
    reach_elevator_2() and (has("prog_key_2") or has("op_oworld")) and (has("sjump") or has("wclimb") or has("op_ladder3") or has("op_noise"))
  )
end

function deep_dish_9_pepp_pin()
  return(
    pepp_slam() and rocket() and bubb() and climb_or_jump()
  )
end

function deep_dish_9_pepp_com()
  return(
    pepp_slam() and rocket() and bubb() and (climb() or (has("op_diff_exp") and sjump() and grab()))
  )
end

function deep_dish_9_pepp_s1()
  return(
    pepp_slam() and rocket() and bubb() and (climb_or_jump() or upper() or has("op_diff_exp"))
  )
end

--function deep_dish_9_pepp_com()
--  return(
--    pepp_slam() and has("wclimb")
--  )
--end
--
--function deep_dish_9_exp_pepp_com()
--  return(
--    deep_dish_9_pepp_com() or (has("op_pepp") and has("op_diff_exp") and has ("bodyslam") and has("sjump"))
--  )
--end
--
--function deep_dish_9_pepp_pin()
--  return(
--    deep_dish_9_pepp_com() or (has("op_pepp") and has("bodyslam") and has("sjump"))
--  )
--end
--
--function deep_dish_9_norm_pepp_che()
--  return(
--    deep_dish_9_pepp_pin() or (has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("ucut"))
--  )
--end
--
----function deep_dish_9_pepp_mus()
----  return(
----    has("op_pepp") and has("bodyslam")
----  )
----end
--
--function deep_dish_9_noise_mus()
--  return(
--    has("op_noise") and (has("bodyslam") or has("crush") or has("nado"))
--  )
--end
--
--function deep_dish_9_noise_ct3()
--  return(
--    has("op_noise") and has("bodyslam") and (has("sjump") or has("ucut") or has("wbounce"))
--  )
--end
--
--function deep_dish_9_norm_noise_com()
--  return(
--    has("op_noise") and has("op_diff_norm") and ((has("bodyslam") or has("nado") or has("crush")) and (has("sjump") or has("wbounce") or has("ucut")))
--  )
--end
--
--
--function deep_dish_9_exp_noise_tom()
--  return(
--    deep_dish_9_noise_mus() or (has("op_noise") and has("op_diff_exp") and has("wbounce"))
--  )
--end
--
--function deep_dish_9_exp_noise_com()
--  return(
--    has("op_noise") and has("op_diff_exp") and (has("wbounce") or has("crush") or ((has("sjump") or has("ucut")) and (has("bodyslam") or has("nado"))))
--  )
--end
--
--function deep_dish_9_exp_noise_pin()
--  return(
--    has("op_noise") and has("op_diff_exp") and (has("crush") or ((has("sjump") or has("ucut")) and (has("wbounce") or has("nado"))))
--  )
--end
--
--function deep_dish_9_exp_noise_ct3()
--  return(
--    deep_dish_9_noise_ct3() or (has("op_noise") and has("op_diff_exp") and has("crush") and has("bodyslam"))
--  )
--end

function reach_golf()
  return(
    reach_elevator_2() and (has("prog_key_2") or has("op_oworld")) and (has("sjump") or has("wclimb") or (has("ucut") and has("op_noise")) or has("crush") or has("wbounce") or has("op_ladder3") )
  )
end

function golf_norm_pepp_com()
  return(
    has("op_pepp") and has("op_diff_norm") and has("grab") and (has("wclimb") or has("sjump") or has("ucut"))
  )
end

function golf_norm_pepp_tre()
  return(
    has("op_pepp") and has("op_diff_norm") and has("grab") and (has("wclimb") or has("sjump"))
  )
end

function golf_exp_pepp_com()
  return(
    has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("bodyslam") or has("wclimb") or has("ucut"))
  )
end

function golf_exp_pepp_tre()
  return(
    has("op_pepp") and has("op_diff_exp") and (has("sjump") or (has("wclimb") and (has("grab") or has("bodyslam"))))
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

function reach_floor4_lower()
  return(
    reach_elevator_3() and (has("prog_key_3") or has("op_oworld"))
  )
end

--function pig_city_pepp_tom()
--  return(
--    has("op_pepp") and has("bodyslam")
--  )
--end

function pig_city_pepp_com()
  return(
    pepp_slam() and has("djump")
  )
end

function pig_city_pepp_che()
  return(
    has("op_pepp") and (has("sjump") or has("wclimb"))
  )
end

function pig_city_pepp_srank()
  return(
    pepp_slam() and has("djump") and (has("sjump") or has("wclimb") or has("ucut"))
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

function pig_city_norm_noise_sau()
  return(
    has("op_noise") and has("op_diff_norm") and (has("bodyslam") or has("crush")) and (has("sjump") or has("wbounce"))
  )
end

function pig_city_norm_noise_srank()
  return(
    has("op_noise") and has("op_diff_norm") and has("sjump") and (has("bodyslam") or has("crush"))
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
    peppibot_factory_pepp_mus() and has("op_diff_norm") and (has("wclimb") or has("ucut"))
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
    (peppibot_factory_pepp_mus() and has("op_diff_exp")) or (has("op_pepp") and has("op_diff_exp") and has("wclimb") and (has("grab") or has("ucut")))
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
    peppibot_factory_exp_pepp_s1() and has("bodyslam") and has("op_diff_exp")
  )
end

function peppibot_factory_exp_pepp_pum()
  return(
    has("op_pepp") and has("op_diff_exp") and ((has("sjump") or has("ucut")) or (has("wclimb") and (has("grab") or has("ucut"))))
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


function peppibot_factory_exp_noise_pin()
  return(
    peppibot_factory_noise_pin() or (has("op_noise") and has("op_diff_exp") and (has("crush") or has("ucut")))
  )
end

function peppibot_factory_exp_noise_com()
  return(
    has("op_noise") and has("op_diff_exp") and (has("crush") or ((has("sjump") or has("ucut")) and (has("wbounce") or has("nado"))))
  )
end

--function oh_shit_pepp_mus()
--  return(
--    has("op_pepp") and has("bodyslam")
--  )
--end

function oh_shit_pepp_com()
  return(
    pepp_slam() and has("wclimb")
  )
end

function oh_shit_pepp_che()
  return(
    oh_shit_pepp_com() or (pepp_slam() and (has("sjump") or has("ucut")))
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

function reach_freezerator()
  return(
    reach_elevator_3() and (has("prog_key_3") or has("op_oworld")) and (has("sjump") or has("wclimb") or (has("ucut") and has("op_noise")) or has("crush") or has("wbounce") or has("op_ladder4")) 
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

function freezerator_noise_srank()
  return(
    has("op_noise") and (has("bodyslam") or has("crush") or has("nado") or has("wbounce"))
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
    has("op_pepp") and has("op_diff_exp") and has("bodyslam") and (has("sjump") or has("wclimb"))
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

function freezerator_exp_noise_ct2()
  return(
    freezerator_exp_noise_s2() or (has("op_noise") and has("op_diff_exp") and has("grab"))
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

function reach_floor5_lower()
  return(
    reach_elevator_4() and (has("prog_key_4") or has("op_oworld")) and (has("sjump") or has("wclimb") or (has("ucut") and has("op_noise")) or has("crush") or has("wbounce") or has("op_ladder5"))
  )
end

function pizzascare_pepp_com()
  return(
    pepp_slam() and has("wclimb")
  )
end

function pizzascare_pepp_mus()
  return(
    pizzascare_pepp_com() or (pepp_slam() and has("sjump"))
  )
end

function pizzascare_pepp_pum()
  return(
    has("op_pepp") and (has("sjump") or has("wclimb"))
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
    has("op_pepp") and has("op_diff_norm") and has("wclimb") and has("bodyslam") and has("grab")
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
    has("op_noise") and has("sjump") and (has("nado") or has("bodyslam"))
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

function dont_make_sound_norm_noise_tom()
  return(
    dont_make_sound_noise_tom() or (has("op_noise") and has("op_diff_norm") and has("sjump") and has("crush")) 
  )
end

function dont_make_sound_norm_noise_sau()
  return(
    has("op_noise") and has("op_diff_norm") and has("sjump")
  )
end

function dont_make_sound_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and has("sjump") and has("bodyslam") and has("grab")
  )
end

function dont_make_sound_exp_noise_tom()
  return(
    dont_make_sound_noise_tom() or (has("op_noise") and has("op_diff_exp") and (has("crush") or has("wbounce")))
  )
end

function dont_make_sound_exp_noise_com()
  return(
    has("op_noise") and has("op_diff_exp") and (has("sjump") or has("crush") or has("wbounce")) and (has("grab") or has("ucut"))
  )
end

function dont_make_sound_exp_noise_s3()
  return (
    dont_make_sound_noise_s3() or (has("op_noise") and has("op_diff_exp") and (has("crush") or has("wbounce")))
  )
end

function dont_make_sound_exp_noise_srank()
  return(
    has("op_noise") and has("op_diff_exp") and ((has("sjump") and ((has("grab") or has("ucut")) and (has("bodyslam") or has("nado")))) or ((has("crush") or has("wbounce")) and (has("grab") or has("ucut"))))
  )
end

function reach_war()
  return(
    reach_elevator_4() and (has("prog_key_4") or has("op_oworld")) and (has("sjump")  or has("crush") or has("op_ladder5"))
  )
end

function war_pepp_com()
  return(
    pepp_slam() and has("grab") and has("sjump")
  )
end

function war_pepp_mus()
  return(
    pepp_grab() and (has("sjump") or has("wclimb"))
  )
end

function war_norm_pepp_sau()
  return(
    war_pepp_mus() and has("op_diff_norm") and has("bodyslam")
  )
end

function war_exp_pepp_com()
  return(
    war_pepp_mus() or (has("op_pepp") and has("op_diff_exp") and ((has("grab") and has("bodyslam")) or (has("ucut") and (has("sjump") or has("wclimb") or has("bodyslam")))))
  )
end

function war_exp_pepp_pin()
  return(
    pepp_slam() and has("op_diff_exp") and (has("grab") or has("ucut"))
  )
end

function war_exp_pepp_ct1()
  return(
    has("op_pepp") and has("op_diff_exp") and ((has("grab") or has("ucut")) and (has("sjump") or has("wclimb") or (has("bodyslam") and has("mach4"))))
  )
end

function war_noise_che()
  return(
    has("op_noise") and has("grab") and (has("wbounce") or has("sjump"))
  )
end

function war_norm_noise_sau()
  return(
    war_noise_che() and has("op_diff_norm") and (has("bodyslam") or has("crush") or has("nado"))
  )
end

function war_norm_noise_com()
  return(
    has("op_noise") and has("op_diff_norm") and has("grab") and has("sjump") and (has("bodyslam") or has("crush") or has("nado"))
  )
end

function war_exp_noise_ct1()
  return(
    has("op_noise") and has("op_diff_exp") and ((has("grab") or has("ucut")) and (has("sjump") or has("crush")))
  )
end

function war_exp_noise_com()
  return(
    war_exp_noise_ct1() or (has("op_noise") and has("op_diff_exp") and has("bodyslam") and (has("grab") or has("ucut")))
  )
end

function war_exp_noise_sau()
  return(
    war_exp_noise_com() or (has("op_noise") and has("op_diff_exp") and has("wbounce") and (has("grab") or has("ucut")))
  )
end

function reach_pizzaface()
  return(
    reach_elevator_4() and calculate_floor_cost("op_f5_cost") and (has("prog_key_4") or has("op_oworld")) and (has("sjump") or has("crush") or has("op_ladder5")) 
  )
end

function crumbling_tower_pepp_pum()
  return(
    pepp_slam() and has("grab")
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

function crumbling_tower_exp_pepp_pum()
  return(
    crumbling_tower_pepp_pum() or (has("op_pepp") and has("op_diff_exp") and has("ucut") and has("bodyslam"))
  )
end

function crumbling_tower_noise_pum()
  return(
    has("op_noise") and has("grab") and (has("bodyslam") or has("nado") or has("crush"))
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

function crumbling_tower_exp_noise_pum()
  return(
    crumbling_tower_noise_pum() or (has("op_noise") and has("op_diff_exp") and ((has("grab") and has("wbounce")) or (has("ucut") and (has("bodyslam") or has("nado") or has("crush") or has("wbounce")))))
  )
end

function tricky_treat_pepp_pum5()
  return(
    has("op_pepp") and has("wclimb")
  )
end

function tricky_treat_pepp_pumS4()
  return(
    tricky_treat_pepp_pum5() or (has("op_pepp") and has("sjump"))
  )
end

function tricky_treat_pepp_pum3()
  return(
    tricky_treat_pepp_pumS4() or (has("op_pepp") and has("ucut"))
  )
end

function tricky_treat_noise_pum4()
  return(
    has("op_noise") and (has("wbounce") or has("sjump"))
  )
end

function tricky_treat_noise_pum3()
  return(
    tricky_treat_noise_pum4() or (has("op_noise") and (has("ucut") or has("crush")))
  )
end

function tricky_treat_noise_pum5()
  return(
    has("op_noise") and ((has("wbounce") and has("ucut")) or has("sjump"))
  )
end

function tricky_treat_norm_noise_pum4()
  return(
    tricky_treat_noise_pum4() or (has("op_noise") and has("ucut"))
  )
end

function tricky_treat_exp_noise_pum4()
  return(
    tricky_treat_noise_pum4() or (has("op_noise") and has("op_diff_exp") and has("crush"))
  )
end

function tricky_treat_exp_noise_pum5()
  return(
    tricky_treat_noise_pum5() or (has("op_noise") and has("op_diff_exp") and has("crush"))
  )
end

function john_gutter_access()
  return(
    has("op_1johngutter") or has("op_2johngutter") or 
    ((has("op_3johngutter") or has("op_4johngutter")) and reach_floor1_upper()) or
    ((has("op_5johngutter") or has("op_6johngutter") or has("op_7johngutter") or has("op_8johngutter")) and reach_floor2()) or
    (has("op_9johngutter") and reach_crust_cove()) or 
    (has("op_10johngutter") and reach_gnome_forest()) or
    (has("op_11johngutter") and reach_deep_dish_9()) or
    (has("op_12johngutter") and reach_golf()) or
    ((has("op_13johngutter") or has("op_14johngutter") or has("op_15johngutter")) and reach_floor4_lower()) or
    (has("op_16johngutter") and reach_freezerator()) or
    ((has("op_17johngutter") or has("op_18johngutter")) and reach_floor5_lower()) or
    (has("op_19johngutter") and reach_war())
  )
end

function pizzascape_access()
  return(
    has("op_1pizzascape") or has("op_2pizzascape") or 
    ((has("op_3pizzascape") or has("op_4pizzascape")) and reach_floor1_upper()) or
    ((has("op_5pizzascape") or has("op_6pizzascape") or has("op_7pizzascape") or has("op_8pizzascape")) and reach_floor2()) or
    (has("op_9pizzascape") and reach_crust_cove()) or 
    (has("op_10pizzascape") and reach_gnome_forest()) or
    (has("op_11pizzascape") and reach_deep_dish_9()) or
    (has("op_12pizzascape") and reach_golf()) or
    ((has("op_13pizzascape") or has("op_14pizzascape") or has("op_15pizzascape")) and reach_floor4_lower()) or
    (has("op_16pizzascape") and reach_freezerator()) or
    ((has("op_17pizzascape") or has("op_18pizzascape")) and reach_floor5_lower()) or
    (has("op_19pizzascape") and reach_war())
  )
end

function ancient_cheese_access()
  return(
    has("op_1ancientcheese") or has("op_2ancientcheese") or 
    ((has("op_3ancientcheese") or has("op_4ancientcheese")) and reach_floor1_upper()) or
    ((has("op_5ancientcheese") or has("op_6ancientcheese") or has("op_7ancientcheese") or has("op_8ancientcheese")) and reach_floor2()) or
    (has("op_9ancientcheese") and reach_crust_cove()) or 
    (has("op_10ancientcheese") and reach_gnome_forest()) or
    (has("op_11ancientcheese") and reach_deep_dish_9()) or
    (has("op_12ancientcheese") and reach_golf()) or
    ((has("op_13ancientcheese") or has("op_14ancientcheese") or has("op_15ancientcheese")) and reach_floor4_lower()) or
    (has("op_16ancientcheese") and reach_freezerator()) or
    ((has("op_17ancientcheese") or has("op_18ancientcheese")) and reach_floor5_lower()) or
    (has("op_19ancientcheese") and reach_war())
  )
end

function bloodsauce_dungeon_access()
  return(
    has("op_1bloodsaucedungeon") or has("op_2bloodsaucedungeon") or 
    ((has("op_3bloodsaucedungeon") or has("op_4bloodsaucedungeon")) and reach_floor1_upper()) or
    ((has("op_5bloodsaucedungeon") or has("op_6bloodsaucedungeon") or has("op_7bloodsaucedungeon") or has("op_8bloodsaucedungeon")) and reach_floor2()) or
    (has("op_9bloodsaucedungeon") and reach_crust_cove()) or 
    (has("op_10bloodsaucedungeon") and reach_gnome_forest()) or
    (has("op_11bloodsaucedungeon") and reach_deep_dish_9()) or
    (has("op_12bloodsaucedungeon") and reach_golf()) or
    ((has("op_13bloodsaucedungeon") or has("op_14bloodsaucedungeon") or has("op_15bloodsaucedungeon")) and reach_floor4_lower()) or
    (has("op_16bloodsaucedungeon") and reach_freezerator()) or
    ((has("op_17bloodsaucedungeon") or has("op_18bloodsaucedungeon")) and reach_floor5_lower()) or
    (has("op_19bloodsaucedungeon") and reach_war())
  )
end

function oregano_desert_access()
  return(
    has("op_1oreganodesert") or has("op_2oreganodesert") or 
    ((has("op_3oreganodesert") or has("op_4oreganodesert")) and reach_floor1_upper()) or
    ((has("op_5oreganodesert") or has("op_6oreganodesert") or has("op_7oreganodesert") or has("op_8oreganodesert")) and reach_floor2()) or
    (has("op_9oreganodesert") and reach_crust_cove()) or 
    (has("op_10oreganodesert") and reach_gnome_forest()) or
    (has("op_11oreganodesert") and reach_deep_dish_9()) or
    (has("op_12oreganodesert") and reach_golf()) or
    ((has("op_13oreganodesert") or has("op_14oreganodesert") or has("op_15oreganodesert")) and reach_floor4_lower()) or
    (has("op_16oreganodesert") and reach_freezerator()) or
    ((has("op_17oreganodesert") or has("op_18oreganodesert")) and reach_floor5_lower()) or
    (has("op_19oreganodesert") and reach_war())
  )
end

function wasteyard_access()
  return(
    has("op_1wasteyard") or has("op_2wasteyard") or 
    ((has("op_3wasteyard") or has("op_4wasteyard")) and reach_floor1_upper()) or
    ((has("op_5wasteyard") or has("op_6wasteyard") or has("op_7wasteyard") or has("op_8wasteyard")) and reach_floor2()) or
    (has("op_9wasteyard") and reach_crust_cove()) or 
    (has("op_10wasteyard") and reach_gnome_forest()) or
    (has("op_11wasteyard") and reach_deep_dish_9()) or
    (has("op_12wasteyard") and reach_golf()) or
    ((has("op_13wasteyard") or has("op_14wasteyard") or has("op_15wasteyard")) and reach_floor4_lower()) or
    (has("op_16wasteyard") and reach_freezerator()) or
    ((has("op_17wasteyard") or has("op_18wasteyard")) and reach_floor5_lower()) or
    (has("op_19wasteyard") and reach_war())
  )
end

function fun_farm_access()
  return(
    has("op_1funfarm") or has("op_2funfarm") or 
    ((has("op_3funfarm") or has("op_4funfarm")) and reach_floor1_upper()) or
    ((has("op_5funfarm") or has("op_6funfarm") or has("op_7funfarm") or has("op_8funfarm")) and reach_floor2()) or
    (has("op_9funfarm") and reach_crust_cove()) or 
    (has("op_10funfarm") and reach_gnome_forest()) or
    (has("op_11funfarm") and reach_deep_dish_9()) or
    (has("op_12funfarm") and reach_golf()) or
    ((has("op_13funfarm") or has("op_14funfarm") or has("op_15funfarm")) and reach_floor4_lower()) or
    (has("op_16funfarm") and reach_freezerator()) or
    ((has("op_17funfarm") or has("op_18funfarm")) and reach_floor5_lower()) or
    (has("op_19funfarm") and reach_war())
  )
end

function fastfood_saloon_access()
  return(
    has("op_1fastfoodsaloon") or has("op_2fastfoodsaloon") or 
    ((has("op_3fastfoodsaloon") or has("op_4fastfoodsaloon")) and reach_floor1_upper()) or
    ((has("op_5fastfoodsaloon") or has("op_6fastfoodsaloon") or has("op_7fastfoodsaloon") or has("op_8fastfoodsaloon")) and reach_floor2()) or
    (has("op_9fastfoodsaloon") and reach_crust_cove()) or 
    (has("op_10fastfoodsaloon") and reach_gnome_forest()) or
    (has("op_11fastfoodsaloon") and reach_deep_dish_9()) or
    (has("op_12fastfoodsaloon") and reach_golf()) or
    ((has("op_13fastfoodsaloon") or has("op_14fastfoodsaloon") or has("op_15fastfoodsaloon")) and reach_floor4_lower()) or
    (has("op_16fastfoodsaloon") and reach_freezerator()) or
    ((has("op_17fastfoodsaloon") or has("op_18fastfoodsaloon")) and reach_floor5_lower()) or
    (has("op_19fastfoodsaloon") and reach_war())
  )
end

function crust_cove_access()
  return(
    has("op_1crustcove") or has("op_2crustcove") or 
    ((has("op_3crustcove") or has("op_4crustcove")) and reach_floor1_upper()) or
    ((has("op_5crustcove") or has("op_6crustcove") or has("op_7crustcove") or has("op_8crustcove")) and reach_floor2()) or
    (has("op_9crustcove") and reach_crust_cove()) or 
    (has("op_10crustcove") and reach_gnome_forest()) or
    (has("op_11crustcove") and reach_deep_dish_9()) or
    (has("op_12crustcove") and reach_golf()) or
    ((has("op_13crustcove") or has("op_14crustcove") or has("op_15crustcove")) and reach_floor4_lower()) or
    (has("op_16crustcove") and reach_freezerator()) or
    ((has("op_17crustcove") or has("op_18crustcove")) and reach_floor5_lower()) or
    (has("op_19crustcove") and reach_war())
  )
end

function gnome_forest_access()
  return(
    has("op_1gnomeforest") or has("op_2gnomeforest") or 
    ((has("op_3gnomeforest") or has("op_4gnomeforest")) and reach_floor1_upper()) or
    ((has("op_5gnomeforest") or has("op_6gnomeforest") or has("op_7gnomeforest") or has("op_8gnomeforest")) and reach_floor2()) or
    (has("op_9gnomeforest") and reach_crust_cove()) or 
    (has("op_10gnomeforest") and reach_gnome_forest()) or
    (has("op_11gnomeforest") and reach_deep_dish_9()) or
    (has("op_12gnomeforest") and reach_golf()) or
    ((has("op_13gnomeforest") or has("op_14gnomeforest") or has("op_15gnomeforest")) and reach_floor4_lower()) or
    (has("op_16gnomeforest") and reach_freezerator()) or
    ((has("op_17gnomeforest") or has("op_18gnomeforest")) and reach_floor5_lower()) or
    (has("op_19gnomeforest") and reach_war())
  )
end

function deep_dish_9_access()
  return(
    has("op_1deepdish9") or has("op_2deepdish9") or 
    ((has("op_3deepdish9") or has("op_4deepdish9")) and reach_floor1_upper()) or
    ((has("op_5deepdish9") or has("op_6deepdish9") or has("op_7deepdish9") or has("op_8deepdish9")) and reach_floor2()) or
    (has("op_9deepdish9") and reach_crust_cove()) or 
    (has("op_10deepdish9") and reach_gnome_forest()) or
    (has("op_11deepdish9") and reach_deep_dish_9()) or
    (has("op_12deepdish9") and reach_golf()) or
    ((has("op_13deepdish9") or has("op_14deepdish9") or has("op_15deepdish9")) and reach_floor4_lower()) or
    (has("op_16deepdish9") and reach_freezerator()) or
    ((has("op_17deepdish9") or has("op_18deepdish9")) and reach_floor5_lower()) or
    (has("op_19deepdish9") and reach_war())
  )
end

function golf_access()
  return(
    has("op_1golf") or has("op_2golf") or 
    ((has("op_3golf") or has("op_4golf")) and reach_floor1_upper()) or
    ((has("op_5golf") or has("op_6golf") or has("op_7golf") or has("op_8golf")) and reach_floor2()) or
    (has("op_9golf") and reach_crust_cove()) or 
    (has("op_10golf") and reach_gnome_forest()) or
    (has("op_11golf") and reach_deep_dish_9()) or
    (has("op_12golf") and reach_golf()) or
    ((has("op_13golf") or has("op_14golf") or has("op_15golf")) and reach_floor4_lower()) or
    (has("op_16golf") and reach_freezerator()) or
    ((has("op_17golf") or has("op_18golf")) and reach_floor5_lower()) or
    (has("op_19golf") and reach_war())
  )
end

function pig_city_access()
  return(
    has("op_1thepigcity") or has("op_2thepigcity") or 
    ((has("op_3thepigcity") or has("op_4thepigcity")) and reach_floor1_upper()) or
    ((has("op_5thepigcity") or has("op_6thepigcity") or has("op_7thepigcity") or has("op_8thepigcity")) and reach_floor2()) or
    (has("op_9thepigcity") and reach_crust_cove()) or 
    (has("op_10thepigcity") and reach_gnome_forest()) or
    (has("op_11thepigcity") and reach_deep_dish_9()) or
    (has("op_12thepigcity") and reach_golf()) or
    ((has("op_13thepigcity") or has("op_14thepigcity") or has("op_15thepigcity")) and reach_floor4_lower()) or
    (has("op_16thepigcity") and reach_freezerator()) or
    ((has("op_17thepigcity") or has("op_18thepigcity")) and reach_floor5_lower()) or
    (has("op_19thepigcity") and reach_war())
  )
end

function peppibot_factory_access()
  return(
    has("op_1peppibotfactory") or has("op_2peppibotfactory") or 
    ((has("op_3peppibotfactory") or has("op_4peppibotfactory")) and reach_floor1_upper()) or
    ((has("op_5peppibotfactory") or has("op_6peppibotfactory") or has("op_7peppibotfactory") or has("op_8peppibotfactory")) and reach_floor2()) or
    (has("op_9peppibotfactory") and reach_crust_cove()) or 
    (has("op_10peppibotfactory") and reach_gnome_forest()) or
    (has("op_11peppibotfactory") and reach_deep_dish_9()) or
    (has("op_12peppibotfactory") and reach_golf()) or
    ((has("op_13peppibotfactory") or has("op_14peppibotfactory") or has("op_15peppibotfactory")) and reach_floor4_lower()) or
    (has("op_16peppibotfactory") and reach_freezerator()) or
    ((has("op_17peppibotfactory") or has("op_18peppibotfactory")) and reach_floor5_lower()) or
    (has("op_19peppibotfactory") and reach_war())
  )
end

function oh_shit_access()
  return(
    has("op_1ohshit") or has("op_2ohshit") or 
    ((has("op_3ohshit") or has("op_4ohshit")) and reach_floor1_upper()) or
    ((has("op_5ohshit") or has("op_6ohshit") or has("op_7ohshit") or has("op_8ohshit")) and reach_floor2()) or
    (has("op_9ohshit") and reach_crust_cove()) or 
    (has("op_10ohshit") and reach_gnome_forest()) or
    (has("op_11ohshit") and reach_deep_dish_9()) or
    (has("op_12ohshit") and reach_golf()) or
    ((has("op_13ohshit") or has("op_14ohshit") or has("op_15ohshit")) and reach_floor4_lower()) or
    (has("op_16ohshit") and reach_freezerator()) or
    ((has("op_17ohshit") or has("op_18ohshit")) and reach_floor5_lower()) or
    (has("op_19ohshit") and reach_war())
  )
end

function freezerator_access()
  return(
    has("op_1rrfreezerator") or has("op_2rrfreezerator") or 
    ((has("op_3rrfreezerator") or has("op_4rrfreezerator")) and reach_floor1_upper()) or
    ((has("op_5rrfreezerator") or has("op_6rrfreezerator") or has("op_7rrfreezerator") or has("op_8rrfreezerator")) and reach_floor2()) or
    (has("op_9rrfreezerator") and reach_crust_cove()) or 
    (has("op_10rrfreezerator") and reach_gnome_forest()) or
    (has("op_11rrfreezerator") and reach_deep_dish_9()) or
    (has("op_12rrfreezerator") and reach_golf()) or
    ((has("op_13rrfreezerator") or has("op_14rrfreezerator") or has("op_15rrfreezerator")) and reach_floor4_lower()) or
    (has("op_16rrfreezerator") and reach_freezerator()) or
    ((has("op_17rrfreezerator") or has("op_18rrfreezerator")) and reach_floor5_lower()) or
    (has("op_19rrfreezerator") and reach_war())
  )
end

function pizzascare_access()
  return(
    has("op_1pizzascare") or has("op_2pizzascare") or 
    ((has("op_3pizzascare") or has("op_4pizzascare")) and reach_floor1_upper()) or
    ((has("op_5pizzascare") or has("op_6pizzascare") or has("op_7pizzascare") or has("op_8pizzascare")) and reach_floor2()) or
    (has("op_9pizzascare") and reach_crust_cove()) or 
    (has("op_10pizzascare") and reach_gnome_forest()) or
    (has("op_11pizzascare") and reach_deep_dish_9()) or
    (has("op_12pizzascare") and reach_golf()) or
    ((has("op_13pizzascare") or has("op_14pizzascare") or has("op_15pizzascare")) and reach_floor4_lower()) or
    (has("op_16pizzascare") and reach_freezerator()) or
    ((has("op_17pizzascare") or has("op_18pizzascare")) and reach_floor5_lower()) or
    (has("op_19pizzascare") and reach_war())
  )
end

function dont_make_sound_access()
  return(
    has("op_1dontmakeasound") or has("op_2dontmakeasound") or 
    ((has("op_3dontmakeasound") or has("op_4dontmakeasound")) and reach_floor1_upper()) or
    ((has("op_5dontmakeasound") or has("op_6dontmakeasound") or has("op_7dontmakeasound") or has("op_8dontmakeasound")) and reach_floor2()) or
    (has("op_9dontmakeasound") and reach_crust_cove()) or 
    (has("op_10dontmakeasound") and reach_gnome_forest()) or
    (has("op_11dontmakeasound") and reach_deep_dish_9()) or
    (has("op_12dontmakeasound") and reach_golf()) or
    ((has("op_13dontmakeasound") or has("op_14dontmakeasound") or has("op_15dontmakeasound")) and reach_floor4_lower()) or
    (has("op_16dontmakeasound") and reach_freezerator()) or
    ((has("op_17dontmakeasound") or has("op_18dontmakeasound")) and reach_floor5_lower()) or
    (has("op_19dontmakeasound") and reach_war())
  )
end

function war_access()
  return(
    has("op_1war") or has("op_2war") or 
    ((has("op_3war") or has("op_4war")) and reach_floor1_upper()) or
    ((has("op_5war") or has("op_6war") or has("op_7war") or has("op_8war")) and reach_floor2()) or
    (has("op_9war") and reach_crust_cove()) or 
    (has("op_10war") and reach_gnome_forest()) or
    (has("op_11war") and reach_deep_dish_9()) or
    (has("op_12war") and reach_golf()) or
    ((has("op_13war") or has("op_14war") or has("op_15war")) and reach_floor4_lower()) or
    (has("op_16war") and reach_freezerator()) or
    ((has("op_17war") or has("op_18war")) and reach_floor5_lower()) or
    (has("op_19war") and reach_war())
  )
end

function pepperman_access()
  return(
    (has("op_b1pepperman") and reach_pepperman()) or
    (has("op_b2pepperman") and reach_vigilante()) or
    (has("op_b3pepperman") and reach_noise()) or
    (has("op_b4pepperman") and reach_fake_pepp())
  )
end

function vigilante_access()
  return(
    (has("op_b1vigilante") and reach_pepperman()) or
    (has("op_b2vigilante") and reach_vigilante()) or
    (has("op_b3vigilante") and reach_noise()) or
    (has("op_b4vigilante") and reach_fake_pepp())
  )
end

function noise_access()
  return(
    (has("op_b1noise") and reach_pepperman()) or
    (has("op_b2noise") and reach_vigilante()) or
    (has("op_b3noise") and reach_noise()) or
    (has("op_b4noise") and reach_fake_pepp())
  )
end

function fake_pepp_access()
  return(
    (has("op_b1fakepepp") and reach_pepperman()) or
    (has("op_b2fakepepp") and reach_vigilante()) or
    (has("op_b3fakepepp") and reach_noise()) or
    (has("op_b4fakepepp") and reach_fake_pepp())
  )
end

function s_p_ranked(slot)
  level = Tracker:FindObjectForCode(slot).CurrentStage
  if level == 1 then
    return((john_gutter_pepp_com() or john_gutter_noise_com()) and lap2())
  elseif level == 2 then
    return((pizzascape_pepp_srank() or pizzascape_noise_com()) and lap2())
  elseif level == 3 then
    return((ancient_cheese_pepp_com() or ancient_cheese_noise_com()) and lap2())
  elseif level == 4 then
    return((bloodsauce_dungeon_pepp_srank() or (bloodsauce_dungeon_noise_pin() and has("sjump"))) and lap2())
  elseif level == 5 then
    return((oregano_desert_pepp_srank() or oregano_desert_noise_srank()) and lap2())
  elseif level == 6 then
    return((wasteyard_pepp_com() or wasteyard_noise_srank()) and lap2())
  elseif level == 7 then
    return((fun_farm_exp_pepp_srank() or fun_farm_noise_com()) and lap2())
  elseif level == 8 then
    return((fastfood_saloon_pepp_srank() or fastfood_saloon_noise_com()) and lap2())
  elseif level == 9 then
    return((crust_cove_exp_pepp_s3() or (crust_cove_norm_noise_com() and has("taunt")) or (crust_cove_exp_noise_com() and has("taunt")) and lap2()))
  elseif level == 10 and has("op_diff_exp") then
    return(gnome_forest_pepp_com() or gnome_forest_noise_com())
  elseif level == 10 and has("op_diff_norm") then
    return((gnome_forest_pepp_com() or gnome_forest_noise_com()) and lap2())
  elseif level == 11 then
    return((deep_dish_9_pepp_com() or deep_dish_9_norm_noise_com() or deep_dish_9_exp_noise_com()) and lap2())
  elseif level == 12 then
    return((golf_norm_pepp_com() or golf_exp_pepp_com() or golf_norm_noise_com() or golf_exp_noise_com()) and lap2())
  elseif level == 13 then
    return((pig_city_pepp_srank() or pig_city_norm_noise_srank() or pig_city_exp_noise_com()) and lap2())
  elseif level == 14 then
    return((peppibot_factory_norm_pepp_com() or peppibot_factory_norm_noise_com()) and lap2())
  elseif level == 15 then
    return((oh_shit_pepp_com() or oh_shit_norm_noise_com() or oh_shit_exp_noise_com()) and lap2())
  elseif level == 16 and has("op_diff_exp") then
    return(freezerator_exp_pepp_com() or freezerator_noise_srank())
  elseif level == 16 and has("op_diff_norm") then
    return((freezerator_norm_pepp_com() or freezerator_noise_srank()) and lap2())
  elseif level == 17 then
    return((pizzascare_exp_pep_com() or pizzascare_norm_noise_com()) and lap2())
  elseif level == 18 then
    return((dont_make_sound_norm_pepp_com() or (dont_make_sound_exp_pepp_com() and has("bodyslam")) or dont_make_sound_norm_noise_com() or dont_make_sound_exp_noise_srank()) and has("taunt") and lap2())
  elseif level == 19 then
    return(((war_pepp_com() and has("op_diff_norm")) or war_exp_pepp_com() or (war_norm_noise_com() and has("op_diff_norm")) or war_exp_noise_ct1()) and lap2())
  else
    return false
  end
end

function pumpkin_munckin()
  return(
    (john_gutter_access() and (john_gutter_pepp_pum() or john_gutter_noise_pum())) and 
    (pizzascape_access() and (pizzascape_pepp_s3() or (knight() and climb()) or pizzascape_noise_pum())) and 
    (ancient_cheese_access() and (ancient_cheese_pepp_com() or ancient_cheese_noise_pin())) and
    (bloodsauce_dungeon_access() and (pepp_slam() or bloodsauce_dungeon_noise_pin() or bounce())) and 
    (oregano_desert_access() and (oregano_desert_pepp_com() or (oregano_desert_noise_mus() and fire()))) and 
    (wasteyard_access() and (wasteyard_pepp_com() or (has("op_pepp") and has("op_diff_exp") and ghost() and upper()) or wasteyard_noise_pin())) and 
    (fun_farm_access() and (fun_farm_pepp_com() or (fun_farm_noise_s1() and mort()))) and 
    (fastfood_saloon_access() and (fastfood_saloon_pepp_com() or fastfood_saloon_noise_com())) and 
    (crust_cove_access() and ((climb() and slam() and sjump() and barr()) or crust_cove_noise_pum())) and 
    (gnome_forest_access() and (gnome_forest_pepp_pin() or gnome_forest_noise_che())) and 
    (deep_dish_9_access() and (deep_dish_9_pepp_pin() or deep_dish_9_norm_noise_com() or (deep_dish_9_exp_noise_tom() or has("op_diff_exp")))) and 
    (golf_access() and (golf_norm_pepp_com() or has("op_diff_exp") or golf_norm_noise_com())) and 
    (pig_city_access() and (pig_city_pepp_com() or pig_city_norm_noise_com() or pig_city_exp_noise_tom())) and 
    (peppibot_factory_access() and (peppibot_factory_norm_pepp_sau() or peppibot_factory_exp_pepp_pum() or peppibot_factory_exp_noise_pin())) and 
    (oh_shit_access() and (oh_shit_pepp_com() or oh_shit_norm_noise_com() or oh_shit_exp_noise_com())) and 
    (freezerator_access() and (freezerator_norm_pepp_com() or freezerator_exp_pepp_com() or has("op_noise"))) and 
    (pizzascare_access() and (pizzascare_pepp_pum() or has("op_diff_exp") or has("op_noise"))) and 
    (dont_make_sound_access() and (dont_make_sound_exp_pepp_che() or dont_make_sound_norm_noise_sau() or (dont_make_sound_noise_che() and has("op_diff_exp")))) and 
    (war_access() and (war_norm_pepp_sau() or (war_exp_pepp_com() and has("op_diff_exp")) or (war_noise_che() and has("op_diff_norm")) or war_exp_noise_sau())) and 
    (reach_pizzaface() and ((has("op_pepp") and has("grab")) or (has("op_noise") and has("bomb"))) and (crumbling_tower_exp_pepp_pum() or crumbling_tower_exp_noise_pum())) and
    (reach_tt() and (tricky_treat_pepp_pum5() or tricky_treat_exp_noise_pum5()))
  )
end