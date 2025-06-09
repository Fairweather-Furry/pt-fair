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

normalmap={[0]=0,[1]=1}
laddermap={[0]=0,[1]=1,[2]=2,[3]=3,[4]=4,[5]=5}

SLOT_CODES = {
	bonus_ladders={
		code="op_ladder",
		mapping=laddermap
	},
	character={
		code="op_char",
		mapping=laddermap
	}
}