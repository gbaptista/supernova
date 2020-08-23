set -e

echo "Runing Lua examples..."
bash -e _examples/lua/run.sh > /dev/null

echo "Runing Shell examples..."
bash -e _examples/shell/run.sh > /dev/null

echo "Runing Fennel examples..."
bash -e _examples/fennel/run.sh > /dev/null

echo "All examples were successful."
