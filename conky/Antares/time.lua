words = {"Ein ", "Zwei ", "Drei ", "Vier ", "Fünf ", "Sechs ", "Sieben ", "Acht ", "Neun "}
levels = {"THOUSAND ", "MILLION ", "BILLION ", "TRILLION ", "QUADRILLION ", "QUINTILLION ", "SEXTILLION ", "SEPTILLION ", "OCTILLION ", [0] = ""}
iwords = {"Zehn ", "Zwanzig ", "Dreißig ", "Vierzig ", "Fünfzig ", "Sechzig ", "Siebzig ", "Achtzig ", "Neunzig "}
twords = {"Elf ", "Zwölf ", "Dreizehn ", "Vierzehn ", "Fünfzehn ", "Sechzehn ", "Siebzehn ", "Achtzehn ", "Neunzehn "}

function digits(n)
  local i, ret = -1
  return function()
    i, ret = i + 1, n % 10
    if n > 0 then
      n = math.floor(n / 10)
      return i, ret
    end
  end
end

level = false
function getname(pos, dig)
  level = level or pos % 3 == 0
  if(dig == 0) then return "" end
  local name = (pos % 3 == 1 and iwords[dig] or words[dig]) .. (pos % 3 == 2 and "HUNDRED " or "")
  if(level) then name, level = name .. levels[math.floor(pos / 3)], false end
  return name
end

function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function numberToWord(number)
    if(number == 0) then return "Null " end
    vword = ""
    for i, v in digits(number) do
      vword = getname(i, v) .. vword
    end

    for i, v in ipairs(words) do
      vword = vword:gsub("ig " .. v, "ig-" .. v)
      vword = vword:gsub("Zehn " .. v, twords[i])
    end

    if string.find(vword, "-") then
        split_string = Split(vword, "-")
        split_string[2] = split_string[2]:gsub(" ", "")
        vword = (split_string[2] .. "-und-" .. split_string[1])
    end
    return vword
end

function conky_Hour()
    return numberToWord(os.date("%H") + 0)
end

function conky_Minute()
    return numberToWord(os.date("%M") + 0)
end

function conky_Date()
    return numberToWord(os.date("%d") + 0)
end
