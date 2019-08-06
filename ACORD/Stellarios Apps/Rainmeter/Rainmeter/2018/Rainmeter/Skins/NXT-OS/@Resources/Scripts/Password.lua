function Initialize()
	StoredPassword = SELF:GetOption('StoredPassword')
	StoredSalt = SELF:GetOption('StoredSalt')
	if StoredPassword ~= nil then
		if StoredPassword ~= "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" then
			SKIN:Bang(SELF:GetOption('HasPasswordAction'))
		end
	end
	if StoredPassword == nil then
		SKIN:Bang(SELF:GetOption('DoesNotHavePassword'))
	end
	if StoredPassword == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" then
		SKIN:Bang(SELF:GetOption('DoesNotHavePassword'))
	end
end

function auth()
	password = SELF:GetOption('Input') .. StoredSalt
	if StoredPassword ~= nil then
		enter = sha256(password)
		if StoredPassword == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" then
			if sha256(password) == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" then
				SKIN:Bang(SELF:GetOption('CorrectAction'))
			else
				SKIN:Bang(SELF:GetOption('IncorrectAction'))
			end
		elseif StoredPassword == "" then
			SKIN:Bang(SELF:GetOption('CorrectAction'))
		elseif enter == StoredPassword then
			SKIN:Bang(SELF:GetOption('CorrectAction'))
		else 
			SKIN:Bang(SELF:GetOption('IncorrectAction'))
		end
	end
end

--  
--  Adaptation of the Secure Hashing Algorithm (SHA-244/256)
--  Found Here: http://lua-users.org/wiki/SecureHashAlgorithm
--  
--  Using an adapted version of the bit library
--  Found Here: https://bitbucket.org/Boolsheet/bslf/src/1ee664885805/lua
--  

local MOD = 2^32
local MODM = MOD-1

function memoize(f)
	local mt = {}
	local t = setmetatable({}, mt)
	function mt:__index(k)
		local v = f(k)
		t[k] = v
		return v
	end
	return t
end

function make_bitop_uncached(t, m)
	function bitop(a, b)
		local res,p = 0,1
		while a ~= 0 and b ~= 0 do
			local am, bm = a % m, b % m
			res = res + t[am][bm] * p
			a = (a - am) / m
			b = (b - bm) / m
			p = p*m
		end
		res = res + (a + b) * p
		return res
	end
	return bitop
end

function make_bitop(t)
	local op1 = make_bitop_uncached(t,2^1)
	local op2 = memoize(function(a) return memoize(function(b) return op1(a, b) end) end)
	return make_bitop_uncached(op2, 2 ^ (t.n or 1))
end

local bxor1 = make_bitop({[0] = {[0] = 0,[1] = 1}, [1] = {[0] = 1, [1] = 0}, n = 4})

function bxor(a, b, c, ...)
	local z = nil
	if b then
		a = a % MOD
		b = b % MOD
		z = bxor1(a, b)
		if c then z = bxor(z, c, ...) end
		return z
	elseif a then return a % MOD
	else return 0 end
end

function band(a, b, c, ...)
	local z
	if b then
		a = a % MOD
		b = b % MOD
		z = ((a + b) - bxor1(a,b)) / 2
		if c then z = band(z, c, ...) end
		return z
	elseif a then return a % MOD
	else return MODM end
end

function bnot(x) return (-1 - x) % MOD end

function lshift(a, disp)
	if disp < 0 then return rshift(a,-disp) end 
	return (a * 2 ^ disp) % 2 ^ 32
end

function rrotate(n, b)
	local s = n/(2^b)
	local f = s%1
	return (s-f) + f*MOD
end
function brshift(int, by) 
	local shifted = int / (2^by)
	return shifted-shifted%1
end

local H = {
	0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
	0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19,
}

local K = {
	0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
	0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
	0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
	0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
	0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
	0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
	0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
	0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
}

function incr(t, incr)
	if 0xFFFFFFFF - t[1] < incr then
		t[2] = t[2] + 1
		t[1] = incr - (0xFFFFFFFF - t[1]) - 1		
	else t[1] = t[1] + incr
	end
	return t
end

function preprocess(data)
	local len = #data

	data[#data+1] = 0x80
	while #data%64~=56 do data[#data+1] = 0 end
	local l = incr({0,0}, len*8)
	for i = 2, 1, -1 do
		data[#data+1] = band(brshift(band(l[i], 0xFF000000), 24), 0xFF)
		data[#data+1] = band(brshift(band(l[i], 0xFF0000), 16), 0xFF)
		data[#data+1] = band(brshift(band(l[i], 0xFF00), 8), 0xFF)
		data[#data+1] = band(l[i], 0xFF)
	end
	return data
end

function BE_toInt(bs, i)
	return lshift((bs[i] or 0), 24) + lshift((bs[i+1] or 0), 16) + lshift((bs[i+2] or 0), 8) + (bs[i+3] or 0)
end

function digestblock(data, i, C)
	local w = {}
	for j = 1, 16 do w[j] = BE_toInt(data, i+(j-1)*4) end
	for j = 17, 64 do
		local v = w[j-15]
		local s0 = bxor(bxor(rrotate(w[j-15], 7), rrotate(w[j-15], 18)), brshift(w[j-15], 3))
		local s1 = bxor(bxor(rrotate(w[j-2], 17), rrotate(w[j-2], 19)), brshift(w[j-2], 10))
		w[j] = (w[j-16] + s0 + w[j-7] + s1)%MOD
	end
	local a, b, c, d, e, f, g, h = unpack(C)
	for j = 1, 64 do
		local S1 = bxor(bxor(rrotate(e, 6), rrotate(e, 11)), rrotate(e, 25))
		local ch = bxor(band(e, f), band(bnot(e), g))
		local temp1 = (h + S1 + ch + K[j] + w[j])%MOD
		local S0 = bxor(bxor(rrotate(a, 2), rrotate(a, 13)), rrotate(a, 22))
		local maj = bxor(bxor(band(a, b), band(a, c)), band(b, c))
		local temp2 = (S0 + maj)%MOD
		h, g, f, e, d, c, b, a = g, f, e, (d+temp1)%MOD, c, b, a, (temp1+temp2)%MOD
	end
	C[1] = (C[1] + a)%MOD
	C[2] = (C[2] + b)%MOD
	C[3] = (C[3] + c)%MOD
	C[4] = (C[4] + d)%MOD
	C[5] = (C[5] + e)%MOD
	C[6] = (C[6] + f)%MOD
	C[7] = (C[7] + g)%MOD
	C[8] = (C[8] + h)%MOD
	return C
end

function sha256(data)
	data = data or ""
	data = type(data) == "string" and {data:byte(1,-1)} or data

	data = preprocess(data)
	local C = {unpack(H)}
	for i = 1, #data, 64 do C = digestblock(data, i, C) end
	return (("%08x"):rep(8)):format(unpack(C))
end