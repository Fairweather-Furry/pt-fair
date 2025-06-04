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

function tutorial_com()
  return(
    tutorial_pin() or
    (has("op_noise") and has("op_diff_exp") and ((has("sjump") and has("bodyslam")) or (has("sjump") and has("nado")) or (has("sjump") and has("wbounce")) or (has("crush")))) or
    (has("op_noise") and has("op_diff_norm") and ((has("sjump") and has("bodyslam")) or (has("sjump") and has("nado")) or (has("crush"))))
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
    john_gutter_noise_com() or (has("op_noise") and has("op_diff_exp") and (has("ucut") or has("crush") or has("bounce")))
  )
end

function john_gutter_exp_noise_tom()
  return(
    john_gutter_noise_tom() or (has("op_noise") and has("op_diff_exp") and (has("grab") or has("bodyslam")))
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