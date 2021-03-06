--
-- Copyright (c) 2007, Trent Gamblin
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
--    -- Redistributions of source code must retain the above copyright
--       notice, this list of conditions and the following disclaimer.
--    -- Redistributions in binary form must reproduce the above copyright
--       notice, this list of conditions and the following disclaimer in the
--       documentation and/or other materials provided with the distribution.
--    -- Neither the name of the <organization> nor the
--       names of its contributors may be used to endorse or promote products
--       derived from this software without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY <copyright holder> ``AS IS'' AND ANY
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL <copyright holder> BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--

function start()
	startMusic("village.ogg")
	portal = Object:new{number=2, x=96, y=96, width=TILE_SIZE, base_height=8}
	goldchest = Chest:new{number=3, x=112, y=160, base_height=16, anim_set="chest", milestone=MS_OLDMANS_GOLD, itemtype=ITEM_GOLD, quantity=10}
	swordchest = Chest:new{number=4, x=144, y=160, base_height=16, anim_set="chest", milestone=MS_OLDMANS_SWORD, id=ITEM_OLDMANS_SWORD}
end

function stop()
end

function update(step)
end

function collide(obj1, obj2)
	if ((obj1 == 1 and obj2 == 2) or (obj1 == 2 and obj2 == 1)) then
		fadeOut()
		setObjectPosition(1, 96, 112)
		setObjectDirection(1, DIRECTION_SOUTH)
		startArea("oldmanshome1")
		fadeIn()
	end
end

function activate(activator, activated)
	if (activated == 3) then
		goldchest:activate()
	elseif (activated == 4) then
		swordchest:activate()
	end
end
