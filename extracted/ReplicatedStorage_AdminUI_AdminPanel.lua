-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserService_0 = game:GetService("UserService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Packages.Promise);
local v4 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v5 = require(l_ReplicatedStorage_0.FeaturePlaces);
local v6 = require(l_ReplicatedStorage_0.AdminUI.Theme);
local v7 = require(script.InlineUser);
local v8 = require(script.InlineTextBox);
local v9 = require(script.InlineButton);
local v10 = require(script.PlayerGridItem);
local function v13(v11) --[[ Line: 17 ]] --[[ Name: BanButton ]]
	local v12 = v4.State("None");
	return v9({
		Name = "BanButton", 
		GuiButtonState = v12, 
		Color = v4.Computed(function() --[[ Line: 22 ]]
			if v12:get() == "Pressing" then
				return v6.BanButtonPressing;
			elseif v12:get() == "Hovering" then
				return v6.BanButtonHovering;
			else
				return v6.BanButtonBackground;
			end;
		end), 
		Text = "Ban", 
		Visible = v11.Visible, 
		OnActivated = v11.OnActivated
	});
end;
local function v16(v14) --[[ Line: 37 ]] --[[ Name: UnbanButton ]]
	local v15 = v4.State("None");
	return v9({
		Name = "UnbanButton", 
		GuiButtonState = v15, 
		Color = v4.Computed(function() --[[ Line: 42 ]]
			if v15:get() == "Pressing" then
				return v6.UnbanButtonPressing;
			elseif v15:get() == "Hovering" then
				return v6.UnbanButtonHovering;
			else
				return v6.UnbanButtonBackground;
			end;
		end), 
		Text = "Unban", 
		Visible = v14.Visible, 
		OnActivated = v14.OnActivated
	});
end;
local function v20(v17) --[[ Line: 57 ]] --[[ Name: JoinServerButton ]]
	local v18 = v4.State("None");
	local v19 = "Join Server";
	if v17.placeId == v5.LegacyMapPlaceId then
		v19 = "Join Legacy Server";
	elseif v17.placeId == v5.VoiceChatOnlyPlaceId then
		v19 = "Join Voice Server";
	end;
	return v9({
		Name = "JoinServerButton", 
		GuiButtonState = v18, 
		Color = v4.Computed(function() --[[ Line: 68 ]]
			if v18:get() == "Pressing" then
				return v6.JoinServerButtonPressing;
			elseif v18:get() == "Hovering" then
				return v6.JoinServerButtonHovering;
			else
				return v6.JoinServerButtonBackground;
			end;
		end), 
		Text = v19, 
		Visible = v17.Visible, 
		OnActivated = v17.OnActivated
	});
end;
local function v200(v17) --[[ Line: 57 ]] --[[ Name: JoinServerButton ]]
	local v18 = v4.State("None");
	local v19 = "Summon to Reserved Server";
	if v17.placeId == v5.LegacyMapPlaceId then
		v19 = "Summon to Legacy Reserved Server";
	elseif v17.placeId == v5.VoiceChatOnlyPlaceId then
		v19 = "Summon to Voice Reserved Server";
	end;
	return v9({
		Name = "JoinServerButton", 
		GuiButtonState = v18, 
		Color = v4.Computed(function() --[[ Line: 68 ]]
			if v18:get() == "Pressing" then
				return v6.JoinServerButtonPressing;
			elseif v18:get() == "Hovering" then
				return v6.SummonToServerButtonHovering;
			else
				return v6.SummonToServerButtonBackground;
			end;
		end),
		Text = v19, 
		Visible = v17.Visible, 
		OnActivated = v17.OnActivated
	});
end;
local function v23(v21) --[[ Line: 83 ]] --[[ Name: KickButton ]]
	local v22 = v4.State("None");
	return v9({
		Name = "KickButton", 
		GuiButtonState = v22, 
		Color = v4.Computed(function() --[[ Line: 88 ]]
			if v22:get() == "Pressing" then
				return v6.KickButtonPressing;
			elseif v22:get() == "Hovering" then
				return v6.KickButtonHovering;
			else
				return v6.KickButtonBackground;
			end;
		end), 
		Text = "Kick From Server", 
		Visible = v21.Visible, 
		OnActivated = v21.OnActivated
	});
end;
local function v26(v24) --[[ Line: 103 ]] --[[ Name: ViewBoothButton ]]
	local v25 = v4.State("None");
	return v9({
		Name = "ViewBoothButton", 
		GuiButtonState = v25, 
		Color = v4.Computed(function() --[[ Line: 108 ]]
			if v25:get() == "Pressing" then
				return v6.ViewBoothButtonPressing;
			elseif v25:get() == "Hovering" then
				return v6.ViewBoothButtonHovering;
			else
				return v6.ViewBoothButtonBackground;
			end;
		end), 
		Text = "View Booth", 
		Visible = v24.Visible, 
		OnActivated = v24.OnActivated
	});
end;
local function _(v27) --[[ Line: 123 ]] --[[ Name: RefNew ]]
	return function(...) --[[ Line: 124 ]]
		local v28 = v4.New(...);
		v27:set(v28);
		return v28;
	end;
end;
return function(v30) --[[ Line: 135 ]]
	local v31 = v4.State(nil);
	local v32 = v4.State(nil);
	local v33 = v4.State({
		inGame = false
	});
	local v34 = v4.Computed(function() --[[ Line: 150 ]]
		return v32:get() ~= nil;
	end);
	local v35 = v4.Computed(function() --[[ Line: 153 ]]
		if v32:get() and v31:get() then
			return v31:get().InServer;
		else
			return false;
		end;
	end);
	local _ = v4.Computed(function() --[[ Line: 159 ]]
		if v32:get() and v31:get() then
			return not v31:get().InServer;
		else
			return false;
		end;
	end);
	local v37 = v4.Computed(function() --[[ Line: 165 ]]
		if v32:get() then
			return not v32:get().isBanned;
		else
			return false;
		end;
	end);
	local v38 = v4.Computed(function() --[[ Line: 171 ]]
		if v32:get() then
			return v32:get().isBanned;
		else
			return false;
		end;
	end);
	local v39 = v3.resolve();
	local function v46() --[[ Line: 178 ]] --[[ Name: requestBanStatus ]]
		v39:cancel();
		v32:set(nil);
		v33:set({
			inGame = false
		});
		if v31:get() then
			local v40 = v31:get();
			local v41 = v3.try(function() --[[ Line: 186 ]]
				if not v40.InServer then
					return {inGame = v30.CheckUserInGame(v40.Id);}
				else
					return {
						inGame = false
					};
				end;
			end);
			v39 = v3.delay(0):andThenCall(v30.LoadBanStatus, v40.Id):andThen(function(v42) --[[ Line: 194 ]]
				if v42.bannerId then
					local l_NameFromUserIdAsync_0 = game.Players:GetNameFromUserIdAsync(v42.bannerId);
					v42.newReason = ("%* - banned by %*"):format(v42.reason, l_NameFromUserIdAsync_0);
					return v42;
				else
					v42.newReason = v42.reason;
					return v42;
				end;
			end):andThen(function(v44) --[[ Line: 204 ]]
				v32:set(v44);
			end):andThenReturn(v41):andThen(function(v45) --[[ Line: 208 ]]
				if v45.inGame then
					v33:set(v45);
				end;
			end);
		end;
	end;
	local v47 = v4.State(false);
	local v48 = v4.State(false);
	local v49 = "";
	local v50 = "";
	local v52 = v8({
		Name = "BanReason", 
		PlaceholderText = v4.Computed(function() --[[ Line: 221 ]]
			if v47:get() then
				return "Ban Reason (required)";
			else
				return "Ban Reason";
			end;
		end), 
		Red = false, 
		Visible = v34, 
		TextEditable = v37, 
		HighlightError = v47, 
		Text = v4.Computed(function() --[[ Line: 228 ]]
			if v32:get() and v32:get().isBanned then
				return v32:get().newReason or "";
			else
				return "";
			end;
		end), 
		TextChanged = function(v51) --[[ Line: 236 ]] --[[ Name: TextChanged ]]
			v47:set(false);
			v49 = v51;
		end
	});
	local function _() --[[ Line: 241 ]] --[[ Name: funnyForeverString ]]
		local v53 = {
			"pls donate 3 comes out"
		};
		return v53[math.random(1, #v53)];
	end;
	local function sda(v55) --[[ Line: 247 ]] --[[ Name: formatBannedTil ]]
		return v55:FormatLocalTime("LL", l_Players_0.LocalPlayer.LocaleId);
	end;
	local v60 = v8({
		Name = "BanDuration", 
		PlaceholderText = "Ban duration in days, leave blank for forever", 
		Red = false, 
		Visible = v34, 
		TextEditable = v37, 
		HighlightError = v48, 
		Text = v4.Computed(function() --[[ Line: 257 ]]
			if v32:get() and v32:get().isBanned then
				local v57;
				if v32:get().bannedTil then
					v57 = v32:get().bannedTil:FormatLocalTime("LL", l_Players_0.LocalPlayer.LocaleId);
				else
					local v58 = {
						"pls donate 3 comes out"
					};
					v57 = v58[math.random(1, #v58)];
				end;
				return (("Banned until %*"):format(v57));
			else
				return "";
			end;
		end), 
		TextChanged = function(v59) --[[ Line: 268 ]] --[[ Name: TextChanged ]]
			v48:set(false);
			v50 = v59;
		end
	});
	local v61 = v4.State(0);
	return v4.New("Frame")({
		Name = "AdminPanel", 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.45), 
		Size = UDim2.new(0.95, 0, 0, 450), 
		BackgroundColor3 = v6.Background, 
		Visible = v30.Visible, 
		[v4.Children] = {
			v4.New("UICorner")({
				CornerRadius = UDim.new(0, 10)
			}), 
			v4.New("UIPadding")({
				PaddingTop = UDim.new(0, 20)
			}), 
			v4.New("UISizeConstraint")({
				MaxSize = Vector2.new(450, 1e999)
			}), 
			v4.New("ScrollingFrame")({
				Name = "Players", 
				ScrollingDirection = Enum.ScrollingDirection.Y, 
				AutomaticCanvasSize = Enum.AutomaticSize.Y, 
				ScrollBarThickness = v6.ScrollBarThickness, 
				ScrollBarImageColor3 = v6.ScrollBar, 
				CanvasSize = UDim2.new(), 
				BackgroundTransparency = 1, 
				Size = v4.Computed(function() --[[ Line: 298 ]]
					return UDim2.new(1, -1, 1, -v61:get() - 12);
				end), 
				[v4.Children] = {
					v4.New("UIGridLayout")({
						CellSize = UDim2.new(0.5, -8, 0, 50), 
						CellPadding = UDim2.fromOffset(15, 15), 
						SortOrder = Enum.SortOrder.Name
					}), 
					v4.New("UIPadding")({
						PaddingLeft = UDim.new(0, 24), 
						PaddingRight = UDim.new(0, 24)
					}), 
					v4.ComputedPairs(v30.Players, function(_, v63) --[[ Line: 312 ]]
						return v10({
							UserId = v63.UserId, 
							DisplayName = v63.DisplayName, 
							Username = v63.Name, 
							IsSelected = v4.Computed(function() --[[ Line: 317 ]]
								if v31:get() ~= nil then
									return v31:get().Id == v63.UserId;
								else
									return;
								end;
							end), 
							OnActivated = function() --[[ Line: 322 ]] --[[ Name: OnActivated ]]
								v31:set({
									DisplayName = v63.DisplayName, 
									Username = v63.Name, 
									Id = v63.UserId, 
									InServer = true
								});
								v32:set({
									reason = "", 
									isBanned = false
								});
							end
						});
					end)
				}
			}), 
			v4.New("Frame")({
				Name = "Bottom", 
				AutomaticSize = Enum.AutomaticSize.Y, 
				AnchorPoint = Vector2.new(0, 1), 
				Position = UDim2.fromScale(0, 1), 
				Size = UDim2.fromScale(1, 0), 
				BackgroundColor3 = v6.Background, 
				[v4.OnChange("AbsoluteSize")] = function(v64) --[[ Line: 347 ]]
					v61:set(v64.Y);
				end, 
				[v4.Children] = {
					v4.New("UICorner")({
						CornerRadius = UDim.new(0, 10)
					}), 
					v4.New("UIListLayout")({
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 6)
					}), 
					v4.New("UIPadding")({
						PaddingBottom = UDim.new(0, 20), 
						PaddingLeft = UDim.new(0, 24), 
						PaddingRight = UDim.new(0, 24)
					}), 
					v8({
						Name = "UserSearch", 
						PlaceholderText = "Search Roblox Users", 
						OnTextEntered = function(v65) --[[ Line: 365 ]] --[[ Name: OnTextEntered ]]
							local function _(v66) --[[ Line: 366 ]] --[[ Name: userInfoById ]]
								return l_UserService_0:GetUserInfosByUserIdsAsync({
									v66
								})[1];
							end;
							local _ = function(_) --[[ Line: 370 ]] --[[ Name: userInfoByName ]]
								local l_l_Players_0_UserIdFromNameAsync_0 = l_Players_0:GetUserIdFromNameAsync(v65);
								return l_UserService_0:GetUserInfosByUserIdsAsync({
									l_l_Players_0_UserIdFromNameAsync_0
								})[1];
							end;
							local v71 = nil;
							if v65:sub(1, 1) == "@" then
								local _ = v65:sub(2, #v65);
								local l_l_Players_0_UserIdFromNameAsync_1 = l_Players_0:GetUserIdFromNameAsync(v65);
								v71 = l_UserService_0:GetUserInfosByUserIdsAsync({
									l_l_Players_0_UserIdFromNameAsync_1
								})[1];
							else
								if tonumber(v65) ~= nil then
									pcall(function() --[[ Line: 382 ]]
										local v74 = tonumber(v65);
										v71 = l_UserService_0:GetUserInfosByUserIdsAsync({
											v74
										})[1];
									end);
								end;
								if v71 == nil then
									local l_l_Players_0_UserIdFromNameAsync_2 = l_Players_0:GetUserIdFromNameAsync(v65);
									v71 = l_UserService_0:GetUserInfosByUserIdsAsync({
										l_l_Players_0_UserIdFromNameAsync_2
									})[1];
								end;
							end;
							if v71 then
								local v76 = l_Players_0:GetPlayerByUserId(v71.Id) ~= nil;
								v71.InServer = v76;
								v31:set(v71);
								v46();
							end;
						end, 
						Visible = v4.Computed(function() --[[ Line: 399 ]]
							return v31:get() == nil;
						end)
					}), 
					v4.Computed(function() --[[ Line: 403 ]]
						if v31:get() then
							return v7({
								DisplayName = v31:get().DisplayName, 
								Username = v31:get().Username, 
								UserId = v31:get().Id, 
								OnActivated = function() --[[ Line: 409 ]] --[[ Name: OnActivated ]]
									v31:set(nil);
									v32:set(nil);
									v47:set(false);
									v48:set(false);
									v33:set({
										inGame = false
									});
									v39:cancel();
								end, 
								Visible = v4.Computed(function() --[[ Line: 417 ]]
									return v31:get() ~= nil;
								end)
							});
						else
							return;
						end;
					end), 
					v52, 
					v60, 
					v13({
						Visible = v37, 
						OnActivated = function() --[[ Line: 427 ]] --[[ Name: OnActivated ]]
							if v49 == "" then
								v52:CaptureFocus();
								v47:set(true);
								return;
							else
								local v77 = nil;
								if v50 ~= "" then
									local v78 = tonumber(v50);
									if v78 == nil then
										v60:CaptureFocus();
										v48:set(true);
										return;
									else
										v77 = v50 or -1;
									end;
								end;
								local l_Id_0 = v31:get().Id;
								v30.BanUser(l_Id_0, if v49 == "" then nil else v49, v77);
								v32:set({
									banReason = v49, 
									--bannedTil = v77, 
									isBanned = true
								});
								return;
							end;
						end
					}), 
					v16({
						Visible = v38, 
						OnActivated = function() --[[ Line: 454 ]] --[[ Name: OnActivated ]]
							local l_Id_1 = v31:get().Id;
							v30.UnbanUser(l_Id_1);
							v32:set({
								isBanned = false
							});
						end
					}), 
					v23({
						Visible = v35, 
						OnActivated = function() --[[ Line: 464 ]] --[[ Name: OnActivated ]]
							local l_Id_2 = v31:get().Id;
							v30.KickUser(l_Id_2);
						end
					}), 
					v26({
						Visible = v34, 
						OnActivated = function() --[[ Line: 471 ]] --[[ Name: OnActivated ]]
							v30.ViewBooth(v31:get());
						end
					}), 
					v20({
						Visible = v4.Computed(function() --[[ Line: 476 ]]
							return v33:get().inGame;
						end), 
						PlaceId = v4.Computed(function() --[[ Line: 479 ]]
							return v33:get().placeId;
						end), 
						OnActivated = function() --[[ Line: 482 ]] --[[ Name: OnActivated ]]
							local l_Id_3 = v31:get().Id;
							v30.JoinUserServer(l_Id_3);
						end
					}),
					v200({
						Visible = v4.Computed(function() --[[ Line: 476 ]]
							return v33:get().inGame;
						end), 
						PlaceId = v4.Computed(function() --[[ Line: 479 ]]
							return v33:get().placeId;
						end), 
						OnActivated = function() --[[ Line: 482 ]] --[[ Name: OnActivated ]]
							local l_Id_3 = v31:get().Id;
							v30.SummonUserToServer(l_Id_3);
						end
					})
				}
			})
		}
	});
end;