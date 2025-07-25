ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/start_move_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/ap_slot.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}

function onClear(slot_data)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
    end
    SLOT_DATA = slot_data
    CUR_INDEX = -1
    -- reset locations
    for _, v in pairs(LOCATION_MAPPING) do
        if v[1] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing location %s", v[1]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[1]:sub(1, 1) == "@" then
                    obj.AvailableChestCount = obj.ChestCount
                else
                    obj.Active = false
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end
    -- reset items
    for _, v in pairs(ITEM_MAPPING) do
        if v[1] and v[2] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing item %s of type %s", v[1], v[2]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[2] == "toggle" then
                    obj.Active = false
                elseif v[2] == "progressive" then
                    obj.CurrentStage = 0
                    obj.Active = false
                elseif v[2] == "consumable" then
                    obj.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: unknown item type %s for code %s", v[2], v[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end
    
    LOCAL_ITEMS = {}
    GLOBAL_ITEMS = {}

    if SLOT_DATA == nil then
        return
    end
    PLAYER_ID = Archipelago.PlayerNumber or -1
	TEAM_NUMBER = Archipelago.TeamNumber or 0
	
--	print(dump_table(slot_data))

	for k,v in pairs(slot_data) do
		if SLOT_CODES[k] then
			Tracker:FindObjectForCode(SLOT_CODES[k].code).CurrentStage = SLOT_CODES[k].mapping[v]
		end
	end

--	print(dump_table(slot_data["rando_levels"]))

    for slt,lvl in pairs(slot_data["rando_levels"]) do
        if has("op_entrandman") then
            Tracker:FindObjectForCode(ENTRY_MAPPING[slt][1]).CurrentStage = 0
        else
            Tracker:FindObjectForCode(ENTRY_MAPPING[slt][1]).CurrentStage = ENTRY_MAPPING[lvl][2]
        end
    end
    for slt,lvl in pairs(slot_data["rando_bosses"]) do
        if has("op_entrandman") then
            Tracker:FindObjectForCode(ENTRY_MAPPING[slt][1]).CurrentStage = 0
        else
            Tracker:FindObjectForCode(ENTRY_MAPPING[slt][1]).CurrentStage = ENTRY_MAPPING[lvl][2]
        end
    end

    if slot_data["floor_1_toppins"] then
        Tracker:FindObjectForCode("op_f1_cost").AcquiredCount = tonumber(slot_data["floor_1_toppins"])
    end
    if slot_data["floor_2_toppins"] then
        Tracker:FindObjectForCode("op_f2_cost").AcquiredCount = tonumber(slot_data["floor_2_toppins"])
    end
    if slot_data["floor_3_toppins"] then
        Tracker:FindObjectForCode("op_f3_cost").AcquiredCount = tonumber(slot_data["floor_3_toppins"])
    end
    if slot_data["floor_4_toppins"] then
        Tracker:FindObjectForCode("op_f4_cost").AcquiredCount = tonumber(slot_data["floor_4_toppins"])
    end
    if slot_data["floor_5_toppins"] then
        Tracker:FindObjectForCode("op_f5_cost").AcquiredCount = tonumber(slot_data["floor_5_toppins"])
    end
    
    Tracker:FindObjectForCode("op_tt_cost").AcquiredCount = tonumber(slot_data["pumpkin_count"])
    Tracker:FindObjectForCode("op_oworld").Active = slot_data["open_world"]
    Tracker:FindObjectForCode("op_diff").Active = slot_data["difficulty"]
    Tracker:FindObjectForCode("op_treasure").Active = slot_data["treasure_checks"]
    Tracker:FindObjectForCode("op_srank").Active = slot_data["srank_checks"]
    Tracker:FindObjectForCode("op_prank").Active = slot_data["prank_checks"]
    Tracker:FindObjectForCode("op_task").Active = slot_data["cheftask_checks"]
    Tracker:FindObjectForCode("op_secret").Active = slot_data["secret_checks"]
    Tracker:FindObjectForCode("op_portal").Active = slot_data["shuffle_lap2"]
    Tracker:FindObjectForCode("op_pumpkin").Active = slot_data["pumpkin_checks"]

    -- Starting Moves
    for i, val in pairs(MOVE_MAPPING) do
        Tracker:FindObjectForCode(val).Active = (slot_data["starting_moves"] >> i) % 2 == 1
    end
end

-- called when an item gets collected
function onItem(index, item_id, item_name, player_number)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onItem: %s, %s, %s, %s, %s", index, item_id, item_name, player_number, CUR_INDEX))
    end
    if index <= CUR_INDEX then
        return
    end
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;
    local v = ITEM_MAPPING[item_id]
    if not v then
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: could not find item mapping for id %s", item_id))
        end
        return
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: code: %s, type %s", v[1], v[2]))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[2] == "toggle" then
            obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif v[2] == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: could not find object for code %s", v[1]))
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("local items: %s", dump_table(LOCAL_ITEMS)))
        print(string.format("global items: %s", dump_table(GLOBAL_ITEMS)))
    end
end

--called when a location gets cleared
function onLocation(location_id, location_name)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onLocation: %s, %s", location_id, location_name))
    end
    local v = LOCATION_MAPPING[location_id]
    if not v and AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[1]:sub(1, 1) == "@" then
            obj.AvailableChestCount = obj.AvailableChestCount - 1
        else
            obj.Active = true
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find object for code %s", v[1]))
    end
end

Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)