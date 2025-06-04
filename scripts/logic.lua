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

function tutorial_mus()
  return(
    (has("op_pepp") and has("bodyslam"))
  )
end

function tutorial_che_tom()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and (has("sjump") or has("wclimb"))) or 
    (has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("wclimb"))
  )
end


function tutorial_sau()
  return (
    (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and has("sjump")) or 
    (has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("wclimb"))
  )
end

function tutorial_pin()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and has("sjump") and has("grab")) or 
    (has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("wclimb") and has("grab"))
  )
end

function tutorial_com()
  return(
    tutorial_pin() or
    (has("op_noise") and has("op_diff_exp") and ((has("sjump") and has("bodyslam")) or (has("sjump") and has("nado")) or (has("sjump") and has("wbounce")) or (has("crush")))) or
    (has("op_noise") and has("op_diff_norm") and ((has("sjump") and has("bodyslam")) or (has("sjump") and has("nado")) or (has("crush"))))
  )
end

function john_gutter_com_sau_pin_s3_tre_ct1_ct2()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb"))) or
    (has("op_pepp") and has("op_diff_norm") and has("sjump")) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce"))) or
    (has("op_noise") and has("op_diff_norm") and has("sjump"))
  )
end

function john_gutter_mus_s1()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb") or has("ucut") or has("grab") or has("bodyslam"))) or
    (has("op_pepp") and has("op_diff_norm") and (has("sjump") or has("wclimb") or has("ucut"))) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce") or has("grab") or has("bodyslam"))) or
    (has("op_noise") and has("op_diff_norm") and (has("sjump") or has("wbounce") or has("crush") or has("ucut")))
  )
end

function john_gutter_che_tom()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb") or has("ucut") or has("grab"))) or
    (has("op_pepp") and has("op_diff_norm") and (has("sjump") or has("wclimb") or has("ucut"))) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce") or has("grab") or has("bodyslam"))) or
    (has("op_noise") and has("op_diff_norm") and (has("sjump") or has("wbounce") or has("crush") or has("ucut")))
  )
end

function john_gutter_s2()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb"))) or
    (has("op_pepp") and has("op_diff_norm") and has("sjump") and has("bodyslam")) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce"))) or
    (has("op_noise") and has("op_diff_norm") and has("sjump") and (has("bodyslam") or has("crush") or has("nado")))
  )
end

function john_gutter_ct3()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb"))) or
    (has("op_pepp") and has("op_diff_norm") and has("sjump") and has("mach4")) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce"))) or
    (has("op_noise") and has("op_diff_norm") and has("sjump"))
  )
end

function pizzascape_com()
  return(
    (has("op_pepp") and has("op_diff_exp") and ((has("sjump") and has("grab")) or has("ucut") or (has("grab") and has("wclimb")))) or
    (has("op_pepp") and has("op_diff_norm") and has("grab") and has("wclimb")) or
    (has("op_noise") and has("op_diff_exp") and ((has("sjump") and has("grab")) or has("ucut") or (has("grab") and has("wbounce")) or (has("grab") and has("crush")))) or
    (has("op_noise") and has("op_diff_norm") and has("grab") and (has("sjump") or has("ucut") or has("wbounce") or has("crush"))) 
  )
end

function pizzascape_tom_sau_pin_s1_s2_ct3()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("ucut") or has("grab"))) or
    (has("op_pepp") and has("op_diff_norm") and has("grab")) or
    (has("op_noise") and has("op_diff_exp") and (has("ucut") or has("grab"))) or
    (has("op_noise") and has("op_diff_norm") and has("grab"))
  )
end

function pizzascape_s3()
  return(
    (has("op_pepp") and has("op_diff_exp") and ((has("ucut") and has("sjump")) or (has("ucut") and has("wclimb")) or (has("grab") and has("sjump")) or (has("grab") and has("wclimb")))) or
    (has("op_pepp") and has("op_diff_norm") and has("grab") and has("sjump")) or
    (has("op_noise") and has("op_diff_exp") and ((has("grab") and has("sjump")) or has("ucut") or (has("grab") and has("wbounce")) or (has("grab") and has("crush")))) or
    (has("op_noise") and has("op_diff_norm") ((has("grab") and has("sjump")) or (has("grab") and has("crush"))))
  )
end

