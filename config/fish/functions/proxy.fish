function proxy
  set -xg ALL_PROXY http://localhost:7890
end
​
function noproxy
  set -e ALL_PROXY
end
