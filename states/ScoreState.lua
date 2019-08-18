--[[
    ScoreState Class

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:init()
    self.bronzea = love.graphics.newImage('bronzea.png')
    self.width = self.bronzea:getWidth()
    self.height = self.bronzea:getHeight()
    self.silvera = love.graphics.newImage('silvera.png')
    self.width = self.silvera:getWidth()
    self.height = self.silvera:getHeight()
    self.golda = love.graphics.newImage('golda.png')
    self.width = self.golda:getWidth()
    self.height = self.golda:getHeight()
    self.platinuma = love.graphics.newImage('platinuma.png')
    self.width = self.platinuma:getWidth()
    self.height = self.platinuma:getHeight()
    self.amethysta = love.graphics.newImage('amethysta.png')
    self.width = self.amethysta:getWidth()
    self.height = self.amethysta:getHeight()
    self.diamonda = love.graphics.newImage('diamonda.png')
    self.width = self.diamonda:getWidth()
    self.height = self.diamonda:getHeight()

    self.x = VIRTUAL_WIDTH / 2 - 8
    self.y = VIRTUAL_HEIGHT / 2 - 8

end


function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    if self.score > 5 then
        love.graphics.draw(self.bronzea, 243, 115)
    end
    if self.score > 10 then
        love.graphics.draw(self.silvera, 213, 115)
    end
    if self.score > 15 then
        love.graphics.draw(self.golda, 273, 115)
    end
    if self.score > 20 then
        love.graphics.draw(self.platinuma, 228, 145)
    end
    if self.score > 25 then
        love.graphics.draw(self.amethysta, 258, 145)
    end
    if self.score > 30 then
        love.graphics.draw(self.diamonda, 243, 175)
    end
    love.graphics.printf('Press Enter to Play Again!', 0, 220, VIRTUAL_WIDTH, 'center')
end