function pizzascape_tre()
  return(
    (has("op_pepp") and has("op_diff_exp") and ((has("ucut") and has("sjump")) or (has("ucut") and has("wclimb")) or (has("grab") and has("sjump")) or (has("grab") and has("wclimb")))) or
    (has("op_pepp") and has("op_diff_norm") and has("grab") and (has("sjump") or has("wclimb"))) or
    (has("op_noise") and has("op_diff_exp") and ((has("grab") and has("sjump")) or has("ucut") or (has("grab") and has("wbounce")) or (has("grab") and has("crush")))) or
    (has("op_noise") and has("op_diff_norm") ((has("grab") and has("sjump")) or (has("grab") and has("crush"))))
  )
end

function pizzascape_ct1()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("ucut") or has("grab"))) or
    (has("op_pepp") and has("op_diff_norm") and has("wclimb") and has("grab")) or
    (has("op_noise") and has("op_diff_exp") and (has("ucut") or has("grab"))) or
    (has("op_noise") and has("op_diff_norm") and has("grab") and (has("ucut") or has("sjump") or has("wbounce") or has("crush")))
  )
end

function ancient_cheese_com_ct1()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and ((has("ucut") or has("grab")) and (has("wclimb") or has("sjump")))) or
    (has("op_pepp") and has("op_diff_norm") and has("grab") and has("bodyslam") and (has("sjump") or has("wclimb"))) or
    (has("op_noise") and has("op_diff_exp") and has("sjump") and ((has("grab") or has("ucut")) and (has("bodyslam") or has("nado")))) or 
    (has("op_noise") and has("op_diff_norm") and has("grab") and ((has("sjump") or has("ucut") or has("wbounce")) and (has("bodyslam") or has("nado") or has("crush"))))
  )
end

function ancient_cheese_che()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("ucut") or has("grab"))) or
    (has("op_pepp") and has("op_diff_norm") and has("grab")) or
    (has("op_noise") and has("op_diff_exp") and (has("ucut") or has("grab"))) or 
    (has("op_noise") and has("op_diff_norm") and has("grab") and (has("sjump") or has("ucut") or has("wbounce") or has("crush")))
  )
end

function ancient_cheese_tom()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("ucut") or (has("grab") and (has("wclimb") or has("sjump"))))) or
    (has("op_pepp") and has("op_diff_norm") and has("grab") and has("bodyslam") and (has("wclimb") or has("sjump"))) or
    (has("op_noise") and has("op_diff_exp") and has("sjump") and ((has("grab") or has("ucut")) and (has("bodyslam") or has("nado")))) or
    (has("op_noise") and has("op_diff_norm") and has("grab") and ((has("sjump") or has("ucut") or has("wbounce")) and (has("bodyslam") or has("nado") or has("crush")))) 
  )
end

function ancient_cheese_sau_pin()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and ((has("ucut")) or (has("grab") and (has("wclimb") or has("sjump"))))) or
    (has("op_pepp") and has("op_diff_norm") and has("grab") and has("bodyslam") and (has("wclimb") or has("sjump"))) or
    (has("op_noise") and has("op_diff_exp") and has("sjump") and ((has("grab") or has("ucut")) and (has("bodyslam") or has("nado")))) or
    (has("op_noise") and has("op_diff_norm") and has("grab") and ((has("sjump") or has("ucut") or has("wbounce")) and (has("bodyslam") or has("nado") or has("crush")))) 
  )
end

function ancient_cheese_s2_tre_ct2()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("ucut") or (has("grab") and (has("wclimb") or has("sjump"))))) or
    (has("op_pepp") and has("op_diff_norm") and has("grab") and has("bodyslam") and (has("wclimb") or has("sjump"))) or
    (has("op_noise") and has("op_diff_exp") and (has("ucut") or (has("grab") and (has("sjump") or has("wbounce") or has("crush"))))) or
    (has("op_noise") and has("op_diff_norm") and has("grab") and ((has("sjump") or has("ucut") or has("wbounce")) and (has("bodyslam") or has("nado") or has("crush")))) 
  )
end

function ancient_cheese_s3()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and (has("ucut") or (has("grab") and (has("wclimb") or has("sjump"))))) or
    (has("op_pepp") and has("op_diff_norm") and has("grab") and has("bodyslam") and (has("wclimb") or has("sjump"))) or
    (has("op_noise") and has("op_diff_exp") and has("sjump") and ((has("grab") or has("ucut")) and (has("bodyslam") or has("nado")))) or
    (has("op_noise") and has("op_diff_norm") and has("grab") and ((has("sjump") or has("ucut") or has("wbounce")) and (has("bodyslam") or has("nado") or has("crush")))) 
  )
end