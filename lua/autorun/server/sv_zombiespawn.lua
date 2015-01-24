local ZombieSpawnPoints = {

    { pos = Vector( 0, 0, 0 ) }, --Add as many as you like... Get the vectors by typing "getpos" in console.
}

local numZombies = 0
local maxZombies = 150

function ZombieSpawns()

     timer.Create( "Respawner", 10, 10, function()

        if ( numZombies < maxZombies ) then

            for k, v in pairs( ZombieSpawnPoints ) do

                    local zombie = ents.Create( "npc_zombie" )
                    zombie:SetPos( v.pos )
                    zombie:SetCustomCollisionCheck( true )
                    zombie:Spawn()
                    zombie:Activate()

                    numZombies = numZombies + 1

            end

        end

    end )
    
end

hook.Add( "ShouldCollide", "NPCNoCollide", function( ent1, ent2 )

    if ( ent1:GetClass() == "npc_zombie" and ent2:GetClass() == "npc_zombie" ) then

        return false

    end

end )

hook.Add( "InitPostEntity", "StartZombieSpawning", ZombieSpawns )

hook.Add( "ShouldCollide", "NPCNoCollide", function( ent1, ent2 )

    if ( ent1:GetClass() == "npc_zombie" and ent2:GetClass() == "npc_zombie" ) then 

        return false

    end

end )

hook.Add( "InitPostEntity", "StartZombieSpawning", ZombieSpawns )
