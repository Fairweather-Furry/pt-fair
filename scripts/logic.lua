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

function tutorial_com()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and has("sjump") and("grab")) or 
    (has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("wclimb") and("grab")) or
    (has("op_noise") and has("op_diff_exp") and ((has("sjump") and has("slam")) or (has("sjump") and has("nado")) or (has("sjump") and has("wbounce")) or (has("crush")))) or
    (has("op_noise") and has("op_diff_norm") and ((has("sjump") and has("slam")) or (has("sjump") and has("nado")) or (has("crush"))))
  )
end

function tutorial_com20()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and has("sjump") and("grab")) or 
    (has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("wclimb") and("grab")) or
    (has("op_noise") and has("op_diff_exp") and ((has("sjump") and has("slam")) or (has("sjump") and has("nado")) or (has("sjump") and has("wbounce")) or (has("crush")))) or
    (has("op_noise") and has("op_diff_norm") and ((has("sjump") and has("slam")) or (has("sjump") and has("nado")) or (has("crush"))))
  )
end

function tutorial_mus()
  return(
    (has("op_pepp") and has("bodyslam"))
  )
end

function tutorial_che()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("slam") and (has("sjump") or has("wclimb"))) or 
    (has("op_pepp") and has("op_diff_norm") and has("slam") and has("wclimb"))
  )
end

function tutorial_tom()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("slam") and (has("sjump") or has("wclimb"))) or 
    (has("op_pepp") and has("op_diff_norm") and has("slam") and has("wclimb"))
  )
end

function tutorial_sau()
  return (
    (has("op_pepp") and has("op_diff_exp") and has("slam") and has("sjump")) or 
    (has("op_pepp") and has("op_diff_norm") and has("slam") and has("wclimb"))
  )
end

function tutorial_pin()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and has("sjump") and("grab")) or 
    (has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("wclimb") and("grab"))
  )
end

function john_gutter_com()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb"))) or
    (has("op_pepp") and has("op_diff_norm") and has("sjump")) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce"))) or
    (has("op_noise") and has("op_diff_norm") and has("sjump")) or
  )
end

function john_gutter_mus()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb") or has("ucut") or has("grab") or has("bodyslam"))) or
    (has("op_pepp") and has("op_diff_norm") and (has("sjump") or has("wclimb") or has("ucut"))) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce") or has("grab") or has("bodyslam"))) or
    (has("op_noise") and has("op_diff_norm") and (has("sjump") or has("wbounce") or has("crush") or has("ucut"))) or
  )
end

function john_gutter_che()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb") or has("ucut") or has("grab"))) or
    (has("op_pepp") and has("op_diff_norm") and (has("sjump") or has("wclimb") or has("ucut"))) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce") or has("grab") or has("bodyslam"))) or
    (has("op_noise") and has("op_diff_norm") and (has("sjump") or has("wbounce") or has("crush") or has("ucut"))) or
  )
end

function john_gutter_tom()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb") or has("ucut") or has("grab"))) or
    (has("op_pepp") and has("op_diff_norm") and (has("sjump") or has("wclimb") or has("ucut"))) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce") or has("grab") or has("bodyslam"))) or
    (has("op_noise") and has("op_diff_norm") and (has("sjump") or has("wbounce") or has("crush") or has("ucut"))) or
  )
end

function john_gutter_sau()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb"))) or
    (has("op_pepp") and has("op_diff_norm") and has("sjump")) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce"))) or
    (has("op_noise") and has("op_diff_norm") and has("sjump")) or
  )
end

function john_gutter_pin()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb"))) or
    (has("op_pepp") and has("op_diff_norm") and has("sjump")) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce"))) or
    (has("op_noise") and has("op_diff_norm") and has("sjump")) or
  )
end

function john_gutter_s1()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb") or has("ucut") or has("grab") or has("bodyslam"))) or
    (has("op_pepp") and has("op_diff_norm") and (has("sjump") or has("wclimb") or has("ucut"))) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce") or has("grab") or has("bodyslam"))) or
    (has("op_noise") and has("op_diff_norm") and (has("sjump") or has("wbounce") or has("crush") or has("ucut"))) or
  )
end

function john_gutter_s2()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb"))) or
    (has("op_pepp") and has("op_diff_norm") and has("sjump") and has("bodyslam")) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce"))) or
    (has("op_noise") and has("op_diff_norm") and has("sjump") and (has("bodyslam") or has("crush") or has("nado"))) or
  )
end

function john_gutter_s3()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb"))) or
    (has("op_pepp") and has("op_diff_norm") and has("sjump")) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce"))) or
    (has("op_noise") and has("op_diff_norm") and has("sjump")) or
  )
end

function john_gutter_tre()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb"))) or
    (has("op_pepp") and has("op_diff_norm") and has("sjump")) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce"))) or
    (has("op_noise") and has("op_diff_norm") and has("sjump")) or
  )
end

function john_gutter_ct1()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb"))) or
    (has("op_pepp") and has("op_diff_norm") and has("sjump")) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce"))) or
    (has("op_noise") and has("op_diff_norm") and has("sjump")) or
  )
end

function john_gutter_ct2()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb"))) or
    (has("op_pepp") and has("op_diff_norm") and has("sjump")) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce"))) or
    (has("op_noise") and has("op_diff_norm") and has("sjump")) or
  )
end

function john_gutter_ct3()
  return(
    (has("op_pepp") and has("op_diff_exp") and (has("sjump") or has("wclimb"))) or
    (has("op_pepp") and has("op_diff_norm") and has("sjump") and has("mach4")) or
    (has("op_noise") and has("op_diff_exp") and (has("sjump") or has("ucut") or has("crush") or has("wbounce"))) or
    (has("op_noise") and has("op_diff_norm") and has("sjump")) or
  )
end