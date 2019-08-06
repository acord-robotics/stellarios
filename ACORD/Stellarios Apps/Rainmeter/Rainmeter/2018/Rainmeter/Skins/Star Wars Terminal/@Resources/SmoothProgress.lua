function Initialize()
   UpdatePeriod = SELF:GetNumberOption('UpdatePeriod', 1000)
   ResetInterval = SELF:GetNumberOption('ResetInterval', 10)
   SafetyRange = SELF:GetNumberOption('SafetyRange', 2)
   Adjustment = SELF:GetNumberOption('Adjustment', 1)

   mDuration = SKIN:GetMeasure('mDuration')
   mPosition = SKIN:GetMeasure('mPosition')
   mState = SKIN:GetMeasure('mPlayerState')

   Counter = -1
   Fake = 0
end

function Update()
   local Total = mDuration:GetValue()
   local Real = mPosition:GetValue()
   local State = mState:GetValue() == 1 and 1 or 0
   local Stopped = mState:GetValue() == 0 and 1 or 0

   Counter = (Counter + 1) % (ResetInterval * (1000/UpdatePeriod))

   if Stopped == 1 then
      Fake = 0
   elseif Counter == 0 or math.abs(Fake-Real)>SafetyRange then
      Fake = Real
   else
      Fake = Fake + State * (UpdatePeriod/1000) * Adjustment
   end

   return Fake / Total
end

--by Kaelri (Kaelri@gmail.com)