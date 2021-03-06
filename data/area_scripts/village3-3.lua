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
	door = Door:new{number=2, x=192, y=112, base_height=16, anim_set="homedoor_s"}
	portal = Object:new{number=3, x=192, y=112, width=16, base_height=8}
	chicken = Object:new{number=4, x=58, y=66, move_type=MOVE_WANDER, anim_set="chicken", rest=2000}
	makeCharacter(4)
	well = Object:new{number=5, x=272, y=160, width=16, base_height=16}
	setMilestone(MS_CHECKED_WELL, true)
end

function update(step)
	door:update(step)
	chicken:move(step);
end

function activate(activator, activated)
	if (activated == 5) then
		doDialogue("Coro: ENYYY!!! ... ENYYY!!!$")
	elseif (activated == 4) then
		doDialogue("BAACAAA!!!$")
	elseif (activated == 2) then
		door:activate()
	end
end

function collide(obj1, obj2)
	if ((obj1 == 1 and obj2 == 3) or (obj1 == 3 and obj2 == 1)) then
		fadeOut()
		startArea("heroshome")
		setObjectPosition(1, 144, 224)
		fadeIn()
	elseif ((obj1 == 1 and obj2 == 2) or (obj1 == 2 and obj2 == 1)) then
		if (objectIsSolid(2)) then
			door:activate()
		end
	end
end

function stop()
end
