#use escape sequences to print color
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

NC='\033[0m' # No Color

echo -e "This is some ${RED}red text${NC}.\n "
echo -e "This is some ${BLUE}blue text${NC}.\n "
echo -e "This is some ${GREEN}green text${NC}.\n "
echo -e "This is some ${YELLOW}yellow text${NC}.\n "
