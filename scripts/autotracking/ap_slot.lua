function resetItems() 
	for _, v in pairs(ITEM_MAPPING) do
		if v[1] then
			local obj = Tracker:FindObjectForCode(v[1])
			if obj then
				obj.Active = false
			end
		end
	end
end

function resetLocations() 
	for _, v in pairs(LOCATION_MAPPING) do
		if v[1] then
			local obj = Tracker:FindObjectForCode(v[1])
			if obj then
				obj.AvailableChestCount = 1
			end
		end
	end
end

--toppinmap={[0]=0,[1]=1,[2]=2}
normalmap={[0]=0,[1]=1}
laddermap={[0]=0,[1]=1,[2]=2,[3]=3,[4]=4,[5]=5}
invertmap={[0]=1,[1]=0}

SLOT_CODES = {
--	difficulty={
--		code="op_diff",
--		mapping=normalmap
--	},
	bonus_ladders={
		code="op_ladder",
		mapping=laddermap
	},
	character={
		code="op_char",
		mapping=laddermap
--	},
--	treasure_checks={
--		code="op_treasure",
--		mapping=normalmap
--	},
--	secret_checks={
--		code="op_secret",
--		mapping=normalmap
--	},
--	srank_checks={
--		code="op_srank",
--		mapping=normalmap
--	},
--	prank_checks={
--		code="op_prank",
--		mapping=normalmap
--	},
--	cheftask_checks={
--		code="op_task",
--		mapping=normalmap
--	},
--	open_world={
--		code="op_oworld",
--		mapping=normalmap
	}
}