function has(item, amount)
  local count = Tracker:ProviderCountForCode(item)
  amount = tonumber(amount)
  if not amount then
    return count > 0
  else
    return count >= amount
  end
end

function tutorial_com()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and has("sjump") and("grab")) or 
    (has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("climb") and("grab")) or
    (has("op_noise") and has("op_diff_exp") and ((has("sjump") and has("slam")) or (has("sjump") and has("nado")) or (has("sjump") and has("wbounce")) or (has("crush")))) or
    (has("op_noise") and has("op_diff_norm") and ((has("sjump") and has("slam")) or (has("sjump") and has("nado")) or (has("crush"))))
  )
end

function tutorial_com20()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and has("sjump") and("grab")) or 
    (has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("climb") and("grab")) or
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
    (has("op_pepp") and has("op_diff_exp") and has("slam") and (has("sjump") or has("climb"))) or 
    (has("op_pepp") and has("op_diff_norm") and has("slam") and has("climb"))
  )
end

function tutorial_tom()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("slam") and (has("sjump") or has("climb"))) or 
    (has("op_pepp") and has("op_diff_norm") and has("slam") and has("climb"))
  )
end

function tutorial_sau()
  return (
    (has("op_pepp") and has("op_diff_exp") and has("slam") and has("sjump")) or 
    (has("op_pepp") and has("op_diff_norm") and has("slam") and has("climb"))
  )
end

function tutorial_pin()
  return(
    (has("op_pepp") and has("op_diff_exp") and has("bodyslam") and has("sjump") and("grab")) or 
    (has("op_pepp") and has("op_diff_norm") and has("bodyslam") and has("climb") and("grab"))
  )
end