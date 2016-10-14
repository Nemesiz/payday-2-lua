core:module("SlotManager")
core:import("CoreSlotManager")
core:import("CoreClass")
SlotManager = SlotManager or class(CoreSlotManager.SlotManager)
function SlotManager:init()
	SlotManager.super.init(self)
	local C_UnitManager = World:unit_manager()
	C_UnitManager:set_slot_infinite(2)
	C_UnitManager:set_slot_infinite(3)
	C_UnitManager:set_slot_infinite(4)
	C_UnitManager:set_slot_infinite(5)
	C_UnitManager:set_slot_infinite(7)
	C_UnitManager:set_slot_infinite(8)
	C_UnitManager:set_slot_infinite(9)
	C_UnitManager:set_slot_infinite(12)
	C_UnitManager:set_slot_infinite(13)
	C_UnitManager:set_slot_infinite(14)
	C_UnitManager:set_slot_infinite(16)
	C_UnitManager:set_slot_infinite(17)
	C_UnitManager:set_slot_limited(18, 10)
	C_UnitManager:set_slot_infinite(20)
	C_UnitManager:set_slot_infinite(21)
	C_UnitManager:set_slot_infinite(22)
	C_UnitManager:set_slot_limited(23, 20)
	C_UnitManager:set_slot_infinite(24)
	C_UnitManager:set_slot_infinite(25)
	C_UnitManager:set_slot_infinite(26)
	C_UnitManager:set_slot_infinite(30)
	C_UnitManager:set_slot_infinite(33)
	C_UnitManager:set_slot_infinite(34)
	C_UnitManager:set_slot_infinite(36)
	C_UnitManager:set_slot_infinite(37)
	C_UnitManager:set_slot_infinite(38)
	C_UnitManager:set_slot_infinite(39)
	self._masks.all = World:make_slot_mask(1, 2, 3, 10, 11, 12, 19, 29, 33, 34, 35, 36, 37, 38, 39)
	self._masks.players = World:make_slot_mask(2, 3, 4, 5)
	self._masks.criminals = World:make_slot_mask(2, 3, 16, 25)
	self._masks.civilians = World:make_slot_mask(21)
	self._masks.criminals_no_deployables = World:make_slot_mask(2, 3, 16)
	self._masks.all_criminals = World:make_slot_mask(2, 3, 4, 5, 16, 24, 25)
	self._masks.raycastable_characters = World:make_slot_mask(3, 12, 16, 17, 25)
	self._masks.harmless_criminals = World:make_slot_mask(4, 5, 24)
	self._masks.harmless_player_criminals = World:make_slot_mask(4, 5)
	self._masks.long_distance_interaction = World:make_slot_mask(3, 12, 16, 21)
	self._masks.trip_mine_targets = World:make_slot_mask(12, 21, 22, 33)
	self._masks.cameras = World:make_slot_mask(7)
	self._masks.enemies = World:make_slot_mask(12, 33)
	self._masks.persons = World:make_slot_mask(2, 3, 4, 5, 12, 16, 21, 22, 24, 33)
	self._masks.crowd = World:make_slot_mask(33, 34)
	self._masks.melee_equipment = World:make_slot_mask(8, 9)
	self._masks.body_area_damage = World:make_slot_mask(1, 11)
	self._masks.unit_area_damage = self._masks.players + self._masks.enemies
	self._masks.area_damage_blocker = World:make_slot_mask(1, 3, 8, 11)
	self._masks.bullet_impact_targets = World:make_slot_mask(1, 2, 8, 11, 12, 14, 16, 17, 18, 21, 22, 25, 26, 33, 34, 35, 39)
	self._masks.explosion_targets = self._masks.bullet_impact_targets - 2
	self._masks.bullet_impact_targets_no_police = World:make_slot_mask(1, 2, 8, 11, 14, 16, 17, 25, 33, 34, 35, 39)
	self._masks.bullet_impact_targets_no_criminals = World:make_slot_mask(1, 8, 11, 12, 14, 17, 33, 34, 35, 39)
	self._masks.bullet_impact_targets_sentry_gun = World:make_slot_mask(1, 8, 11, 12, 14, 17, 22, 33, 34, 35, 39)
	self._masks.bullet_impact_targets_no_AI = World:make_slot_mask(1, 2, 8, 11, 14, 17, 33, 34, 35, 39)
	self._masks.bullet_impact_targets_shooting_death = World:make_slot_mask(1, 8, 11, 12, 14, 17, 21, 22, 33, 34, 35)
	self._masks.bullet_blank_impact_targets = World:make_slot_mask(1, 8, 11, 35, 39)
	self._masks.bullet_physics_push = World:make_slot_mask(11, 17, 18, 39)
	self._masks.AI_visibility = World:make_slot_mask(1, 11, 38, 39)
	self._masks.AI_visibility_sentry_gun = World:make_slot_mask(1, 11, 17, 38, 39)
	self._masks.AI_graph_obstacle_check = World:make_slot_mask(1, 11, 15)
	self._masks.player_autoaim = World:make_slot_mask(12)
	self._masks.cover = World:make_slot_mask(36)
	self._masks.env_effect = World:make_slot_mask(1)
	self._masks.world_geometry = World:make_slot_mask(1, 11)
	self._masks.trip_mine_placeables = World:make_slot_mask(1)
	self._masks.pickups = World:make_slot_mask(20, 23)
	self._masks.flesh = World:make_slot_mask(12, 16, 17, 21, 22, 24, 33)
	self._masks.footstep = World:make_slot_mask(1, 8, 11)
	self._masks.fire_damage = World:make_slot_mask(1, 2, 11)
	self._masks.vehicles = World:make_slot_mask(39)
	self._masks.molotov_raycasts = World:make_slot_mask(1, 11, 39)
	self._masks.player_ground_check = World:make_slot_mask(1, 11, 15, 39)
	self._masks.enemy_shield_check = World:make_slot_mask(8)
	self._masks.interaction_obstruction = self._masks.world_geometry + self._masks.vehicles
	self._masks.editor_all = self._masks.editor_all + 36 + 38 + 39
	self._masks.statics_layer = self._masks.statics_layer + 36 + 38 + 39
	self._masks.arrow_impact_targets = World:make_slot_mask(1, 2, 8, 11, 12, 16, 17, 18, 21, 22, 25, 26, 33, 34, 35, 39)
	self._masks.bullet_impact_targets_ff = World:make_slot_mask(1, 2, 3, 8, 11, 12, 14, 16, 17, 18, 21, 22, 25, 26, 33, 34, 35, 39)
end
CoreClass.override_class(CoreSlotManager.SlotManager, SlotManager)
