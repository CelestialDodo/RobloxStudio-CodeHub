local Module = {}

function Module.Print(text, delay)
  if delay and delay > 0 then
    task.wait(delay)
  end
  print(text)
end

return Module
