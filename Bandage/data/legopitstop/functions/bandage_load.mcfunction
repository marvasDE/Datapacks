# Runs when the server/world starts up.
#
# Called By: #minecraft:load
# Register Datapack
data modify storage legopitstop:registered_datapacks datapacks merge value {bandage:{namespace:"bandage",pack_version:"1.1.0",mc_version:"1.17",multiplayer_tested:"no",has_config:"no",pack:{update_url: "https://legopitstop.github.io/Update_Checker/update-checker.html?updateJSONURL=https%3A%2F%2Flegopitstop.github.io%2FDatapacks%2FBandage%2Fupdate.json&mcversion=1.17&modversion=1.1.0",title:"Bandage",description:"Bandages!",uuid:"2cb304ae-8023-4a92-8c3d-c62672f013f0"}}}

# mc version from DataVersion https://minecraft.fandom.com/wiki/Data_version#List_of_data_versions
scoreboard objectives add LPSDatapacks dummy
scoreboard players add DataVersion LPSDatapacks 0
execute store result score DataVersion LPSDatapacks run data get entity @r DataVersion
## Convert positive integer to client version
execute if score DataVersion LPSDatapacks matches 2825..2856 run data modify storage legopitstop:registered_datapacks mc_version set value "1.18"
execute if score DataVersion LPSDatapacks matches 2681..2730 run data modify storage legopitstop:registered_datapacks mc_version set value "1.17"
execute if score DataVersion LPSDatapacks matches 2504..2586 run data modify storage legopitstop:registered_datapacks mc_version set value "1.16"
execute if score DataVersion LPSDatapacks matches 2200..2230 run data modify storage legopitstop:registered_datapacks mc_version set value "1.15"
execute if score DataVersion LPSDatapacks matches 1901..1976 run data modify storage legopitstop:registered_datapacks mc_version set value "1.14"
execute if score DataVersion LPSDatapacks matches 1444..1631 run data modify storage legopitstop:registered_datapacks mc_version set value "1.13"
execute if score DataVersion LPSDatapacks matches 2857.. run data modify storage legopitstop:registered_datapacks mc_version set value "newer"
execute if score DataVersion LPSDatapacks matches ..1343 run data modify storage legopitstop:registered_datapacks mc_version set value "outdated"

# Reload Message
tellraw @a ["",{"storage":"legopitstop:registered_datapacks","nbt":"datapacks.bandage.pack.title","color":"yellow","hoverEvent":{"action":"show_text","contents":{"storage":"legopitstop:registered_datapacks","nbt":"datapacks.bandage.pack.description","color":"white"}}}," ",{"translate":"[%s]","color":"green","with":[{"storage":"legopitstop:registered_datapacks","nbt":"datapacks.bandage.pack_version"}],"hoverEvent": {"action":"show_text","contents":["",{"translate":"Pack Version: %s","color":"white","with":[{"storage":"legopitstop:registered_datapacks","nbt":"datapacks.bandage.pack_version","color":"gray"}]},"\n",{"translate":"MC Version: %s","color":"white","with":[{"storage":"legopitstop:registered_datapacks","nbt":"datapacks.bandage.mc_version","color":"gray"}]}]}}," ",{"text":"[Update Checker]","color":"green","clickEvent":{"action": "open_url", "value": "https://legopitstop.github.io/Update_Checker/update-checker.html?updateJSONURL=https%3A%2F%2Flegopitstop.github.io%2FDatapacks%2FBandage%2Fupdate.json&mcversion=1.17&modversion=1.1.0"}}," ",{"text":"ℹ","color":"blue","hoverEvent": {"action":"show_text","contents": ["",{"translate":"Namespace(s): %s","color":"white","with":[{"storage":"legopitstop:registered_datapacks","nbt":"datapacks.bandage.namespace","color":"gray"}]},"\n",{"translate":"Has Config: %s","color":"white","with":[{"storage":"legopitstop:registered_datapacks","nbt":"datapacks.bandage.has_config","color":"gray"}]},"\n",{"translate":"Multiplayer Tested: %s","color":"white","with":[{"storage":"legopitstop:registered_datapacks","nbt":"datapacks.bandage.multiplayer_tested","color":"gray"}]}]}}]

# unsupported version message
execute unless data storage legopitstop:registered_datapacks {mc_version:"1.17"} run tellraw @a ["",{"translate":"Unsupported version!","color":"dark_red"}," ",{"text":"Recommended version"}," ",{"storage":"legopitstop:registered_datapacks","nbt":"datapacks.bandage.mc_version"}]